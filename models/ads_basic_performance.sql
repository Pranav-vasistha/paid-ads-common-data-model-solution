-- models/ads_basic_performance.sql
{{ config(materialized='table') }}

WITH bing AS (
    SELECT * FROM {{ ref('bing_data') }}
),
facebook AS (
    SELECT * FROM {{ ref('facebook_data') }}
),
tiktok AS (
    SELECT * FROM {{ ref('tiktok_data') }}
),
twitter AS (
    SELECT * FROM {{ ref('twitter_data') }}
)

SELECT * FROM bing
UNION ALL
SELECT * FROM facebook
UNION ALL
SELECT * FROM tiktok
UNION ALL
SELECT * FROM twitter
