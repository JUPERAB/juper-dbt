with source as (

    select * from {{ source('google_ads','p_ads_Campaign_6682792847') }}

),

final as (
    select *

    from source
)


select * from final