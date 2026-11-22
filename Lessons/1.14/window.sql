SHOW TABLES;
SELECT * FROM information_schema;


select * from job_postings_fact;

select * from(
select job_id,job_title_short, avg(salary_hour_avg) 
OVER(PARTITION BY job_id, job_title_short) as avgg from job_postings_fact
) as average
where avgg is not null;



select job_id, job_title_short, salary_hour_avg, rank()
over(order by salary_hour_avg desc) as rank from job_postings_fact;
------------------------

select job_posted_date,job_title_short,salary_hour_avg, avg(salary_hour_avg) 
over(partition by job_title_short order by job_posted_date) as avgg from job_postings_fact
where salary_hour_avg is not null
order by job_title_short, job_posted_date
 limit 10;

 --------------------

 Select job_id, company_id, 
 job_title,job_title_short, job_posted_date, 
 salary_year_avg,lag(salary_year_avg)
 over(partition by company_id order by job_posted_date) as Prev_posting_salary,
 salary_year_avg - prev_posting_salary as salary_change
from job_postings_fact where salary_year_avg is not null limit 20 ;