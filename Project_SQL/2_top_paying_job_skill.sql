WITH top_paying_job AS ( 
    SELECT
        job_id,
        job_title,    
        salary_year_avg,
        name as company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg desc
    LIMIT 10)

    SELECT 
        top_paying_job.*,
        skills
    FROM top_paying_job
    JOIN skills_job_dim ON top_paying_job.job_id = skills_job_dim.job_id
    JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    ORDER BY 
        salary_year_avg DESC