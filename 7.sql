SELECT DISTINCT
 title as 'Title', category as 'Category'
FROM
    movies
        natural JOIN
    awards
WHERE
    Distributor = 'Disney';