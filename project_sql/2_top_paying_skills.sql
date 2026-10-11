/*
 * Top skill for each job
 */
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
top_skill_for_job AS (
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
ORDER BY
	avg_salary_for_job DESC;