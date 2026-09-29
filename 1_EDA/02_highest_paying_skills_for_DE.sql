{# Question: What are the highest-paying skills for data engineers?

* Calculate the median salary for each skill required in data engineer
positions 
* Focus on remote positions with specified salaries 
* Include skill frequency to identify both salary and demand
* Why? |
    o Helps identify which skills command the highest compensation 
    while also showing how common those skills are, providing a more
    complete picture for skill development priorities.

    o The median is used instead of the average to reduce the impact of
    outlier salaries.#}

select  median(jp.salary_year_avg) as median_salary, count(jp.*) as demand_count, sd.skills from job_postings_fact as jp inner join skills_job_dim as sjd on jp.job_id=sjd.job_id
inner join skills_dim as sd on sjd.skill_id=sd.skill_id
where jp.job_title = 'Data Engineer' and jp.job_work_from_home = True and jp.salary_year_avg is not null
group by sd.skills
order by median_salary desc
limit 10;


*/
┌───────────────┬──────────────┬────────────┐
│ median_salary │ demand_count │   skills   │
│    double     │    int64     │  varchar   │
├───────────────┼──────────────┼────────────┤
│      120000.0 │          323 │ sql        │
│      122500.0 │          283 │ python     │
│      122500.0 │          194 │ aws        │
│      120000.0 │          124 │ azure      │
│      125000.0 │          117 │ spark      │
│      124750.0 │           96 │ snowflake  │
│      135000.0 │           88 │ airflow    │
│      124250.0 │           84 │ java       │
│      118750.0 │           82 │ redshift   │
│      120000.0 │           74 │ databricks │
└───────────────┴──────────────┴────────────┘
*/