-- A CASE expression in SQL is a way to implement conditional logic in your queries. It allows you to return different values based on certain conditions. The basic syntax of a CASE expression is as follows:
--SELECT
--    CASE
--        WHEN condition1 THEN value1
--        WHEN condition2 THEN value2
--        ELSE value3
--    END AS new_column_name
--FROM
--    your_table;

-- CASE - begins the expression
-- WHEN - specifies the condition to evaluate
-- THEN - specifies the value to return if the condition is true
-- ELSE (optional)- specifies the value to return if none of the conditions are true
-- END - marks the end of the CASE expression

-- In case other columns are included in the SELECT statement, the last column should include a comma before the CASE expression, and the CASE expression should be the last column in the SELECT statement.
SELECT
    COUNT(job_id) AS jobs_posted_count,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM
    job_postings_fact
GROUP BY
    location_category