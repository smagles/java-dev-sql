USE osbb;

INSERT INTO buildings(address, flats_count)
VALUES
    ('123 Hollywood Boulevard', 70),
    ('456 Hollywood Boulevard', 60),
    ('789 Hollywood Boulevard', 80);

INSERT INTO flats (number, square)
SELECT
    number,
    square
FROM (
    SELECT
        ROW_NUMBER() OVER () AS number,
     100 + floor(RAND() * 10)*10 AS square
    FROM (
        SELECT
            (units.n + tens.n * 10 + hundreds.n * 100) AS number
        FROM
            (SELECT 0 AS n UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) AS units,
            (SELECT 0 AS n UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) AS tens,
            (SELECT 0 AS n UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) AS hundreds
        LIMIT 70
    ) AS numbers
) AS flat_data;

INSERT INTO flats (number, square)
SELECT
    number,
    square
FROM (
    SELECT
        ROW_NUMBER() OVER () AS number,
     100 + floor(RAND() * 5)*10 AS square
    FROM (
        SELECT
            (units.n + tens.n * 10 + hundreds.n * 100) AS number
        FROM
            (SELECT 0 AS n UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) AS units,
            (SELECT 0 AS n UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) AS tens,
            (SELECT 0 AS n UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) AS hundreds
        LIMIT 60
    ) AS numbers
) AS flat_data;

INSERT INTO flats (number, square)
SELECT
    number,
    square
FROM (
    SELECT
        ROW_NUMBER() OVER () AS number,
     100 + floor(RAND() * 8)*10 AS square
    FROM (
        SELECT
            (units.n + tens.n * 10 + hundreds.n * 100) AS number
        FROM
            (SELECT 0 AS n UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) AS units,
            (SELECT 0 AS n UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) AS tens,
            (SELECT 0 AS n UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) AS hundreds
        LIMIT 80
    ) AS numbers
) AS flat_data;

INSERT INTO buildings_to_flat (building_id, flat_id)
SELECT
    buildings.id AS building_id,
    flats.id AS flat_id
FROM
    buildings
CROSS JOIN
    flats;


