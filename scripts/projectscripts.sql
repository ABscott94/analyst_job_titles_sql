/*1)How many rows are in the data_analyst_jobs table?*/

SELECT count(*)
FROM DATA_ANALYST_JOBS;

--1793

/*2)Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?*/

SELECT *
FROM DATA_ANALYST_JOBS
LIMIT (10);

--ExxonMobil

/*3a)How many postings are in Tennessee?*/

SELECT COUNT(*)
FROM DATA_ANALYST_JOBS
WHERE LOCATION = 'TN';

--21

/*3b)How many are there in either Tennessee or Kentucky?*/

select count(*)
from data_analyst_jobs
where location = 'TN' or location = 'KY';

--27

/*4)How many postings in Tennessee have a star rating above 4?*/

select count(star_rating)
from data_analyst_jobs
where location = 'TN' and star_rating > 4;

--3

/*5)How many postings in the dataset have a review count between 500 and 1000?*/

SELECT COUNT(*)
FROM DATA_ANALYST_JOBS
WHERE REVIEW_COUNT BETWEEN 500 AND 1000;

--151

/*6)Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?*/

SELECT LOCATION AS STATE,
	AVG(STAR_RATING) AS AVG_RATING
FROM DATA_ANALYST_JOBS
GROUP BY STATE
ORDER BY AVG_RATING DESC;

--NE - Nebraska

/*7)Select unique job titles from the data_analyst_jobs table. How many are there?*/

SELECT COUNT (DISTINCT (TITLE))
FROM DATA_ANALYST_JOBS;

--881

/*8)How many unique job titles are there for California companies?*/

SELECT count(DISTINCT(TITLE))
FROM DATA_ANALYST_JOBS
WHERE LOCATION = 'CA';

--230

/*9)Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?*/

SELECT COMPANY,
	AVG(STAR_RATING) AS AVG_RATING
FROM DATA_ANALYST_JOBS
WHERE REVIEW_COUNT > 5000
and company is not null
GROUP BY COMPANY;

--40 (41 including null)

/*10)Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?*/

select COMPANY,
	round(AVG(STAR_RATING),9) AS AVG_RATING
FROM DATA_ANALYST_JOBS
WHERE REVIEW_COUNT > 5000
and company is not null
GROUP BY COMPANY
order by avg_rating desc;

--General Motors, Unilever, Microsoft, Nike, American Express, and Kaiser Permanente all have the highest average rating of 4.199999809 out of companies with more than 5000 reviews

/*11)Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?*/

SELECT COUNT(distinct(TITLE))
FROM DATA_ANALYST_JOBS
WHERE lower(TITLE) like '%analyst%';

--774

/*12a)How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’?*/

SELECT count(distinct(TITLE))
FROM DATA_ANALYST_JOBS
WHERE lower(TITLE) not like '%analyst%'
	AND lower(TITLE) not like '%analytics%';
	
--4

/*12b)What word do these positions have in common?*/

select distinct(title)
from data_analyst_jobs
where lower(title) not like '%analyst%'
	and lower(title) not like '%analytics%'

--All 4 of the titles contain Tableau while 3 of them contain Data

/*BonusA)Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. Disregard any postings where the domain is NULL. Order your results so that the domain with the greatest number of hard to fill jobs is at the top. Which three industries are in the top 4 on this list?*/

select domain, count(title) as hard_to_fill
from data_analyst_jobs
where days_since_posting > 21
and lower(skill) like '%sql%'
and domain is not null
group by domain
order by hard_to_fill desc;

--Consulting and Business Services, Health Care, Internet and Software, and Banks and Financial Services

/*BonusB)How many jobs have been listed for more than 3 weeks for each of the top 4?*/

--232