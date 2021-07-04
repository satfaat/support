import shutil
from bs4 import BeautifulSoup


with open("config/tst.xml", "r") as f:
    content = f.read()
    bs_content = BeautifulSoup(content, 'xml')
    file_data = bs_content.find_all('file')
    for attr in file_data:
        src = f'{attr.get("source_path")}\\{attr.get("file_name")}'
        dst = f'{attr.get("destination_path")}\\{attr.get("file_name")}'
        shutil.copyfile(src, dst)