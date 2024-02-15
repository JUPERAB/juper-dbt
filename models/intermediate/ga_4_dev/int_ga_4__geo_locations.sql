with geo_locations as (

    select
        date,
        case when city = '' then 'unknown city' else city end as city,
        count(distinct(super_id)) as user_count --counts distinct users
    from 
        {{ ref('stg_ga_4__geo_locations') }} 
    group by 
        1, 2
)

select * from geo_locations