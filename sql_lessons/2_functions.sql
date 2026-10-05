
SELECT
    job_schedule_type,
    AVG(salary_year_avg) AS avg_salary,
    AVG(salary_hour_avg) AS avg_hourly
FROM job_postings_fact
WHERE job_posted_date > '2023-06-01'
GROUP BY job_schedule_type;

SELECT
    COUNT(job_id) AS job_count,
    EXTRACT(
        MONTH FROM job_posted_date AT TIME ZONE 'UTC'
        AT TIME ZONE 'America/New_York'
    ) AS month
FROM job_postings_fact
WHERE EXTRACT(
    YEAR FROM job_posted_date AT TIME ZONE 'UTC'
    AT TIME ZONE 'America/New_York'
) = 2023
GROUP BY month
ORDER BY month;

SELECT
    company_dim.name AS company,
    job_health_insurance AS health_insurance
FROM job_postings_fact
JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
WHERE EXTRACT(QUARTER FROM job_posted_date) = 2 
    AND EXTRACT(YEAR FROM job_posted_date) = 2023
    AND job_health_insurance = TRUE

SELECT *
FROM job_postings_fact
LIMIT 100;


CREATE TABLE january_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

CREATE TABLE february_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;
    
CREATE TABLE march_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT job_posted_date
FROM march_jobs;

