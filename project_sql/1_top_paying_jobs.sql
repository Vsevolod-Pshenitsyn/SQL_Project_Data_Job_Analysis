/*
What is the top 10 highest-paying analyst jobs that are available remotely.
*/
SELECT
	job_title_short,
	ROUND(AVG(salary_year_avg), 2) AS avg_salary_for_job,
	COUNT(job_id) AS job_count,
	percentile_cont(0.5) WITHIN GROUP (ORDER BY salary_year_avg) AS median_salary
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