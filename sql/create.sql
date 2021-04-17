CREATE TABLE IF NOT EXISTS users
(id INTEGER PRIMARY KEY AUTOINCREMENT,
group TEXT,
link TEXT,
desc_lnk TEXT,
tag TEXT);

CREATE TABLE table_name(
    column1 datatype
    column2 datatype,
    ...
    columnN datatype,
    PRIMARY KEY( columnName )
 );

use mySchema;
CREATE TABLE employee(
    empID int not null,
    empName varchar(25) not null,
    emailID varchar(25) not null,
    PRIMARY KEY (empID)
  );

-- Adding Values in an SQL Table
INSERT INTO employee
    VALUES (1, ‘John Matthews’, ‘john_matthews@muo.com’);