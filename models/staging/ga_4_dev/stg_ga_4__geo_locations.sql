with geo_locations_source as (
    select 
        user_pseudo_id,
        ga_session_id,
        concat(user_pseudo_id, ga_session_id) as super_id,
        parse_date('%Y%m%d', event_date) as date,
        event_timestamp as timestamp,
        country,
        city,
        region,
        continent,
        sub_continent
    from {{ source('ga_4', 'geo_locations')}}
)

select * from geo_locations_source
