SELECT
    job_title_short,
    job_location,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM
    job_postings_fact;

SELECT
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category;

SELECT
    company_id,
    job_location,
    salary_year_avg,
    CASE
        WHEN salary_year_avg < 40000 THEN 'Low Salary'
        WHEN salary_year_avg <= 80000 THEN 'Standard Salary'
        ELSE 'High Salary'
    END AS salary_range
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC;



SELECT 
    job_title_short,
    salary_year_avg
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL;