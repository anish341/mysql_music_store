-- Retrieve all artist records from the ARTIST table in the MUSIC_STORE database.
SELECT * FROM MUSIC_STORE.ARTIST;

-- Retrieve employee records ordered by the LEVELS column in descending order.
-- LIMIT 2 returns the top 2 senior-most employees.
SELECT * FROM MUSIC_STORE.EMPLOYEE 
ORDER BY LEVELS DESC LIMIT 2;

-- Count the number of invoices grouped by billing country.
-- The result is ordered in descending order by the BILLING_COUNTRY value.
SELECT COUNT(*), BILLING_COUNTRY 
FROM MUSIC_STORE.INVOICE
GROUP BY BILLING_COUNTRY 
ORDER BY BILLING_COUNTRY DESC;

-- Retrieve the top 3 invoices with the highest TOTAL amount.
SELECT TOTAL 
FROM MUSIC_STORE.INVOICE
ORDER BY TOTAL DESC LIMIT 3;

-- Calculate the total invoice amount for each billing city.
-- Results are grouped by BILLING_CITY and ordered by the computed sum (INVOICE_TOTAL) in descending order.
SELECT SUM(TOTAL) AS INVOICE_TOTAL, BILLING_CITY 
FROM MUSIC_STORE.INVOICE
GROUP BY BILLING_CITY 
ORDER BY INVOICE_TOTAL DESC;

-- Change the current database context to MUSIC_STORE.
USE MUSIC_STORE;

-- Retrieve specific customer details by joining the CUSTOMER and INVOICE tables.
-- The query groups by customer attributes and orders the results by email.
-- LIMIT 3 returns only the first 3 records.
SELECT 
    CUSTOMER.CUSTOMER_ID, 
    CUSTOMER.FIRST_NAME, 
    CUSTOMER.LAST_NAME,
    CUSTOMER.EMAIL
FROM 
    MUSIC_STORE.CUSTOMER
JOIN 
    INVOICE ON CUSTOMER.CUSTOMER_ID = INVOICE.CUSTOMER_ID
GROUP BY 
    CUSTOMER.CUSTOMER_ID, CUSTOMER.FIRST_NAME, CUSTOMER.LAST_NAME, CUSTOMER.EMAIL
ORDER BY 
    CUSTOMER.EMAIL
LIMIT 3;

-- Retrieve distinct customer emails and names for customers who have purchased tracks in the 'ROCK' genre.
-- This query joins multiple tables: CUSTOMER, INVOICE, INVOICE_LINE, TRACK, and GENRE.
SELECT DISTINCT 
    CUSTOMER.EMAIL, 
    CUSTOMER.FIRST_NAME, 
    CUSTOMER.LAST_NAME
FROM 
    CUSTOMER
JOIN 
    INVOICE ON CUSTOMER.CUSTOMER_ID = INVOICE.CUSTOMER_ID
JOIN 
    INVOICE_LINE ON INVOICE.INVOICE_ID = INVOICE_LINE.INVOICE_ID
JOIN 
    TRACK ON INVOICE_LINE.TRACK_ID = TRACK.TRACK_ID
JOIN 
    GENRE ON TRACK.GENRE_ID = GENRE.GENRE_ID
WHERE 
    GENRE.NAME LIKE 'ROCK'
ORDER BY 
    CUSTOMER.EMAIL;

-- Retrieve artist names and the character length of each name.
-- The WHERE clause uses a pattern that matches names having two characters, followed by 'A',
-- then any characters, and ending with at least two additional characters.
SELECT NAME, LENGTH(NAME) AS CHAR_LENGTH 
FROM MUSIC_STORE.ARTIST
WHERE NAME LIKE '__A%__';

-- Retrieve artists whose ARTIST_ID is between 10 and 20 (inclusive), ordered alphabetically by name.
SELECT * 
FROM MUSIC_STORE.ARTIST
WHERE ARTIST_ID BETWEEN 10 AND 20 
ORDER BY NAME;

-- Retrieve all customer records and explicitly include FIRST_NAME and LAST_NAME columns.
-- The results are ordered by FIRST_NAME in descending order, limited to 3 records.
SELECT *, FIRST_NAME, LAST_NAME 
FROM MUSIC_STORE.CUSTOMER
ORDER BY FIRST_NAME DESC 
LIMIT 3;

-- Retrieve all customer records and check if the FIRST_NAME field is NULL.
SELECT *, ISNULL(FIRST_NAME) 
FROM MUSIC_STORE.CUSTOMER;

-- Retrieve all employee records from the EMPLOYEE table.
SELECT * FROM MUSIC_STORE.EMPLOYEE;

-- Extract various date components from the HIRE_DATE and BIRTHDATE columns in the EMPLOYEE table.
SELECT 
    DAY(HIRE_DATE) AS HIRE_DAY,
    DATE(HIRE_DATE) AS HIRE_DATE, 
    MONTH(HIRE_DATE) AS HIRE_MONTH, 
    MONTHNAME(HIRE_DATE) AS HIRE_MONTH_NAME, 
    YEAR(HIRE_DATE) AS HIRE_YEAR, 
    YEARWEEK(HIRE_DATE) AS HIRE_YEARWEEK,
    DATE(BIRTHDATE) AS BIRTHDATE,
    MONTH(BIRTHDATE) AS BIRTH_MONTH
FROM MUSIC_STORE.EMPLOYEE;

-- Retrieve all records from the GENRE table.
SELECT * FROM MUSIC_STORE.GENRE;

-- Count the total number of genres by counting GENRE_ID in the GENRE table.
SELECT COUNT(GENRE_ID) FROM MUSIC_STORE.GENRE;

-- Retrieve all invoice records from the INVOICE table.
SELECT * FROM MUSIC_STORE.INVOICE;

-- Retrieve customer IDs and billing cities for invoices where the billing city is 'NEW YORK'.
-- The results are ordered by CUSTOMER_ID.
SELECT CUSTOMER_ID, BILLING_CITY
FROM MUSIC_STORE.INVOICE
WHERE BILLING_CITY = 'NEW YORK'
ORDER BY CUSTOMER_ID;

-- Retrieve all records from the INVOICE_LINE table.
SELECT * FROM MUSIC_STORE.INVOICE_LINE;

-- Count the total number of invoice lines by counting INVOICE_ID in the INVOICE_LINE table.
SELECT COUNT(INVOICE_ID) FROM MUSIC_STORE.INVOICE_LINE;

-- Retrieve all records from the MEDIA_TYPE table.
SELECT * FROM MUSIC_STORE.MEDIA_TYPE;

-- Retrieve all playlist records from the PLAYLIST table, ordering the results by name in descending order.
SELECT * FROM MUSIC_STORE.PLAYLIST
ORDER BY NAME DESC;

-- Count the total number of tracks in the PLAYLIST_TRACK table.
SELECT COUNT(TRACK_ID) FROM MUSIC_STORE.PLAYLIST_TRACK;

-- Count the total number of tracks across the MUSIC_STORE database.
SELECT COUNT(TRACK_ID) FROM MUSIC_STORE;
