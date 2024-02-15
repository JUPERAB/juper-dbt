with traffic_sources_source as (
    select 
        user_pseudo_id,
        ga_session_id,
        concat(user_pseudo_id, ga_session_id) as super_id,
        parse_date('%Y%m%d', event_date) as date,
        event_timestamp,
        traffic_source,
        medium,
        campaign
    from {{ source('ga_4', 'traffic_sources')}}
)

select * from traffic_sources_source
