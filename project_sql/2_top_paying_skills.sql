/*
 * Top skill for each job
 */
WITH top_skill_for_job AS ( -- Top skills for top 10 jobs
	(SELECT -- 1 Total number of skill per Senior Data Scientist
		jpf.job_title_short ,
		sd.skills AS skill_name ,
		COUNT(sd.skill_id) AS total_count_skill
	FROM
		job_postings_fact jpf
	INNER JOIN skills_job_dim sjd 
		ON sjd.job_id = jpf.job_id 
	INNER JOIN skills_dim sd 
		ON sd.skill_id = sjd.skill_id
	WHERE
		jpf.job_work_from_home = TRUE AND
		jpf.salary_year_avg IS NOT NULL AND
		jpf.job_title_short = 'Senior Data Scientist'
	GROUP BY
		jpf.job_title_short, sd.skills
	ORDER BY
		total_count_skill DESC
	LIMIT 1)
	
	UNION 
	-- 2 Total number of skill per Machine Learning Engineer
	(SELECT
		jpf.job_title_short ,
		sd.skills AS skill_name ,
		COUNT(sd.skill_id) AS total_count_skill
	FROM
		job_postings_fact jpf
	INNER JOIN skills_job_dim sjd 
		ON sjd.job_id = jpf.job_id 
	INNER JOIN skills_dim sd 
		ON sd.skill_id = sjd.skill_id
	WHERE
		jpf.job_work_from_home = TRUE AND
		jpf.salary_year_avg IS NOT NULL AND
		jpf.job_title_short = 'Machine Learning Engineer'
	GROUP BY
		jpf.job_title_short, sd.skills
	ORDER BY
		total_count_skill DESC
	LIMIT 1)
	
	UNION 
	
	-- 3 Total number of skill per Senior Data Engineer
	(SELECT
		jpf.job_title_short ,
		sd.skills AS skill_name ,
		COUNT(sd.skill_id) AS total_count_skill
	FROM
		job_postings_fact jpf
	INNER JOIN skills_job_dim sjd 
		ON sjd.job_id = jpf.job_id 
	INNER JOIN skills_dim sd 
		ON sd.skill_id = sjd.skill_id
	WHERE
		jpf.job_work_from_home = TRUE AND
		jpf.salary_year_avg IS NOT NULL AND
		jpf.job_title_short = 'Senior Data Engineer'
	GROUP BY
		jpf.job_title_short, sd.skills
	ORDER BY
		total_count_skill DESC
	LIMIT 1)
	
	UNION 
	
	-- 4 Total number of skill per Cloud Engineer
	(SELECT
		jpf.job_title_short ,
		sd.skills AS skill_name ,
		COUNT(sd.skill_id) AS total_count_skill
	FROM
		job_postings_fact jpf
	INNER JOIN skills_job_dim sjd 
		ON sjd.job_id = jpf.job_id 
	INNER JOIN skills_dim sd 
		ON sd.skill_id = sjd.skill_id
	WHERE
		jpf.job_work_from_home = TRUE AND
		jpf.salary_year_avg IS NOT NULL AND
		jpf.job_title_short = 'Cloud Engineer'
	GROUP BY
		jpf.job_title_short, sd.skills
	ORDER BY
		total_count_skill DESC
	LIMIT 1)
	
	UNION 
	
	-- 5 Total number of skill per Data Scientist
	(SELECT
		jpf.job_title_short ,
		sd.skills AS skill_name ,
		COUNT(sd.skill_id) AS total_count_skill
	FROM
		job_postings_fact jpf
	INNER JOIN skills_job_dim sjd 
		ON sjd.job_id = jpf.job_id 
	INNER JOIN skills_dim sd 
		ON sd.skill_id = sjd.skill_id
	WHERE
		jpf.job_work_from_home = TRUE AND
		jpf.salary_year_avg IS NOT NULL AND
		jpf.job_title_short = 'Data Scientist'
	GROUP BY
		jpf.job_title_short, sd.skills
	ORDER BY
		total_count_skill DESC
	LIMIT 1)
	
	UNION 
	
	-- 6 Total number of skill per Data Engineer
	(SELECT
		jpf.job_title_short ,
		sd.skills AS skill_name ,
		COUNT(sd.skill_id) AS total_count_skill
	FROM
		job_postings_fact jpf
	INNER JOIN skills_job_dim sjd 
		ON sjd.job_id = jpf.job_id 
	INNER JOIN skills_dim sd 
		ON sd.skill_id = sjd.skill_id
	WHERE
		jpf.job_work_from_home = TRUE AND
		jpf.salary_year_avg IS NOT NULL AND
		jpf.job_title_short = 'Data Engineer'
	GROUP BY
		jpf.job_title_short, sd.skills
	ORDER BY
		total_count_skill DESC
	LIMIT 1)
	
	UNION 
	
	-- 7 Total number of skill per Software Engineer
	(SELECT
		jpf.job_title_short ,
		sd.skills AS skill_name ,
		COUNT(sd.skill_id) AS total_count_skill
	FROM
		job_postings_fact jpf
	INNER JOIN skills_job_dim sjd 
		ON sjd.job_id = jpf.job_id 
	INNER JOIN skills_dim sd 
		ON sd.skill_id = sjd.skill_id
	WHERE
		jpf.job_work_from_home = TRUE AND
		jpf.salary_year_avg IS NOT NULL AND
		jpf.job_title_short = 'Software Engineer'
	GROUP BY
		jpf.job_title_short, sd.skills
	ORDER BY
		total_count_skill DESC
	LIMIT 1)
	
	UNION 
	
	-- 8 Total number of skill per Senior Data Analyst
	(SELECT
		jpf.job_title_short ,
		sd.skills AS skill_name ,
		COUNT(sd.skill_id) AS total_count_skill
	FROM
		job_postings_fact jpf
	INNER JOIN skills_job_dim sjd 
		ON sjd.job_id = jpf.job_id 
	INNER JOIN skills_dim sd 
		ON sd.skill_id = sjd.skill_id
	WHERE
		jpf.job_work_from_home = TRUE AND
		jpf.salary_year_avg IS NOT NULL AND
		jpf.job_title_short = 'Senior Data Analyst'
	GROUP BY
		jpf.job_title_short, sd.skills
	ORDER BY
		total_count_skill DESC
	LIMIT 1)
	
	UNION 
	
	-- 9 Total number of skill per Business Analyst
	(SELECT
		jpf.job_title_short ,
		sd.skills AS skill_name ,
		COUNT(sd.skill_id) AS total_count_skill
	FROM
		job_postings_fact jpf
	INNER JOIN skills_job_dim sjd 
		ON sjd.job_id = jpf.job_id 
	INNER JOIN skills_dim sd 
		ON sd.skill_id = sjd.skill_id
	WHERE
		jpf.job_work_from_home = TRUE AND
		jpf.salary_year_avg IS NOT NULL AND
		jpf.job_title_short = 'Business Analyst'
	GROUP BY
		jpf.job_title_short, sd.skills
	ORDER BY
		total_count_skill DESC
	LIMIT 1)
	
	UNION 
	
	-- 10 Total number of skill per Data Analyst
	(SELECT
		jpf.job_title_short ,
		sd.skills AS skill_name ,
		COUNT(sd.skill_id) AS total_count_skill
	FROM
		job_postings_fact jpf
	INNER JOIN skills_job_dim sjd 
		ON sjd.job_id = jpf.job_id 
	INNER JOIN skills_dim sd 
		ON sd.skill_id = sjd.skill_id
	WHERE
		jpf.job_work_from_home = TRUE AND
		jpf.salary_year_avg IS NOT NULL AND
		jpf.job_title_short = 'Data Analyst'
	GROUP BY
		jpf.job_title_short, sd.skills
	ORDER BY
		total_count_skill DESC
	LIMIT 1)
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
