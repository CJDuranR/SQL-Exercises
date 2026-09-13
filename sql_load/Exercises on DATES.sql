SELECT
    job_posted_date
FROM
    job_postings_fact
LIMIT 10;

-- Convert entries into different data types
SELECT
    '2023-02-19'::DATE,
    '123'::INT, 
    'True'::BOOLEAN, 
    '3.14'::REAL;


SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date::DATE AS date
FROM
    job_postings_fact;


-- Convert time zones
SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time
FROM
    job_postings_fact
LIMIT 5;


-- Extracting specific parts of a date
SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT(MONTH FROM job_posted_date) AS month,
    EXTRACT(YEAR FROM job_posted_date) AS year
FROM
    job_postings_fact
LIMIT 5;


-- Job posting trends from month to month
SELECT
    count(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    month
ORDER BY
    job_posted_count DESC;