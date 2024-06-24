-- SQL script for TikTok Ads data processing

SELECT
    insert_date,
    ad_id,
    add_to_cart,
    adgroup_id AS adset_id,
    campaign_id,
    channel,
    clicks,
    date,
    impressions,
    video_views,
    ROUND(spend / engagements, 2) AS engagement_cost,
    ROUND(spend / conversions, 2) AS conversion_cost,
    impressions AS impressions_by_channel,
    ROUND(spend / clicks, 2) AS cpc,
    null AS ctr,  -- Placeholder for CTR calculation
    null AS cpi,  -- Placeholder for CPI calculation
    null AS cv,   -- Placeholder for CV calculation
    null AS engagement_rate  -- Placeholder for Engagement Rate calculation
FROM
    src_ads_tiktok_ads_all_data
