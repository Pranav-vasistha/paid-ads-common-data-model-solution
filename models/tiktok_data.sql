-- SQL script for TikTok Ads data processing

WITH tiktok_data AS (
    SELECT
        __insert_date AS insert_date,
        ad_id,
        add_to_cart,
        adgroup_id AS adset_id,
        campaign_id,
        channel,
        clicks,
        date,
        impressions,
        (rt_installs + skan_app_install + registrations) AS engagement, -- Engagement defined as sum of installs and registrations
        ad_status,
        ad_text AS creative_body,
        spend,
        video_views,
        (conversions + skan_conversion) AS conversions, -- Conversions defined as sum of conversions, and skan_conversion
        ROUND(spend / NULLIF(clicks, 0), 2) AS cpc,
        ROUND((clicks / NULLIF(impressions, 0)) * 100, 2) AS ctr,
        ROUND(spend / NULLIF(impressions, 0), 2) AS cpi,
        ROUND((engagement / NULLIF(impressions, 0)) * 100, 2) AS engagement_rate,
        ROUND(spend / NULLIF(engagement, 0), 2) AS engagement_cost,
        ROUND(spend / NULLIF(conversions, 0), 2) AS conversion_cost
    FROM 
        {{ ref('src_ads_tiktok_ads_all_data') }}
)

SELECT *
FROM tiktok_data;
