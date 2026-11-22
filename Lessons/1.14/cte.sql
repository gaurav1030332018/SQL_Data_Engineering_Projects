-- -- Find the top 3 skills by job count for Data Engineer postings. Use a CTE to identify
--  Data Engineer job IDs and another to aggregate skills.


with cte as(
select * from job_postings_fact as jp 
join skills_job_dim as sjd on jp.job_id=sjd.job_id
join skills_dim as sd on sjd.skill_id=sd.skill_id
)
select skills, count(*) as cnt from cte where job_title_short ='Data Engineer' group by skills 
order by cnt desc limit 3;

-- Find companies whose number of 
-- job postings is greater than the average number of postings per company.

with cte as(
select cd.name, count(jp.job_id) as total_num_postings from company_dim as cd right join job_postings_fact as jp on cd.company_id=jp.company_id 
group by cd.name
)
select * from cte where total_num_postings>(select avg(total_num_postings) from cte)
order by total_num_postings desc;

