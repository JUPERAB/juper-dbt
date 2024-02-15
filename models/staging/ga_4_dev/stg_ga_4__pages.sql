with pages_source as (
    select 
        user_pseudo_id,
        ga_session_id,
        concat(user_pseudo_id, ga_session_id) as super_id,
        parse_date('%Y%m%d', event_date) as date,
        event_timestamp,
        page_location,
        page_title
    from {{ source('ga_4', 'pages')}}
)

select * from pages_source 
