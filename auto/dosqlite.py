import sqlite3
from sqlite3.dbapi2 import Cursor


#conn = sqlite3.connect(':memory:')  # for testing
conn = sqlite3.connect('../../.dbs/sqlite/history_tmp.db')

cursor = conn.cursor()
#cursor.execute("""create table cheats()""")

cursor.execute("insert into cheats values(?, ?)", (dark_souls.code, dark_souls.desc))
cursor.execute("insert into cheats values(:code, :desc)", {'code': dark_souls.code, 'desc': dark_souls.desc})

cursor.execute("select * from dark_souls where code=?", ('god',))
cursor.execute("select * from dark_souls where code=:code", {'code': 'god',})

conn.commit()
conn.close()

def insert_data(data):
    with conn:
        cursor.execute("insert into cheats values(:code, :desc)", {'code': data.code, 'desc': data.desc})

def get_data(data):
    cursor.execute("select * from dark_souls where code=:code", {'code': data,})
    return cursor.fetchall()

def update_data(code, desc):
    with conn:
        cursor.execute("""UPDATE dark_souls SET code=:code
                        WHERE code=:code AND desc=:desc""",
                        {'code': code, 'desc': desc})

def remove_data(data):
    with conn:
        cursor.execute("DELETE FROM dark_souls WHERE code=:code AND desc=:desc",
                        {'code': data.code, 'desc': data.desc})