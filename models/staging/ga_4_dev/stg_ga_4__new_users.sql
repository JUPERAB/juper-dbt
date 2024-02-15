with new_users_source as (
    select 
        user_pseudo_id,
        ga_session_id,
        parse_date('%Y%m%d', event_date) as date,
        first_seen_timestamp
    from {{ source('ga_4', 'new_users')}}
)

select * from new_users_source
