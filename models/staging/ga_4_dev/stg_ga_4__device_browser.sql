with device_browser_source as (
    select 
        user_pseudo_id,
        ga_session_id,
        concat(user_pseudo_id, ga_session_id) as super_id,
        parse_date('%Y%m%d', event_date) as date, -- Bigquery saves dates as strings from event_date, parsing here to convert to date data type
        event_timestamp as timestamp,
        category,
        operating_system,
        browser
    from 
        {{ source('ga_4', 'device_browser') }}
)

select * from device_browser_source