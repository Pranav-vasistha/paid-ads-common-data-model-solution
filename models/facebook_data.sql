-- models/facebook_data.sql
WITH facebook_data AS (
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
        mobile_app_install AS installs,
        inline_link_clicks AS link_clicks,
        complete_registration AS registrations,
        purchase_value AS revenue,
        shares,
        spend,
        purchase,
        (likes + comments + link_clicks + shares) AS engagement,
        (complete_registration + mobile_app_install + purchase) AS conversions,
        ROUND(spend / NULLIF(engagement, 0), 2) AS engagement_cost,
        ROUND(spend / NULLIF(conversions, 0), 2) AS conversion_cost,
        ROUND(spend / NULLIF(clicks, 0), 2) AS cpc,
        ROUND((clicks / NULLIF(impressions, 0)) * 100, 2) AS ctr,
        ROUND(spend / NULLIF(impressions, 0), 2) AS cpi,
        ROUND((engagement / NULLIF(impressions, 0)) * 100, 2) AS engagement_rate
    FROM 
        {{ ref('src_ads_creative_facebook_all_data') }}
)
