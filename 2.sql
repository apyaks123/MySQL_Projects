SELECT 
    CONCAT(a.first_name, ' ', a.last_name) AS 'Actors in Star Wars'
FROM
    artists a
        JOIN
    movies m
WHERE
    m.title = 'Star Wars';