-- models/twitter_data.sql

WITH rename_twitter AS (
    SELECT
        __insert_date AS date,
        campaign_id,
        channel,
        url,
        text AS creative_title,
        clicks,
        comments,
        engagements,
        impressions,
        likes,
        url_clicks,
        retweets,
        spend,
        video_total_views,
        engagements AS engagement, -- Engagement is same as engagements
        video_total_views AS video_views -- Video views same as video_total_views
    FROM 
        {{ ref('src_promoted_tweets_twitter_all_data') }}
),
twitter_data AS (
    SELECT
        date,
        campaign_id,
        channel,
        url,
        creative_title,
        clicks,
        comments,
        engagement, -- Use renamed engagement
        impressions,
        likes,
        url_clicks,
        retweets,
        spend,
        video_views, -- Use renamed video_views
        0 AS conversions,  -- Setting conversions to 0
        ROUND(spend / NULLIF(engagement, 0), 2) AS engagement_cost,
        0 AS conversion_cost,  -- Setting conversion_cost to 0
        ROUND(spend / NULLIF(clicks, 0), 2) AS cpc,
        ROUND((clicks / NULLIF(impressions, 0)) * 100, 2) AS ctr,
        ROUND(spend / NULLIF(impressions, 0), 2) AS cpi,
        ROUND((engagement / NULLIF(impressions, 0)) * 100, 2) AS engagement_rate
    FROM
        rename_twitter
)

SELECT *
FROM twitter_data
