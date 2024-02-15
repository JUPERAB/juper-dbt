with user_engagement_source as (
    select 
        user_pseudo_id,
        ga_session_id,
        parse_date('%Y%m%d', event_date) as date,
        event_name
        event_timestamp,
        engagement_time_msec
    from {{ source('ga_4', 'user_engagement')}}
)

select * from user_engagement_source
