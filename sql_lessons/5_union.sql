SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs

/*
Prac problem
 -Get the corresponding skill and skill type for each job posting in Q1
 -Includes those without any skill, too
 -Why? Look at the skills and the type for each job in the first quarter that has a 
 salary > $70000
*/

SELECT
    jan.job_id,
    s.skills,
    s.type
FROM
    january_jobs AS jan
LEFT JOIN
    skills_job_dim AS sjd
    ON jan.job_id = sjd.job_id
LEFT JOIN
    skills_dim AS s
    ON sjd.skill_id = s.skill_id
WHERE
    jan.salary_year_avg > 70000

UNION ALL

SELECT
    fev.job_id,
    s.skills,
    s.type
FROM
    february_jobs AS fev
LEFT JOIN
    skills_job_dim AS sjd
    ON fev.job_id = sjd.job_id
LEFT JOIN
    skills_dim AS s
    ON sjd.skill_id = s.skill_id
WHERE
    fev.salary_year_avg > 70000

UNION ALL

SELECT
    mar.job_id,
    s.skills,
    s.type
FROM
    march_jobs AS mar
LEFT JOIN
    skills_job_dim AS sjd
    ON mar.job_id = sjd.job_id
LEFT JOIN
    skills_dim AS s
    ON sjd.skill_id = s.skill_id
WHERE
    mar.salary_year_avg > 70000

/*
Find job postings from the first quarter that have a salary greater than $70k
 -Combine job postings tables from the first quarter of 2023 (jan-mar)
 -Gets job postings with an average yearly salary >70000
*/

SELECT
    job_title_short,
    job_location,
    job_via,
    job_posted_date::DATE,
    salary_year_avg
FROM (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
) AS quarter1_job_postings
WHERE
    quarter1_job_postings.salary_year_avg > 70000 AND
    quarter1_job_postings.job_title_short = 'Data Analyst'
ORDER BY
    quarter1_job_postings.salary_year_avg DESC