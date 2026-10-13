/*
Question: What are the most in-demand skills for data analyst?
- Join job postings to inner join table similar to query 2
- Identify top 5 in-demand skills for data analyst
- Focus on all job-postings
- Why? Retrieves the top 5 skills with highest demand in the job market
and provide insights into the most valuable skills.

Used job_country = 'Brazil' on first query and Remote jobs on the second
So I can analyze and compare demand count. 
*/

SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_country = 'Brazil'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5




SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5