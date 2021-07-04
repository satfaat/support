import shutil
from bs4 import BeautifulSoup


# raw string
# src = r'D:\devgit\devops\sys_copy\one\tst.txt'
# dst = r'D:\devgit\devops\sys_copy\two\tst.txt'
#shutil.copyfile(src, dst)
#print('file copied')



with open("config/tst.xml", "r") as f:
    content = f.read()
    bs_content = BeautifulSoup(content, 'xml')
    file_data = bs_content.find_all('file')
    for dt in file_data:
        #print(dt.get('destination_path'))
        #print(dir(dt))
        #print(dt.attrs)
        #print(fr' = {dt.get("source_path")}\{dt.get("file_name")} + {dt.get("destination_path")}\{dt.get("file_name")}')
        src = f'{dt.get("source_path")}\\{dt.get("file_name")}'
        dst = f'{dt.get("destination_path")}\\{dt.get("file_name")}'
        shutil.copyfile(src, dst)
