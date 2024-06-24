-- models/facebook_data.sql

WITH rename_facebook AS (
    SELECT
        ad_id,
        add_to_cart,
        adset_id,
        campaign_id,
        channel,
        creative_id,
        creative_title,
        objective,
        buying_type,
        campaign_type,
        creative_body AS ad_description,
        date,
        likes,
        comments,
        views AS video_views,
        clicks,
        impressions,
        mobile_app_install,
        inline_link_clicks,
        complete_registration,
        purchase_value AS revenue,
        shares,
        spend,
        purchase,
        (likes + comments + inline_link_clicks + shares) AS engagement,
        (complete_registration + mobile_app_install + purchase) AS conversions
    FROM 
        {{ ref('src_ads_creative_facebook_all_data') }}
),
facebook_data AS (
    SELECT
        NULL AS insert_date,
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
        ROUND(spend / NULLIF(engagement, 0), 2) AS engagement_cost,
        ROUND(spend / NULLIF(conversions, 0), 2) AS conversion_cost,
        ROUND(spend / NULLIF(clicks, 0), 2) AS cpc,
        ROUND((clicks / NULLIF(impressions, 0)) * 100, 2) AS ctr,
        ROUND(spend / NULLIF(impressions, 0), 2) AS cpi,
        ROUND((engagement / NULLIF(impressions, 0)) * 100, 2) AS engagement_rate,
        video_views
    FROM
        rename_facebook
)

SELECT *
FROM facebook_data