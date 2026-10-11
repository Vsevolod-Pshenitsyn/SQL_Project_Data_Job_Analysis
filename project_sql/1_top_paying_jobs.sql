/*
What is the top 10 highest-paying analyst jobs that are available remotely.
*/
SELECT
	job_title_short,
	ROUND(AVG(salary_year_avg), 2) AS avg_salary_for_job,
	COUNT(job_id) AS number_of_jobs
FROM
	job_postings_fact
WHERE
	job_location = 'Anywhere' AND 
	salary_year_avg IS NOT NULL
GROUP BY
	job_title_short
ORDER BY
	avg_salary_for_job DESC;