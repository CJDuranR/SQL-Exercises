/*
UNION Notes:
- UNION combines results from multiple SELECT statements
- It removes duplicate rows by default
- All SELECT statements must have the same number of columns
- Columns must be compatible in data type

Example:
SELECT column_name
FROM table_one

UNION -- Combines the two tables

SELECT column_name
FROM table_two;

- Gets rid of duplicate rows (unlike UNION ALL which keeps duplicates)
- All rows are unique in the final result set
*/

-- Exercise:
-- Get jobs and companies from January
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION

-- Get jobs and companies from February
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs

UNION

-- Get jobs and companies from March
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs

/*
UNION ALL Notes:
- UNION ALL combines results from multiple SELECT statements
- It keeps duplicate rows (unlike UNION which removes duplicates)
- All SELECT statements must have the same number of columns
- Columns must be compatible in data type

Example:
SELECT column_name
FROM table_one

UNION ALL -- Combines the two tables

SELECT column_name
FROM table_two;
*/

SELECT
    job_title_short,
    company_id,
    job_location,
    skills_to_job.skill_id,
    skills.skills,
    salary_year_avg,
    job_posted_date
FROM
    january_jobs
INNER JOIN
    skills_job_dim AS skills_to_job ON january_jobs.job_id = skills_to_job.job_id
INNER JOIN
    skills_dim AS skills ON skills_to_job.skill_id = skills.skill_id

UNION ALL

-- Get jobs and companies from February
SELECT
    job_title_short,
    company_id,
    job_location,
    skills_to_job.skill_id,
    skills.skills,
    salary_year_avg,
    job_posted_date
FROM
    february_jobs
INNER JOIN
    skills_job_dim AS skills_to_job ON february_jobs.job_id = skills_to_job.job_id
INNER JOIN
    skills_dim AS skills ON skills_to_job.skill_id = skills.skill_id

UNION ALL

-- Get jobs and companies from March
SELECT
    job_title_short,
    company_id,
    job_location,
    skills_to_job.skill_id,
    skills.skills,
    salary_year_avg,
    job_posted_date
FROM
    march_jobs
INNER JOIN
    skills_job_dim AS skills_to_job ON march_jobs.job_id = skills_to_job.job_id
INNER JOIN
    skills_dim AS skills ON skills_to_job.skill_id = skills.skill_id
WHERE
    salary_year_avg > 70000
ORDER BY
    salary_year_avg DESC

-- Look at the skills and the type for each job in the first quarter that has a salary > $70,000

