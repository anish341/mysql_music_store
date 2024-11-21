SELECT * FROM MUSIC_STORE.ARTIST;
-- WHO IS THE SENIOR MOST EMPLOYEE BASED ON JOB TTILE? 
SELECT * FROM MUSIC_STORE.EMPLOYEE 
ORDER BY LEVELS DESC LIMIT 2;

SELECT COUNT(*),BILLING_COUNTRY FROM MUSIC_STORE.INVOICE
GROUP BY BILLING_COUNTRY ORDER BY BILLING_COUNTRY DESC;

SELECT TOTAL FROM  MUSIC_STORE.INVOICE
ORDER BY TOTAL DESC LIMIT 3;

SELECT SUM(TOTAL)AS INVOICE_TOTAL, BILLING_CITY FROM  MUSIC_STORE.INVOICE
GROUP BY BILLING_CITY ORDER BY INVOICE_TOTAL DESC;
 
USE MUSIC_STORE;
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
    
    SELECT NAME, LENGTH(NAME ) AS CHAR_LENGTH FROM MUSIC_STORE.ARTIST
    WHERE NAME  LIKE '__A%__' ;
    
SELECT * FROM MUSIC_STORE.ARTIST
WHERE ARTIST_ID BETWEEN 10 AND 20 
ORDER BY NAME ;

SELECT *, FIRST_NAME, LAST_NAME FROM MUSIC_STORE.CUSTOMER
ORDER BY FIRST_NAME  DESC  LIMIT 3;

SELECT*, ISNULL(FIRST_NAME) FROM MUSIC_STORE.CUSTOMER;

SELECT * FROM MUSIC_STORE.EMPLOYEE;
SELECT DAY(HIRE_DATE) AS HIRE_DAY,
DATE(HIRE_DATE) AS HIRE_DATE, MONTH(HIRE_DATE) AS HIRE_MONTH, MONTHNAME(HIRE_DATE), 
YEAR(HIRE_DATE), YEARWEEK(HIRE_DATE) 
AND  DATE (BIRTHDATE),
MONTH (BIRTHDATE)
FROM MUSIC_STORE.EMPLOYEE;

SELECT * FROM MUSIC_STORE.GENRE;
SELECT COUNT(GENRE_ID) FROM MUSIC_STORE.GENRE;

SELECT * FROM MUSIC_STORE.INVOICE;

SELECT CUSTOMER_ID, BILLING_CITY
FROM MUSIC_STORE.INVOICE
WHERE BILLING_CITY = 'NEW YORK'
ORDER BY CUSTOMER_ID;

SELECT *FROM MUSIC_STORE.INVOICE_LINE;

SELECT COUNT(INVOICE_ID)FROM MUSIC_STORE.INVOICE_LINE;

SELECT *FROM MUSIC_STORE.MEDIA_TYPE;

SELECT *FROM MUSIC_STORE.PLAYLIST
ORDER BY  NAME DESC;

SELECT COUNT(TRACK_ID) FROM MUSIC_STORE.PLAYLIST_TRACK ;

SELECT COUNT(TRACK_ID) FROM MUSIC_STORE




