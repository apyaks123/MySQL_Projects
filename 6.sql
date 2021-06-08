SELECT 
    title AS 'Title', YEAR(release_date) AS 'Year', Distributor
FROM
    movies m
WHERE
    m.movie_id IN (
    SELECT 
            mv.movie_id
        FROM
            movies_ratings mv
        WHERE
            ISNULL(mv.number_of_stars))
ORDER BY YEAR(release_date);