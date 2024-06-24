{{ config(materialized='view') }}

WITH alldata AS (
    SELECT 
        CAST(ad_id AS STRING) AS ad_id,
        CAST(adset_id AS STRING) AS adset_id,
        CAST(campaign_id AS STRING) AS campaign_id,
        CAST(channel AS STRING) AS channel,
        CAST(creative_title AS STRING) AS creative_title,
        CAST(clicks AS INT64) AS clicks,
        FORMAT_DATE('%Y-%m-%d', CAST(date AS DATE)) AS date,
        CAST(impressions AS INT64) AS impressions,
        CAST(revenue AS INT64) AS revenue,
        CAST(spend AS INT64) AS spend,
        CAST(conversions AS INT64) AS conversions,
        CAST(engagement AS INT64) AS engagement,
        CAST(video_views AS INT64) AS video_views
    FROM {{ ref('bing_data') }}
    UNION ALL
    SELECT 
        CAST(ad_id AS STRING) AS ad_id,
        CAST(adset_id AS STRING) AS adset_id,
        CAST(campaign_id AS STRING) AS campaign_id,
        CAST(channel AS STRING) AS channel,
        CAST(creative_title AS STRING) AS creative_title,
        CAST(clicks AS INT64) AS clicks,
        FORMAT_DATE('%Y-%m-%d', CAST(date AS DATE)) AS date,
        CAST(impressions AS INT64) AS impressions,
        CAST(revenue AS INT64) AS revenue,
        CAST(spend AS INT64) AS spend,
        CAST(conversions AS INT64) AS conversions,
        CAST(engagement AS INT64) AS engagement,
        CAST(video_views AS INT64) AS video_views
    FROM {{ ref('twitter_data') }}
    UNION ALL
    SELECT 
        CAST(ad_id AS STRING) AS ad_id,
        CAST(adset_id AS STRING) AS adset_id,
        CAST(campaign_id AS STRING) AS campaign_id,
        CAST(channel AS STRING) AS channel,
        CAST(creative_title AS STRING) AS creative_title,
        CAST(clicks AS INT64) AS clicks,
        FORMAT_DATE('%Y-%m-%d', CAST(date AS DATE)) AS date,
        CAST(impressions AS INT64) AS impressions,
        CAST(revenue AS INT64) AS revenue,
        CAST(spend AS INT64) AS spend,
        CAST(conversions AS INT64) AS conversions,
        CAST(engagement AS INT64) AS engagement,
        CAST(video_views AS INT64) AS video_views
    FROM {{ ref('tiktok_data') }}
    UNION ALL
    SELECT 
        CAST(ad_id AS STRING) AS ad_id,
        CAST(adset_id AS STRING) AS adset_id,
        CAST(campaign_id AS STRING) AS campaign_id,
        CAST(channel AS STRING) AS channel,
        CAST(creative_title AS STRING) AS creative_title,
        CAST(clicks AS INT64) AS clicks,
        FORMAT_DATE('%Y-%m-%d', CAST(date AS DATE)) AS date,
        CAST(impressions AS INT64) AS impressions,
        CAST(revenue AS INT64) AS revenue,
        CAST(spend AS INT64) AS spend,
        CAST(conversions AS INT64) AS conversions,
        CAST(engagement AS INT64) AS engagement,
        CAST(video_views AS INT64) AS video_views
    FROM {{ ref('facebook_data') }}
)

SELECT * FROM alldata
