SELECT 
    owners.first_name,
    owners.last_name,
    owners.email,
    buildings.address, 
    flats.number,
    flats.square 
FROM owners 
JOIN ownership_rights ON owners.id = ownership_rights.owner_id
JOIN flats ON ownership_rights.flat_id = flats.id
JOIN buildings_to_flat ON flats.id = buildings_to_flat.flat_id
JOIN buildings ON buildings_to_flat.building_id = buildings.id
WHERE owners.has_right = 0 
AND owners.ownership_count < 2
AND owners.id NOT IN (
    SELECT owner_id FROM residents WHERE owner_id IS NOT NULL
);
