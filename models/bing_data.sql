-- SQL script for Bing Ads data processing
WITH bing_data AS (
    SELECT
        insert_date,
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
        0 AS engagement_cost,  -- No engagements value, setting to 0
        ROUND(spend / NULLIF(conv, 0), 2) AS conversion_cost,
        ROUND(spend / NULLIF(clicks, 0), 2) AS cpc,
        ROUND((clicks / NULLIF(impressions, 0)) * 100, 2) AS ctr,
        ROUND(spend / NULLIF(impressions, 0), 2) AS cpi,
        0 AS engagement_rate  -- No engagements value, setting to 0
    FROM 
        {{ ref('src_ads_bing_all_data') }}
)
