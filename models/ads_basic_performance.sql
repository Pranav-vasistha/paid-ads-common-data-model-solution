SELECT 
    insert_date,
    ad_id,
    adset_id,
    campaign_id,
    channel,
    creative_title,
    clicks,
    date,
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
FROM (
    SELECT * FROM bing_data
    UNION ALL
    SELECT * FROM facebook_data
    UNION ALL
    SELECT * FROM twitter_data
    UNION ALL
    SELECT * FROM tiktok_data
) AS ads_basic_performance