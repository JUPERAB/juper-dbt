with session_duration_source as (
    select 
        user_pseudo_id,
        ga_session_id,
        concat(user_pseudo_id, ga_session_id) as super_id,
        parse_date('%Y%m%d', event_date) as date,
        session_start_timestamp,
        session_end_timestamp,
        session_duration_seconds
    from {{ source('ga_4', 'session_duration')}}
)

select * from session_duration_source
