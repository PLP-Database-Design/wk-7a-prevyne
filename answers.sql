CREATE TABLE people_hobbies_1nf (
    person_id INT,
    name VARCHAR(100),
    hobby VARCHAR(50)
);

-- Populate the 1NF table by splitting the hobbies:

INSERT INTO people_hobbies_1nf (person_id, name, hobby)
SELECT id, name, SUBSTRING_INDEX(SUBSTRING_INDEX(hobbies, ',', n), ',', -1)
FROM non_1nf_people
CROSS JOIN (
    SELECT 1 AS n UNION ALL
    SELECT 2 UNION ALL
    SELECT 3 -- Add more numbers if needed for max hobbies
) AS numbers
WHERE LENGTH(hobbies) - LENGTH(REPLACE(hobbies, ',', '')) >= numbers.n - 1;
