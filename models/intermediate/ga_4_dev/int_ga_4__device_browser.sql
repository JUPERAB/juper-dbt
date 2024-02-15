with device_browser as (

    select
        date,
        category,
        count(distinct(super_id)) as device_count
    from 
        {{ ref('stg_ga_4__device_browser') }} 
    group by 
        1, 2
)

select * from device_browser