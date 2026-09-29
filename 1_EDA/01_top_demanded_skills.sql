{# Question: What are the most in-demand skills for data engineers?
* Identify the top 10 in-demand skills for data engineers
* Focus on remote job postings
+ Why? |

o Retrieves the top 10 skills with the highest demand in the remote job market, 
providing insights into the most valuable skills for data 
engineers seeking remote work #}

select  sd.skills, count(jp.*) as skill_count from job_postings_fact as jp inner join skills_job_dim as sjd on jp.job_id=sjd.job_id
inner join skills_dim as sd on sjd.skill_id=sd.skill_id 
where jp.job_title = 'Data Engineer' and jp.job_work_from_home = True
group by sd.skills
order by skill_count desc
limit 10;


/*

┌────────────┬─────────────┐
│   skills   │ skill_count │
│  varchar   │    int64    │
├────────────┼─────────────┤
│ sql        │        7508 │
│ python     │        7249 │
│ aws        │        4182 │
│ azure      │        3535 │
│ spark      │        3393 │
│ airflow    │        2539 │
│ snowflake  │        2198 │
│ java       │        1852 │
│ databricks │        1733 │
│ scala      │        1647 │
└────────────┴─────────────┘

*/

