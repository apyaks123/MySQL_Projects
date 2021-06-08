drop view if exists movies_legendary_technician;

CREATE VIEW movies_legendary_technician AS
    SELECT 
        title AS Movie,
        CONCAT(first_name, ' ', last_name) AS Technicians,
        FLOOR((DATEDIFF(CURDATE(), birth_date)) / 365.25) AS 'Age'
    FROM
        movies
            INNER JOIN
        movie_cast ON movies.movie_id = movie_cast.movie_id
            INNER JOIN
        artists ON movie_cast.person_id = artists.artist_id
        having Age > 40
    ORDER BY Age;
    
    