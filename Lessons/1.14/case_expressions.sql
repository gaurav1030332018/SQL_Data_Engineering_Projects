-- | —— Final Example: Conditional Calculations |
-- | —— Compute a standardized_salary using yearly salary and adjusted hourly salary (e.g. 2080 hours/year)
-- = Categorize salaries into tiers of: |
-- — < 75K 'Low' |
-- | -- 75K - 150K Medium’ |
-- | —- >= 150K 'High' |


with salary as(
select job_title_short, salary_year_avg, salary_hour_avg,
case 
when salary_year_avg is not null then salary_year_avg
when salary_hour_avg is not null then salary_hour_avg * 2080
end as standardized_salary
from job_postings_fact
)

select *,
case
when standardized_salary < 75000 then 'Low'
when standardized_salary >= 75000 and standardized_salary < 150000 then 'Medium'
when standardized_salary >= 150000 then 'High'
end as salary_tier
from salary;


