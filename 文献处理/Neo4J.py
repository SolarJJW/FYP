import os,datetime
import re, nltk, nltk.data
from string import digits

from nltk.corpus import stopwords
from nltk.tokenize import WordPunctTokenizer
import json
import pymongo
from py2neo import Graph, Node, Relationship,Subgraph
#mongodb操作
client = pymongo.MongoClient(host='127.0.0.1',port=27017)
db = client.essaysave
collections = db.essays
# 导入扩展库
import re # 正则表达式库
import wordcloud # 词云展示库
import matplotlib.pyplot as plt # 图像展示库




#分句工具
def splitSentence(paragraph):
    tokenizer = nltk.data.load('tokenizers/punkt/english.pickle')
    sentences = tokenizer.tokenize(paragraph)
    return sentences

#分词工具
def wordtokenizer(sentence):
    words = WordPunctTokenizer().tokenize(sentence)
    return words


if __name__ == '__main__':
    #时间戳
    now_time = datetime.datetime.now()
    #待处理路径
    path = "C:/Users/jjwjj/Desktop/毕业论文/Superalloy/superalloy_project/2-TXT转UDF-8"


    #目录下所有文件
    files = os.listdir(path)
    leni = 0
    l = len(os.listdir(path))
    i = 1
    #对目录下每个文件进行处理
    for file in files:
        if i != 1:
            break
        # mongo字典
        txt1 = {}
        leni = leni + 1
        if file[:1] == '~':
            leni = leni - 1
            l = l - 1
            continue
        #打印时间
        print(now_time)
        #构建文件输入输出目录
        filePath = path + '/' + file

        print('处理文件数 ', leni, ' / ', l)
        print('目标路径: ', filePath)
        pa = os.path.split(filePath)

        # 去除空行-------------------------------------
        ttext = ""
        with open(os.path.abspath(filePath), 'r+', encoding='UTF-8') as fr:

            # 实体
            class t:
                title = ""
                author = ""
                address = {}
                keywords = ""

            for text in fr.readlines():
                if text.split():
                    ttext += text
            fr.seek(0)
            fr.truncate()
            fr.write(ttext)
            fr.seek(0)

            # 统计-----------------------------------------
            # 行数
            line_counts = 0
            # 词数
            word_counts = 0
            # 字数
            character_counts = 0

            for line in fr:
                words = line.split()
                word_counts += len(words)
                character_counts += len(line)
            print("单词个数：", word_counts)

            # 关键词获取-----------------------------------
            fr.seek(0)
            txt = fr.readlines()
            n = 0
            for line in txt:
                n = n + 1
                if "Keywords:" in line:
                    t.keywords = line.split(" ", 1)[1]
                    break
                if "Key words:" in line:
                    t.keywords = line.split(" ", 1)[1]
                    break
            # 文献基本信息
            fr.seek(0)
            k = 1
            for lines in fr:
                if k == 1:
                    t.title = lines.strip('\n')
                if k == 2:
                    t.author = lines.strip('\n').replace('1', '').replace('2', '').replace('3', '').replace('4', '')
                if k >= 3 and k <= n:
                    t.address[k] = lines.strip('\n')
                if (k > n + 1):
                    break
                k = k + 1
            # 标题
            print("标题：", t.title)
            txt1["title"] = t.title
            # 作者
            for i in range(10):
                t.author.replace(str(i), '')
            print("作者：", t.author)
            txt1["author"] = t.author
            # 地址
            for i in range(3, n):
                if i == 3:
                    adr = "address" + str(i - 2)
                    txt1[adr] = t.address[i]
                    print("地址：", t.address[i])
                else:
                    adr = "address" + str(i - 2)
                    txt1[adr] = t.address[i]
                    print(t.address[i])
            # 关键词
            txt1["keywords"] = t.keywords

            print("关键词：", t.keywords)
            # 字数
            txt1["word_counts"] = str(word_counts)



            # neo4j-------------------------------------------------------------------
            g = Graph("bolt://127.0.0.1:7687", username="neo4j", password="jiji")
            iter = g.begin()

            nodes = []
            a = Node("文献名", title=t.title)
            iter.create(a)
            nodes.append(a)
            au = t.author.split(', ')
            for th in au:
                th = th.replace(" \n\r","")
                th.strip(" ")
                b = Node("作者", author=th)
                nodes.append(b)
                ab = Relationship(a, "本文作者", b)
                nodes.append(ab)
            key = t.keywords.split(', ')
            for ke in key:
                ke = ke.replace("\r","")
                ke = ke.replace("\n","")
                if ke == "" or ke == " ":
                    break;
                if ke[-1] == ' ':
                    ke = ke[:-1]
                ke.strip(' ')
                c = Node("关键词", keywords=ke)
                nodes.append(c)
                ac = Relationship(a, "本文关键词", c)
                nodes.append(ac)

            # 处理1 删除少于2个词的行，基本信息行，参考文献
            wordt = 0
            fr.seek(0)
            txt = fr.readlines()
            n1 = 1
            strr = ""
            for line in txt:
                if n1 < n + 1:
                    n1 = n1 + 1
                    continue
                if "References" in line:
                    break
                words = line.split()
                wordt = len(words)
                if wordt <= 2 and wordt >= 1:
                    n1 = n1 + 1
                    continue
                strr = strr + line
                n1 = n1 + 1
            strr = strr[:-1]
            strr.replace("\n","").replace("\r","")
            # print(strr)

            #去除特殊字符
            remove_chars = '[0-9’!"#$%&\'()*+-/:;<=>?@，。?★、…【】《》？“”‘’！[\\]^_`{|}~]+'

            txtspecial = re.sub(remove_chars, "", strr)
            # 分词分句
            t = wordtokenizer(txtspecial)
            fen = ""
            for i in range(len(t)):
                fen = fen + t[i]
                fen = fen + ","
            array = re.split('[,]', fen)
            dic = {}
            stop_words = set(stopwords.words('english'))
            for i in array:
                if i.lower() in stop_words:
                    continue
                if i not in dic:
                    dic[i] = 1
                else:
                    dic[i] += 1
            dic = sorted(dic.items(), key=lambda kv: (kv[1], kv[0]), reverse=True)


            for k,v in dic:
                if v >= 20:
                    c = Node("关键词", keywords=k)
                    nodes.append(c)
                    ac = Relationship(a, "本文关键词", c)
                    nodes.append(ac)
                else:
                    break


            print("Neo4J相关结束")
            nod = Subgraph(nodes)
            nod = Subgraph(relationships=nodes)
            iter.create(nod)
            iter.commit()

