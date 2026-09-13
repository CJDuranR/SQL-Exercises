-- Subqueries and CTEs
-- Subqueries and Common Table Expressions (CTEs): Used for organizing complex queries, improving readability, and breaking down large queries into manageable parts.
-- Helps break down complex queries into smaller, more understandable components. 
-- Subqueries can be used in SELECT, FROM, and WHERE clauses, while CTEs provide a way to define temporary result sets that can be referenced within the main query.
-- When to use one over the other?
-- * Subqueries are for simpler, one-off queries that don't need to be reused.
-- * CTEs are better for more complex queries that require multiple references to the same result set 
-- or when you want to improve readability by breaking down the query into logical parts.

SELECT
    *
FROM
    (
    SELECT
        *
    FROM
        job_postings_fact
    WHERE
        EXTRACT(MONTH FROM job_posted_date) = 1
    ) AS january_jobs;


-- Common Table Expression (CTE): define a temporary result set that can be referenced within the main query.
-- Can reference within a SELECT, INSERT, UPDATE, or DELETE statement.
-- Defined with WITH clause, followed by the CTE name and the query that defines it.

WITH january_jobs AS (
    SELECT
        *
    FROM
        job_postings_fact
    WHERE
        EXTRACT(MONTH FROM job_posted_date) = 1
)

SELECT
    *
FROM
    january_jobs;


-- Subquery Notes:
-- Subqueries can be nested within other queries and can return a single value, a single row, or a set of rows.
-- It can be used in SELECT, FROM, WHERE, and HAVING clauses.
-- It's executed first, and its result is used by the outer query.
-- It is used when you want to perform a calculation before the main query can complete its operation.

SELECT
    company_id,
    name AS company_name
FROM
    company_dim
WHERE
    company_id IN (
        SELECT
            company_id
        FROM
            job_postings_fact
        WHERE
            job_no_degree_mention = true
        ORDER BY
            company_id
    );


-- CTE Notes:
-- CTE - A temporary result set that can be referenced within a SELECT, INSERT, UPDATE, or DELETE statement.
-- Exists only for the duration of the query and is not stored as an object in the database.
-- It's a defined query that can be referenced multiple times within the main query or other CTEs, improving readability and maintainability.
-- WITH clause is used to define a CTE at the beginning of the query, followed by the CTE name and the query that defines it.

/*WITH january_jobs AS (
    SELECT
        *
    FROM
        job_postings_fact
    WHERE
        EXTRACT(MONTH FROM job_posted_date) = 1
)

SELECT
    *
FROM
    january_jobs;¨
*/

WITH company_job_count AS (
    SELECT
        company_id,
        COUNT(*) AS total_jobs
    FROM
        job_postings_fact
    GROUP BY
        company_id
)
SELECT
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM
    company_dim
LEFT JOIN
    company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY
    company_job_count.total_jobs DESC;