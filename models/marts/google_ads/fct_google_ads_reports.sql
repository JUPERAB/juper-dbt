with keyword_stats as (
  select * from {{ ref('stg_google_ads__keyword_basic_stats') }}
),

keyword as (
  select 
    ad_group_criterion_keyword_text,
    ad_group_criterion_criterion_id,
    ad_group_criterion_keyword_match_type

   from {{ ref('stg_google_ads__keyword') }}

   group by 1,2,3
),

campaigns as (
  select
    campaign_id,
    campaign_name
  
  from {{ ref('stg_google_ads__campaign') }}

  group by 1,2
),

ad_groups as (
  select 
    ad_group_id,
    ad_group_name

  from {{ ref('stg_google_ads__adgroup') }}

  group by 1, 2
),

fields as (
  select
    keyword_stats.ad_group_criterion_criterion_id as criterion_id,
    keyword_stats.campaign_id as campaign_id,
    ad_group_criterion_keyword_match_type as keyword_match_type,

    ad_group_name,

    keyword.ad_group_criterion_keyword_text as keyword_text,
    keyword_stats.segments_date as date,

    campaigns.campaign_name,

    sum(keyword_stats.metrics_clicks) as clicks,
    sum(keyword_stats.metrics_cost_micros / 1000000) as cost,
    --sum(keyword_stats.metrics_ctr) as ctr,
    sum(keyword_stats.metrics_impressions) as impressions,
    --sum((keyword_stats.metrics_cost_micros / 1000000) / keyword_stats.metrics_clicks) as cpc

  from keyword_stats



  left join keyword on
    keyword_stats.ad_group_criterion_criterion_id = keyword.ad_group_criterion_criterion_id
  left join campaigns using(campaign_id)
  left join ad_groups using(ad_group_id)



  group by 1,2,3,4,5,6,7
  --order by cost desc
)
select * from fields
--select min(date) from fields
