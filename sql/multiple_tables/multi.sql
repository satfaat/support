-- JOINS

    -- syntax
    select *
    from tb_name_left tnl
        join tb_name_right tnr on tnl.col = tnr.col

-- SUB QUERIES
    SELECT * 
    FROM FamilyMembers 
    WHERE birthday = (SELECT MAX(birthday) FROM FamilyMembers);

    SELECT cols
    FROM tbl_1
    WHERE (tbl_1.col1, tbl_1.col2) = -- subquery
        (
            SELECT col1, col2 
            FROM tbl2 
            WHERE id = 10
        );

    SELECT cols FROM (subquery) as alias_name


-- just where as inner join

    SELECT *
    FROM Payments, FamilyMembers
    WHERE family_member = member_id;

-- CTE aka Common Table Expressions

    WITH Aeroflot_trips AS
        (SELECT TRIP.* FROM Company
            INNER JOIN Trip ON Trip.company = Company.id WHERE name = "Aeroflot")

    SELECT plane, COUNT(plane) AS amount FROM Aeroflot_trips GROUP BY plane;

    WITH Aeroflot_trips AS
        (SELECT plane, town_from, town_to FROM Company
            INNER JOIN Trip ON Trip.company = Company.id WHERE name = "Aeroflot")

    SELECT * FROM Aeroflot_trips;

    WITH Aeroflot_trips AS
        (SELECT TRIP.* FROM Company
            INNER JOIN Trip ON Trip.company = Company.id WHERE name = "Aeroflot"),
        Don_avia_trips AS
        (SELECT TRIP.* FROM Company
            INNER JOIN Trip ON Trip.company = Company.id WHERE name = "Don_avia")

    SELECT * FROM Don_avia_trips UNION SELECT * FROM  Aeroflot_trips;

-- UNION
    SELECT DISTINCT Goods.good_name AS name FROM Goods
    UNION
    SELECT DISTINCT FamilyMembers.member_name AS name FROM FamilyMembers;
