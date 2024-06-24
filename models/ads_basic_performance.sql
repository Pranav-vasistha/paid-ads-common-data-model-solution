-- models/ads_basic_performance.sql
{{ config(materialized='view') }}

with bing as (
    select * from {{ ref('src_ads_bing_all_data') }}
),
facebook as (
    select * from {{ ref('src_ads_creative_facebook_all_data') }}
),
tiktok as (
    select * from {{ ref('src_ads_tiktok_ads_all_data') }}
),
twitter as (
    select * from {{ ref('src_promoted_tweets_twitter_all_data') }}
)

select * from bing
union all
select * from facebook
union all
select * from tiktok
union all
select * from twitter
