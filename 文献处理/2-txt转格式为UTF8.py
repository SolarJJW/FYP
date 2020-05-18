

#iconv.exe   下载好放在windows文件夹中
#存在 2-TXT转UDF-8 中
#C:/Users/jjwjj/Desktop/毕业论文/中间处理
#删除目录下所有文件
import os



val = os.system('cd C:\\Users\\jjwjj\\Desktop\\毕业论文\\Superalloy\\superalloy_project\\2-TXT转UDF-8 && for /r C:\\Users\\jjwjj\\Desktop\\毕业论文\\Superalloy\\superalloy_project\\1-PDF转TXT %i in (*.txt) do iconv.exe -f GBK -t UTF-8 %i > %~ni.txt')
print(val)



# os.system('for /r C:\\Users\\jjwjj\\Desktop\\毕业论文\\Superalloy\\superalloy_project\\TXTs %i in (*.txt) do iconv.exe -f GBK -t UTF-8 %i > %~ni.txt')
# cd C:\Users\jjwjj\Desktop\毕业论文\中间处理\2-TXT转UDF-8
# for /r C:\Users\jjwjj\Desktop\毕业论文\中间处理\1-PDF转TXT  %i in (*.txt) do iconv.exe -f GBK -t UTF-8 %i > %~ni.txt
# for i in "C:\Users\jjwjj\Desktop\毕业论文\中间处理\1-PDF转TXT"  do iconv.exe -f GBK -t UTF-8 %i > %~ni.txt
