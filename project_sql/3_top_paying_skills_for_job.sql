/*
 * Top paying skill for each role
 */
WITH salary_for_skill AS ( --Finding top skill for each job
	SELECT
		jpf.job_title_short,
		sd.skills,
		ROUND(AVG(salary_year_avg), 2) AS avg_salary_for_skill
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
top_skill_for_job AS ( -- Filtering
	SELECT
		job_title_short,
		skills AS skill_name,
		avg_salary_for_skill
	FROM
		salary_for_skill AS a
	WHERE NOT EXISTS (SELECT 1 FROM salary_for_skill AS b WHERE b.avg_salary_for_skill > a.avg_salary_for_skill AND a.job_title_short = b.job_title_short)
)
SELECT
	* 
FROM
	top_skill_for_job;