SELECT 
    genre AS Genre,
    COUNT(*) AS 'Number of movies',
    YEAR(release_date)
FROM
    movies 
GROUP BY  YEAR(release_date), genre;

