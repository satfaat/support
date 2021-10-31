-- Output all tables
SELECT
table_name from information_schema.tables tb
where tb.table_schema = 'fin_calc'
order by table_name;

-- Output column name and data type
select 
column_name, 
data_type
from information_schema.columns
WHERE table_schema = 'fin_calc'
and table_name = 'some table name'
