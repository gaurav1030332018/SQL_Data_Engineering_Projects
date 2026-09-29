select 

jpc.job_id,
jpc.job_title,
cd.name as company_name

from job_postings_fact as jpc
inner join company_dim as cd
on jpc.company_id = cd.company_id; 