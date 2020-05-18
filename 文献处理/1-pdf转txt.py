import os,fnmatch,datetime,traceback
from win32com import client as wc
from win32com.client import Dispatch,gencache


#从temporary输出到temporary_out

def Pdf2Txt(filePath,savePath=''):
    # 1 切分文件目录和文件名
    dirs,filename = os.path.split(filePath)

    # 2 修改转化后的文件名
    new_name = ""
    if fnmatch.fnmatch(filename,'*.pdf') or fnmatch.fnmatch(filename,'*.PDF'):
        new_name = filename[:-4]+'.txt' # 截取".pdf"之前的文件名
    else: return
    print('新的文件名：',new_name)

    # 3 文件转化后的保存路径
    if savePath=="": savePath = dirs
    else: savePath = savePath
    pdf_to_txt = savePath + '/' + new_name
    print('保存路径：',pdf_to_txt)

    # 4 加载处理应用,pdf转化txt
    wordapp = wc.Dispatch('Word.Application')
    mytxt = wordapp.Documents.Open(filePath)
    mytxt.SaveAs(pdf_to_txt,4)
    mytxt.Close()

#删除目录下所有文件
def del_file(path):
    ls = os.listdir(path)
    for i in ls:
        c_path = os.path.join(path, i)
        if os.path.isdir(c_path):
            del_file(c_path)
        else:
            os.remove(c_path)



if __name__=='__main__':
    # 使用绝对路径
    path = "C:/Users/jjwjj/Desktop/毕业论文/Superalloy/superalloy_project/PDFs"
    path_out = "C:/Users/jjwjj/Desktop/毕业论文/Superalloy/superalloy_project/1-PDF转TXT"
           #Superalloys 2008 (Eleventh International Symposium)"  # 文件夹目录
    files = os.listdir(path)
    i = 0
    l = len(os.listdir(path))
    for file in files:
        if file[:2]=="~$":
            l = l - 1
            continue
        i = i + 1
        now_time = datetime.datetime.now()
        print(now_time)
        filePath = path + '/' + file
        print('目标路径: ', filePath)

        try:
            Pdf2Txt(os.path.abspath(filePath), os.path.abspath(path_out))
            print("处理成功")
        except :
            traceback.print_exc()
            print(' ')
            print("Error!!!  ",file)
            continue
    print('处理文件数 ', i, '/', l)

    print('处理结束')
