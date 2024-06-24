-- models/twitter_data.sql

WITH rename_twitter AS (
    SELECT
        __insert_date AS insert_date,
        campaign_id,
        channel,
        url,
        text AS creative_title,
        clicks,
        comments,
        engagements as engagement,
        impressions,
        likes,
        url_clicks,
        retweets,
        spend,
        video_total_views AS video_views,
        0 AS conversions  -- Setting conversions to 0
    FROM 
        `paid-ads-model`.`dbt_pvasistha`.`src_promoted_tweets_twitter_all_data`
),
twitter_data AS (
    SELECT
        insert_date,
        NULL AS ad_id,
        NULL AS adset_id,
        campaign_id,
        channel,
        creative_title,
        clicks,
        `date` AS `date`, -- Ensure to use backticks around `date`
        impressions,
        NULL AS revenue,
        spend,
        conversions,
        engagement,
        ROUND(spend / NULLIF(engagement, 0), 2) AS engagement_cost,
        0 AS conversion_cost,  -- Setting conversion_cost to 0
        ROUND(spend / NULLIF(clicks, 0), 2) AS cpc,
        ROUND((clicks / NULLIF(impressions, 0)) * 100, 2) AS ctr,
        ROUND(spend / NULLIF(impressions, 0), 2) AS cpi,
        ROUND((engagement / NULLIF(impressions, 0)) * 100, 2) AS engagement_rate,
        video_views
    FROM
        rename_twitter
)

SELECT *
FROM twitter_data