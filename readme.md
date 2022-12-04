# prj.name = support

#### tmp:
    http://joxi.ru/


```sql
-- show data in table:
    .headers on
    .mode column
    select * from table_name
```

```sql
CREATE TABLE lnk(
  id INT PRIMARY KEY NOT NULL,
  tags VARCHAR(255) NOT NULL,
  link Hyperlink NOT NULL,
  description TEXT,
  group CHAR(50));
```

tags
link
description
group