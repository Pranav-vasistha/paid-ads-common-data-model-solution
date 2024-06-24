-- models/bing_data.sql

WITH rename_bing AS (
    SELECT
        TIMESTAMP(CAST(__insert_date AS TIMESTAMP)) AS insert_date,
        ad_id,
        adset_id,
        campaign_id,
        channel,
        ad_description AS creative_title,
        title_part_1,
        title_part_2,
        clicks,
        date,
        imps AS impressions,
        revenue,
        spend,
        conv AS conversions,
        0 AS engagement,
        0 AS engagement_cost,
        ROUND(spend / NULLIF(conv, 0), 2) AS conversion_cost,
        ROUND(spend / NULLIF(clicks, 0), 2) AS cpc,
        ROUND((clicks / NULLIF(imps, 0)) * 100, 2) AS ctr,
        ROUND(spend / NULLIF(imps, 0), 2) AS cpi,
        0 AS engagement_rate,
        0 AS video_views
    FROM 
        {{ ref('src_ads_bing_all_data') }}
),
bing_data AS (
    SELECT
        insert_date,
        ad_id,
        adset_id,
        campaign_id,
        channel,
        creative_title,
        clicks,
        FORMAT_DATE('%Y-%m-%d', CAST(date AS DATE)) AS date,
        impressions,
        revenue,
        spend,
        conversions,
        engagement,
        engagement_cost,
        conversion_cost,
        cpc,
        ctr,
        cpi,
        engagement_rate,
        video_views
    FROM
        rename_bing
)

SELECT *
FROM bing_data