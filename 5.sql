SELECT 
    title AS 'Movie with 3 Awards'
FROM
    movies m
        JOIN
    awards aw ON m.movie_id = aw.movie_id
GROUP BY m.title
HAVING COUNT(*) = 3;