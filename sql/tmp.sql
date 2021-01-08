-- db = history

CREATE TABLE IF NOT EXISTS users
(id INTEGER PRIMARY KEY AUTOINCREMENT,
user_name TEXT,
user_info TEXT);

CREATE TABLE IF NOT EXISTS profiles
(id INTEGER PRIMARY KEY AUTOINCREMENT,
user_id INTEGER,
name VARCHAR(50),
info TEXT,
count_prof_in INTEGER);

CREATE TABLE IF NOT EXISTS logs
(id INTEGER PRIMARY KEY AUTOINCREMENT,
profile_id INTEGER,
time_action DATETIME,
link TEXT,
action TEXT);

INSERT INTO users ('user_name', 'user_info')
VALUES ('Ra', 'user one');

INSERT INTO profiles ('user_id', 'name', 'info', 'count_prof_in')
VALUES (1, 'prof 1', 'profile for user 1', 0);
INSERT INTO profiles ('user_id', 'name', 'info', 'count_prof_in')
VALUES (2, 'prof 2', 'profile for user 2', 0);

UPDATE profiles SET name = 'profile for user 2 edited'
WHERE id = 2;

select datetime('now', 'localtime');

INSERT INTO logs ('profile_id', 'time_action', 'link', 'action')
VALUES (1, datetime('now', 'localtime'), 'https://ya.ru', 'ok');

INSERT INTO logs ('profile_id', 'time_action', 'link', 'action')
VALUES (1, '2020-11-05 15:20:01', 'https://google.com', 'ok');

ALTER TABLE table_name ADD info TEXT;
ALTER TABLE table_name ADD result INTEGER;
ALTER TABLE old_name_for_table RENAME TO new_name;
ALTER TABLE table_name REMOVE COLUMN info;

BEGIN;
COMMIT;
ROLLBACK;

BEGIN;
DELETE FROM table_name WHERE id = 3;
ROLLBACK;

BEGIN TRANSACTION;
CREATE TABLE tmp(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    info TEXT
);
INSERT INTO tmp SELECT id, info FROM t_1;
DROP TABLE t_1;
ALTER TABLE tmp RENAME TO t_1;
COMMIT;

CREATE TRIGGER run AFTER INSERT ON logs
BEGIN
    UPDATE profiles SET count = count + 1
    WHERE id = (SELECT profile_id FROM logs ORDER BY id DESC LIMIT 1);
END;

SELECT name FROM aqlite_master WHERE type = 'trigger';