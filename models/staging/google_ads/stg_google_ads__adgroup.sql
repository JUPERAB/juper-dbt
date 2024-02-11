with source as (

    select * from {{ source('google_ads','p_ads_AdGroup_6682792847') }}

),

final as (
    select *

    from source


)


select * from final