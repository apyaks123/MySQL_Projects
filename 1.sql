SELECT 
    CONCAT(first_name, ' ', last_name) AS 'Full Name',
    FLOOR((DATEDIFF(CURDATE(), birth_date)) / 365.25) AS 'Age',
    address AS 'Address',
    contact_no AS 'Contact Number'
FROM
    artists
ORDER BY FLOOR((DATEDIFF(CURDATE(), birth_date)) / 365.25) DESC
LIMIT 5;