## Links

https://wiki.archlinux.org/index.php/improving_performance
https://help.ubuntu.ru/wiki/ubuntu_optimization
https://www.ixbt.com/live/games/optimizaciya-linux-dlya-igr.html

https://docs.microsoft.com/en-us/visualstudio/ide/find-in-files?view=vs-2019

tmp:
    http://joxi.ru/

# SQLITE:
    cd D:\devgit\devops\db\sqlite
    sqlite3  # start
	https://www.sqlite.org/index.html
	https://sqlitebrowser.org/
	https://www.sqlitetutorial.net/

	https://www.sqlite.org/quickstart.html
	https://www.sqlite.org/datatype3.html
		sqlite3 links.db
		.databases
		.tables

        .backup his_2020.db
            .restore his_2020.db
		
### END
.quit

show data in table:
    .headers on
    .mode column
    select * from table_name

CREATE TABLE lnk(
  id INT PRIMARY KEY NOT NULL,
  tags VARCHAR(255) NOT NULL,
  link Hyperlink NOT NULL,
  description TEXT,
  group CHAR(50));

tags
link
description
group

