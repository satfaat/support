## Links

[archlinux wiki](https://wiki.archlinux.org/index.php/improving_performance)
[ubuntu wiki ru](https://help.ubuntu.ru/wiki/ubuntu_optimization)
[ixbt opyimization](https://www.ixbt.com/live/games/optimizaciya-linux-dlya-igr.html)

[VSC ide find-in-files](https://docs.microsoft.com/en-us/visualstudio/ide/find-in-files?view=vs-2019)
[markdown](https://guides.github.com/features/mastering-markdown/)

#### sql:
[sqlite](https://www.sqlite.org/index.html)
[sqlitebrowser](https://sqlitebrowser.org/)
[sqlitetutorial](https://www.sqlitetutorial.net/)
[quickstart](https://www.sqlite.org/quickstart.html)
[datatype3](https://www.sqlite.org/datatype3.html)

#### tmp:
    http://joxi.ru/

## SQLITE:

```sql
    cd D:\devgit\devops\db\sqlite
    sqlite3  # start

	sqlite3 links.db
	.databases
	.tables

    .backup his_2020.db
        .restore his_2020.db
```

### END
`.quit`

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


## VS code

