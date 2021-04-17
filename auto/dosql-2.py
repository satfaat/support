import sqlite3
import pprint



def show_sql_data(dict: dict):
    """Take sql query 
    and db path as arguments 
    and display result"""

    # connection to database
    conn = sqlite3.connect(dict['db_path'])
    print(f'connected to {dict["db_path"]}')
    cursor = conn.cursor()

    # retrieve data with query to show up data in table
    cursor.execute(dict['sql_query'])  # run query
    data_all = cursor.fetchall()  # display result
    pprint.pprint(data_all)


sql_tables = "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name;"
disp_logs = '''
select * from lnk;
'''
sql_select = disp_logs
data_sql = {
    'db_path': '../../.dbs/sqlite/links.db',
    'sql_query': sql_select,
}

show_sql_data(data_sql)

sql_select = sql_tables
data_sql = {
    'db_path': '../../.dbs/sqlite/links.db',
    'sql_query': sql_select,
}
show_sql_data(data_sql)


data = {
    'animal': 'dog',
    'status': 'some',
    }

def test(dict):
    print(dict['animal'])

#test(data)