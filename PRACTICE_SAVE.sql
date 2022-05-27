-- QN:1 
--rows are in the data_analyst_jobs?(1793)
SELECT COUNT(*)
FROM data_analyst_jobs;

--QN:2
---first 10 rows, company is associated with the job posting on the 10th row?(ExxonMobil)
SELECT *
FROM data_analyst_jobs
LIMIT 10;

--QN:3
--How many postings are in Tennessee?(21) How many are there in either Tennessee or Kentucky?(27)
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN'OR location = 'KY';

--QN:4
--How many postings in Tennessee have a star rating above 4?(3)
SELECT *
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > 4;

--QN:5
--review count between 500 and 1000?(151)
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

--QN:6
/*average star rating for companies in each state*/
SELECT AVG(star_rating) AS avg_rating, location AS state
FROM data_analyst_jobs
GROUP BY location;

--state with highest average rating?(RI)
SELECT AVG(star_rating) AS avg_rating, location 
FROM data_analyst_jobs
GROUP BY location
ORDER BY avg_rating DESC;

--QN:7
--unique job titles from the data_analyst_jobs table. How many are there?(881)
SELECT DISTINCT title
FROM data_analyst_jobs;

--QN:8
--unique job titles are there for California companies?(230)
SELECT DISTINCT title, location 
FROM data_analyst_jobs
WHERE location = 'CA';

--QN:9
/* Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations*/
--How many companies are there with more that 5000 reviews across all locations?(41)
SELECT AVG(star_rating) AS avg_rating,company
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY data_analyst_jobs.company;

--How many companies are there with more that 5000 reviews across all locations?(41)
SELECT AVG(star_rating) AS avg_rating,
company, 
SUM (data_analyst_jobs.review_count) 
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY data_analyst_jobs.company; 

--QN:10
--Add the code to order the query in #9 from highest to lowest average star rating
SELECT AVG(star_rating) AS avg_rating,company
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY data_analyst_jobs.company
ORDER BY avg_rating DESC;

--Which company with more than 5000 reviews across all locations in the dataset has the highest star rating?(GM, Unilever, Microsoft, Nike, American Express, Kaiser Permanente)
--What is that rating? (4.1999998)
SELECT AVG(star_rating) AS avg_rating,company
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY data_analyst_jobs.company
ORDER BY avg_rating DESC;

--QN:11
--Find all the job titles that contain the word ‘Analyst’. 
--How many different job titles are there?(1636)
SELECT (title)
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%';

SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%';


--QN:12
--How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? 
--What word do these positions have in common? (Specialist)
SELECT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%'
AND title NOT ILIKE '%Analytics%';


SELECT title
FROM data_analyst_jobs
WHERE title NOT LIKE '%Analyst%' 
AND title NOT LIKE '%ANALYST%'
AND title NOT LIKE '%analyst%'
AND title NOT LIKE '%Analytics%'
AND title NOT LIKE '%analytics%'
AND title NOT LIKE '%ANALYTICS%';

--BONUS QN:
--Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.(27) 
SELECT domain 
FROM data_analyst_jobs
WHERE days_since_posting > 21
AND skill LIKE '%SQL%'
GROUP BY domain;

--Disregard any postings where the domain is NULL. 
SELECT domain,COUNT(title) 
FROM data_analyst_jobs
WHERE days_since_posting > 21
AND skill LIKE '%SQL%'
AND domain IS NOT NULL
GROUP BY domain;








