-- Making The database.
CREATE DATABASE conservation_db;
-- Making The Tables
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    "name" VARCHAR(100) NOT NULL,
    region VARCHAR(50) NOT NULL
);
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50) NOT NULL,
    scientific_name_name VARCHAR(50) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) NOT NULL
);
CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER REFERENCES rangers(ranger_id),
    species_id INTEGER REFERENCES species(species_id),
    sighting_time TIMESTAMP NOT NULL,
    "location" TEXT NOT NULL,
    notes TEXT
);
INSERT INTO rangers ("name", region)
VALUES ('Alice Green', 'Northern Hills'),
    ('Bob White', 'River Delta'),
    ('Carol King', 'Mountain Range');
INSERT INTO species (
        common_name,
        scientific_name_name,
        discovery_date,
        conservation_status
    )
VALUES (
        'Snow Leopard',
        'Panthera uncia',
        '1775-01-01',
        'Endangered'
    ),
    (
        'Bengal Tiger',
        'Panthera tigris tigris',
        '1758-01-01',
        'Endangered'
    ),
    (
        'Red Panda',
        'Ailurus fulgens',
        '1825-01-01',
        'Vulnerable'
    ),
    (
        'Asiatic Elephant',
        'Elephas maximus indicus',
        '1758-01-01',
        'Endangered'
    );
INSERT INTO sightings (
        species_id,
        ranger_id,
        "location",
        sighting_time,
        notes
    )
VALUES (
        1,
        1,
        'Peak Ridge',
        '2024-05-10 07:45:00',
        'Camera trap image captured'
    ),
    (
        2,
        2,
        'Bankwood Area',
        '2024-05-12 16:20:00',
        'Juvenile seen'
    ),
    (
        3,
        3,
        'Bamboo Grove East',
        '2024-05-15 09:10:00',
        'Feeding observed'
    ),
    (
        1,
        2,
        'Snowfall Pass',
        '2024-05-18 18:30:00',
        NULL
    );
-- PROBLEM #1.
INSERT INTO rangers ("name", region)
VALUES ('Derek Fox', 'Coastal Plains');
-- PROBLEM #2.
SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings;
-- PROBLEM #3.
SELECT *
FROM sightings
WHERE location LIKE '%Pass';
-- PROBLEM #4.
SELECT name,
    COUNT(sighting_id) AS total_sightings
FROM sightings
    NATURAL JOIN rangers
GROUP BY name
ORDER BY name ASC;
-- PROBLEM #5
SELECT common_name
FROM species
    LEFT JOIN sightings ON species.species_id = sightings.species_id
WHERE sighting_id IS NULL;
-- Problem #6
SELECT common_name,
    sighting_time,
    name
FROM sightings
    NATURAL JOIN rangers
    NATURAL JOIN species
ORDER BY sighting_time DESC
LIMIT 2;
-- Problem #7
UPDATE species
SET conservation_status = 'Historic'
WHERE EXTRACT(
        YEAR
        FROM discovery_date
    ) < 1800;
--Problem #8
SELECT sighting_id,
    CASE
        WHEN EXTRACT(
            HOUR
            FROM sighting_time
        ) < 12 THEN 'Morning'
        WHEN EXTRACT(
            HOUR
            FROM sighting_time
        ) BETWEEN 12 AND 16 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings;
-- Problem #9
DELETE FROM rangers
WHERE NOT EXISTS (
        SELECT ranger_id
        FROM sightings
        WHERE sightings.ranger_id = rangers.ranger_id
    );