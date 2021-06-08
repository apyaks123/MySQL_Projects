SELECT DISTINCT
    m.title
FROM
    movies m,
    movies_ratings r,
    awards a,
    movie_cast t
WHERE
    a.category = 'Actor'
        AND m.movie_id = r.movie_id
        AND m.movie_id = a.movie_id
        AND a.person_id = t.person_id
        AND r.number_of_stars = (SELECT 
            MIN(number_of_stars)
        FROM
            movies_ratings);