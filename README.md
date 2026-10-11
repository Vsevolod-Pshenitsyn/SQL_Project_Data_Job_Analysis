
# Introduction
I dived into job postings from 2023 from [Luke Barousse SQL Course](https://lukebarousse.com/sql)

You can find my SQL queries here: [project_sql folder](/project_sql/)
### The questions I wanted to answer
1. What are most paying jobs in Data(Analitycs, Engineer and Scientist)?
2. What are most common skills in these jobs?
# How I did it?
I made a PostgreSQL server on my Old laptop, I connected to it with Local ethernet and Tailscale(to work from distance). Server was setted up with ChatGPT help, but in the future I want to do it only myself. Then I made a Postgress Database, I downloaded csv files, made the tables and then dropped csv files into the tables via DBeaver
# The Analysis
### 1. Top Paying Data jobs
```sql
SELECT
	job_title_short,
	ROUND(AVG(salary_year_avg), 2) AS avg_salary_for_job,
	COUNT(job_id) AS job_count
FROM
	job_postings_fact
WHERE
	job_location = 'Anywhere' AND 
	salary_year_avg IS NOT NULL
GROUP BY
	job_title_short
HAVING
	COUNT(job_id) > 10
ORDER BY
	avg_salary_for_job DESC
LIMIT 10;
```
I get pretty expected results that Seniors roles was on the top, **but** there was an outsider - **Senior Data Analyst** with average yearly salary 113 000$ which is behind both Data Engineer and Scientist, it may be do to both wrong job titles and extreme outliers
![Top Paying Roles](assets\1_top_paying_jobs.png)
### 2. What is the most common skills in those jobs
```sql
WITH job_skill_total_count AS ( --Finding top skill for each job
	SELECT
		jpf.job_title_short,
		sd.skills,
		count(jpf.job_id) AS job_count
	FROM
		job_postings_fact jpf
	INNER JOIN skills_job_dim sjd 
		ON jpf.job_id = sjd.job_id
	INNER JOIN skills_dim sd 
		ON sd.skill_id = sjd.skill_id
	WHERE
		job_location = 'Anywhere' AND 
		salary_year_avg IS NOT NULL
	GROUP BY
		jpf.job_title_short,
		sd.skills
),
top_skill_for_job AS ( -- Filtering top count skills
	SELECT
		job_title_short,
		skills AS skill_name,
		job_count 
	FROM
		job_skill_total_count AS a
	WHERE NOT EXISTS (SELECT 1 FROM job_skill_total_count AS b WHERE b.job_count > a.job_count AND a.job_title_short = b.job_title_short)
)
SELECT -- Top 10 highest paying jobs
	jpf.job_title_short,
	ROUND(AVG(salary_year_avg), 2) AS avg_salary_for_job,
	COUNT(job_id) AS number_of_jobs,
	tsfj.skill_name AS main_skill
FROM
	job_postings_fact AS jpf
INNER JOIN top_skill_for_job AS tsfj
	ON tsfj.job_title_short = jpf.job_title_short
WHERE
	job_location = 'Anywhere' AND 
	salary_year_avg IS NOT NULL
GROUP BY
	jpf.job_title_short, tsfj.skill_name
HAVING
	COUNT(job_id) > 10
ORDER BY
	avg_salary_for_job DESC;
```
First time writting these query I used UNION to 9 rows each contain most common skill with WHERE statement that just looking for titles from previos table, so if something would be changet in database like added new role this query would not show this title so I was looking for some for functions in Postgresql documentaion and find loop function with array but it did not work for me and then I asked for a hint from ChatGPT, it said that a can use subqueres or window functions, because I did know them yet I choosed subquery than it gives me a hint that I can try use subquery in WHERE EXISTS and LEFT JOIN, I tried them both and with pain it worked with WHERE EXISTS but I really spend a lot of time to make it work.
Then I get a second small trouble that is a bad habit to do WITH table_1 AS(WITH table_2 AS) so I fixed it.
![Most common skills in top paying jobs](assets\2_most_common_skills_in_top_paying_jobs.png)
