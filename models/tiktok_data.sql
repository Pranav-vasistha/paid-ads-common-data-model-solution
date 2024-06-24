-- models/tiktok_data.sql

WITH rename_tiktok AS (
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
        rt_installs,
        skan_app_install,
        registrations,
        ad_status,
        ad_text AS creative_body,
        spend,
        video_views,
        (rt_installs + skan_app_install + registrations) AS engagement, -- Engagement defined as sum of installs and registrations
        (conversions + skan_conversion) AS conversions -- Conversions defined as sum of conversions and skan_conversion
    FROM 
        {{ ref('src_ads_tiktok_ads_all_data') }}
),
tiktok_data AS (
    SELECT
        insert_date,
        ad_id,
        add_to_cart,
        adset_id,
        campaign_id,
        channel,
        clicks,
        date,
        impressions,
        ad_status,
        creative_body,
        spend,
        video_views,
        ROUND(spend / NULLIF(clicks, 0), 2) AS cpc,
        ROUND((clicks / NULLIF(impressions, 0)) * 100, 2) AS ctr,
        ROUND(spend / NULLIF(impressions, 0), 2) AS cpi,
        ROUND((engagement / NULLIF(impressions, 0)) * 100, 2) AS engagement_rate,
        ROUND(spend / NULLIF(engagement, 0), 2) AS engagement_cost,
        ROUND(spend / NULLIF(conversions, 0), 2) AS conversion_cost
    FROM
        rename_tiktok
)

SELECT *
FROM tiktok_data