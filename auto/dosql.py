import sqlite3
import pprint


def show_sql_data(sql_query: str):
    """Take sql query as argument
     and display result"""

    # vars
    db_path = '../../.dbs/sqlite/links.db'

    # connection to database
    conn = sqlite3.connect(db_path)
    print(f'connected to {db_path}')
    cursor = conn.cursor()

    # retrieve data with query to show up data in table
    cursor.execute(sql_query)  # run query
    data_all = cursor.fetchall()  # display result
    pprint.pprint(data_all)


tables_q = "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name;"
disp_logs = '''
select * from logs;
'''

#show_sql_data(tables_q)
#show_sql_data(disp_logs)



data = {
    'animal': 'dog',
    'status': 'some',
    }

def test(dict):
    print(dict['animal'])

test(data)