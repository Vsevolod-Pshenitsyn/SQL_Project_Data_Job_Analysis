/*
What is the top 10 highest-paying analyst jobs that are available remotely.
*/
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