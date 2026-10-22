SELECT jp.*, cd.*
FROM data_jobs.job_postings_fact AS jp
LEFT JOIN data_jobs.company_dim AS cd
    ON jp.company_id = cd.company_id
LIMIT 10;