-- | 1) Which unique job postings appeared in either 2023 or 2024? |
-- 2) Which job postings appeared across both years, counting duplicates?
-- | 3) which job postings appeared in both 2023 and 2024 |
-- 4) which job postings appeared in both years, preserving duplicate counts? |
-- | 5) which job postings appeared in 2023 but not in 2024|
-- | 6) Which job postings appeared more times in 2023 than 2024, one-for-one? |

select * from job_postings_fact;

create temp table job_2023 as 
select * exclude(job_id,job_posted_date) from job_postings_fact
where extract(year from job_posted_date) = 2023;

select * from job_2023;

create temp table job_2024 as 
select * exclude(job_id,job_posted_date) from job_postings_fact
where extract(year from job_posted_date) = 2024;

select * from job_2024;

select 'job_2023' as year, count(*) as count from job_2023
union
select 'job_2024' as year, count(*) as count from job_2024;

select 'job_2023' as year, count(*) as count from job_2023
union all
select 'job_2024' as year, count(*) as count from job_2024;

select * from job_2023
except
select * from job_2024;
