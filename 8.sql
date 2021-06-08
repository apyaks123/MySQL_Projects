SELECT DISTINCT
    Profession as 'Professions in Music Industry'
FROM
    artists
WHERE
    Profession NOT IN (SELECT 
            Profession
        FROM
            artists
        WHERE
            profession LIKE 'R%');