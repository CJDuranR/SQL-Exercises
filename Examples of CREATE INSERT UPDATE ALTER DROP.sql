CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);

INSERT INTO job_applied (job_id, 
                        application_sent_date, 
                        custom_resume, 
                        resume_file_name, 
                        cover_letter_sent, 
                        cover_letter_file_name, 
                        status)
VALUES                  (1, 
                        '2024-02-01', 
                        TRUE, 
                        'resume_01.pdf', 
                        TRUE, 
                        'cover_letter_01.pdf', 
                        'Submitted'),
                        (2,
                        '2024-02-05',
                        FALSE,
                        'resume_02.pdf',
                        FALSE,
                        NULL,
                        'Draft'),
                        (3,
                        '2024-02-10',
                        TRUE,
                        'resume_03.pdf',
                        TRUE,
                        'cover_letter_03.pdf',
                        'Interview Scheduled'),
                        (4,
                        '2024-02-15',
                        FALSE,
                        'resume_04.pdf',
                        FALSE,
                        NULL,
                        'Rejected'),
                        (5,
                        '2024-02-20',
                        TRUE,
                        'resume_05.pdf',
                        TRUE,
                        'cover_letter_05.pdf',
                        'Offer Extended'),
                        (6,
                        '2024-02-25',
                        TRUE,
                        'resume_06.pdf',
                        TRUE,
                        'cover_letter_06.pdf',
                        'Offer Accepted');

SELECT 
    * 
FROM 
    job_applied;

ALTER TABLE job_applied
ADD Contact vARCHAR(50);


UPDATE job_applied
SET Contact = 'Cristian Duran'
WHERE job_id = 1;

UPDATE job_applied
SET Contact = 'Juan Duran'
WHERE job_id = 2;

UPDATE job_applied
SET Contact = 'Maria Lopez'
WHERE job_id = 3;

UPDATE job_applied
SET Contact = 'Carlos Ramirez'
WHERE job_id = 4;

UPDATE job_applied
SET Contact = 'Ana Torres'
WHERE job_id = 5;

UPDATE job_applied
SET Contact = 'Luis Fernandez'
WHERE job_id = 6;

ALTER TABLE job_applied
RENAME Contact TO contact_name;

ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;

ALTER TABLE job_applied
DROP COLUMN contact_name;

DROP TABLE job_applied;