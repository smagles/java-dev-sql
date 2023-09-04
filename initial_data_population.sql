INSERT INTO owners (first_name, last_name, has_right, ownership_count)
SELECT
    first_name,
    last_name,
    CASE WHEN RAND() < 0.5 THEN 1 ELSE 0 END,
    FLOOR(RAND() * 4) + 1
FROM sakila.actor
LIMIT 100;

INSERT INTO ownership_rights (owner_id, flat_id)
SELECT 
    owners.id AS owner_id,
    flats.id AS flat_id
FROM 
    owners
JOIN 
    flats
LEFT JOIN 
    ownership_rights ON owners.id = ownership_rights.owner_id AND flats.id = ownership_rights.flat_id
LEFT JOIN (
    SELECT 
        owner_id, 
        COUNT(*) AS owned_flats_count
    FROM 
        ownership_rights
    GROUP BY 
        owner_id
) AS owned_count
ON
    owners.id = owned_count.owner_id
WHERE 
    ownership_rights.id IS NULL
    AND (owned_count.owned_flats_count IS NULL OR owned_count.owned_flats_count < (SELECT ownership_count FROM owners WHERE owners.id = owners.id))
ORDER BY 
    RAND()
LIMIT 140;


INSERT INTO residents (first_name, last_name, has_right, owner_id)
SELECT
    first_name, 
    last_name,
    has_right,
    owners.id
FROM
    owners
ORDER BY RAND()
LIMIT 50;




