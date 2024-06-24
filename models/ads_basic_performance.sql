{{ config(materialized='view') }}

WITH alldata AS (
    SELECT 
        TIMESTAMP_SECONDS(CAST(insert_date AS INT64)) AS insert_date,
        CAST(ad_id AS STRING) AS ad_id,
        CAST(adset_id AS STRING) AS adset_id,
        CAST(campaign_id AS STRING) AS campaign_id,
        CAST(channel AS STRING) AS channel,
        CAST(creative_title AS STRING) AS creative_title,
        CAST(clicks AS INT64) AS clicks,
        CAST(date AS DATE) AS date,
        CAST(impressions AS INT64) AS impressions,
        CAST(revenue AS INT64) AS revenue,
        CAST(spend AS INT64) AS spend,
        CAST(conversions AS INT64) AS conversions,
        CAST(engagement AS INT64) AS engagement,
        CAST(engagement_cost AS FLOAT64) AS engagement_cost,
        CAST(conversion_cost AS FLOAT64) AS conversion_cost,
        CAST(cpc AS FLOAT64) AS cpc,
        CAST(ctr AS FLOAT64) AS ctr,
        CAST(cpi AS FLOAT64) AS cpi,
        CAST(engagement_rate AS FLOAT64) AS engagement_rate,
        CAST(video_views AS INT64) AS video_views
    FROM {{ ref('bing_data') }}
    UNION ALL
    SELECT 
        TIMESTAMP_SECONDS(CAST(insert_date AS INT64)) AS insert_date,
        CAST(ad_id AS STRING) AS ad_id,
        CAST(adset_id AS STRING) AS adset_id,
        CAST(campaign_id AS STRING) AS campaign_id,
        CAST(channel AS STRING) AS channel,
        CAST(creative_title AS STRING) AS creative_title,
        CAST(clicks AS INT64) AS clicks,
        CAST(date AS DATE) AS date,
        CAST(impressions AS INT64) AS impressions,
        CAST(revenue AS INT64) AS revenue,
        CAST(spend AS INT64) AS spend,
        CAST(conversions AS INT64) AS conversions,
        CAST(engagement AS INT64) AS engagement,
        CAST(engagement_cost AS FLOAT64) AS engagement_cost,
        CAST(conversion_cost AS FLOAT64) AS conversion_cost,
        CAST(cpc AS FLOAT64) AS cpc,
        CAST(ctr AS FLOAT64) AS ctr,
        CAST(cpi AS FLOAT64) AS cpi,
        CAST(engagement_rate AS FLOAT64) AS engagement_rate,
        CAST(video_views AS INT64) AS video_views
    FROM {{ ref('twitter_data') }}
    UNION ALL
    SELECT 
        TIMESTAMP_SECONDS(CAST(insert_date AS INT64)) AS insert_date,
        CAST(ad_id AS STRING) AS ad_id,
        CAST(adset_id AS STRING) AS adset_id,
        CAST(campaign_id AS STRING) AS campaign_id,
        CAST(channel AS STRING) AS channel,
        CAST(creative_title AS STRING) AS creative_title,
        CAST(clicks AS INT64) AS clicks,
        CAST(date AS DATE) AS date,
        CAST(impressions AS INT64) AS impressions,
        CAST(revenue AS INT64) AS revenue,
        CAST(spend AS INT64) AS spend,
        CAST(conversions AS INT64) AS conversions,
        CAST(engagement AS INT64) AS engagement,
        CAST(engagement_cost AS FLOAT64) AS engagement_cost,
        CAST(conversion_cost AS FLOAT64) AS conversion_cost,
        CAST(cpc AS FLOAT64) AS cpc,
        CAST(ctr AS FLOAT64) AS ctr,
        CAST(cpi AS FLOAT64) AS cpi,
        CAST(engagement_rate AS FLOAT64) AS engagement_rate,
        CAST(video_views AS INT64) AS video_views
    FROM {{ ref('tiktok_data') }}
    UNION ALL
    SELECT 
        TIMESTAMP_SECONDS(CAST(insert_date AS INT64)) AS insert_date,
        CAST(ad_id AS STRING) AS ad_id,
        CAST(adset_id AS STRING) AS adset_id,
        CAST(campaign_id AS STRING) AS campaign_id,
        CAST(channel AS STRING) AS channel,
        CAST(creative_title AS STRING) AS creative_title,
        CAST(clicks AS INT64) AS clicks,
        CAST(date AS DATE) AS date,
        CAST(impressions AS INT64) AS impressions,
        CAST(revenue AS INT64) AS revenue,
        CAST(spend AS INT64) AS spend,
        CAST(conversions AS INT64) AS conversions,
        CAST(engagement AS INT64) AS engagement,
        CAST(engagement_cost AS FLOAT64) AS engagement_cost,
        CAST(conversion_cost AS FLOAT64) AS conversion_cost,
        CAST(cpc AS FLOAT64) AS cpc,
        CAST(ctr AS FLOAT64) AS ctr,
        CAST(cpi AS FLOAT64) AS cpi,
        CAST(engagement_rate AS FLOAT64) AS engagement_rate,
        CAST(video_views AS INT64) AS video_views
    FROM {{ ref('facebook_data') }}
)

SELECT * FROM alldata
