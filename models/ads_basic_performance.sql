-- models/ads_basic_performance.sql
{{ config(materialized='table') }}

with bing as (
    select * from {{ ref('bing_data') }}
),
facebook as (
    select * from {{ ref('facebook_data') }}
),
tiktok as (
    select * from {{ ref('tiktok_data') }}
),
twitter as (
    select * from {{ ref('twitter_data') }}
)

select * from bing
union all
select * from facebook
union all
select * from tiktok
union all
select * from twitter
