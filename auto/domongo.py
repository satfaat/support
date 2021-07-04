import re
from pymongo import MongoClient

client = MongoClient('mongodb://localhost:27017/')
db = client['f_mongo']
cheats = db.cheats  # table name cheats

dark_souls = {
    'cheat':'god',
    'desc':'no damage',
}  # data in table
result = cheats.insert_one(dark_souls)
#print(result)

if result.acknowledged:
    print(f'document added, the id is: {result.inserted_id}')
