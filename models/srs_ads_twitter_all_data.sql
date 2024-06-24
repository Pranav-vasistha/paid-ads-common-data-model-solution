-- SQL script for Twitter Ads data processing
WITH twitter_data AS (
    SELECT
        campaign_id,
        channel,
        url AS creative_title,
        text AS ad_description,
        clicks,
        comments,
        date,
        engagements,
        impressions,
        likes,
        url_clicks,
        retweets,
        spend,
        video_total_views AS video_views,
        ROUND(spend / NULLIF(engagements, 0), 2) AS engagement_cost,
        NULL AS conversion_cost,  -- No conversions value, setting to NULL
        impressions AS impressions_by_channel,
        ROUND(spend / NULLIF(clicks, 0), 2) AS cpc,
        ROUND((clicks / NULLIF(impressions, 0)) * 100, 2) AS ctr,
        ROUND((spend / NULLIF(impressions, 0)) * 100, 2) AS cpi,
        NULL AS cv,   -- No conversions value, setting to NULL
        ROUND((engagements / NULLIF(impressions, 0)) * 100, 2) AS engagement_rate
    FROM 
        {{ ref('src_promoted_tweets_twitter_all_data') }}
)
