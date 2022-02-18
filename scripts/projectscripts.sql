Select COUNT(*)
From DATA_ANALYST_JOBS;

--1793

Select *
From DATA_ANALYST_JOBS
Limit (10);

--ExxonMobil

Select COUNT(*)
From DATA_ANALYST_JOBS
Where Location = 'TN';

--21 (TN) 

Select COUNT(*)
From DATA_ANALYST_JOBS
Where REVIEW_COUNT Between 500 And 1000;

--151

Select Location As STATE,
	AVG(STAR_RATING) As AVG_RATING
From DATA_ANALYST_JOBS
Group by STATE
Order by AVG_RATING Desc;

--NE - Nebraska

Select Count (Distinct (TITLE))
From DATA_ANALYST_JOBS;

--881

Select Count (Distinct (TITLE))
From DATA_ANALYST_JOBS
Where Location = 'CA';

--230

Select COMPANY,
	AVG(STAR_RATING) As AVG_RATING
From DATA_ANALYST_JOBS
Where REVIEW_COUNT > 5000
Group by COMPANY
Order by AVG_RATING Desc;

--40 (41 including null)
--General Motors (plus 5 others)

Select COUNT(TITLE)
From DATA_ANALYST_JOBS
Where TITLE like '%Analyst%';

--1636 (1640 with "analyst") 	

Select TITLE
From DATA_ANALYST_JOBS
Where TITLE not like '%Analyst%';