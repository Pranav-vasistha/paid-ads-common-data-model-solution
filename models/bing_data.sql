-- models/bing_data.sql

WITH rename_bing AS (
    SELECT
        __insert_date AS insert_date,
        ad_id,
        adset_id,
        campaign_id,
        channel,
        ad_description AS creative_title,
        title_part_1,
        title_part_2,
        clicks,
        date,
        imps AS impressions,  -- Renaming imps to impressions
        revenue,
        spend,
        conv AS conversions
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
        title_part_1,
        title_part_2,
        clicks,
        date,
        impressions,
        revenue,
        spend,
        conversions,
        0 AS engagement_cost,  -- No engagements value, setting to 0
        ROUND(spend / NULLIF(conversions, 0), 2) AS conversion_cost,
        ROUND(spend / NULLIF(clicks, 0), 2) AS cpc,
        ROUND((clicks / NULLIF(impressions, 0)) * 100, 2) AS ctr,  -- Using impressions
        ROUND(spend / NULLIF(impressions, 0), 2) AS cpi,  -- Using impressions
        0 AS engagement_rate  -- No engagements value, setting to 0
    FROM
        rename_bing
)

SELECT * FROM bing_data
