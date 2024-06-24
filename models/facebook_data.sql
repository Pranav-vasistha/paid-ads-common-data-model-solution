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
        (likes + comments + inline_link_clicks + shares) AS engagement, -- Engagement defined as sum of likes, comments, link clicks, and shares
        (complete_registration + mobile_app_install + purchase) AS conversions -- Conversions defined as sum of registrations, installs, and purchases
    FROM 
        {{ ref('src_ads_creative_facebook_all_data') }}
),
facebook_data AS (
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
        ad_description,
        date,
        likes,
        comments,
        video_views,
        clicks,
        impressions,
        mobile_app_install AS installs,  -- Renamed mobile_app_install to installs
        inline_link_clicks AS link_clicks,  -- Renamed inline_link_clicks to link_clicks
        complete_registration AS registrations,  -- Renamed complete_registration to registrations
        revenue,
        shares,
        spend,
        purchase,
        engagement,
        conversions,
        ROUND(spend / NULLIF(engagement, 0), 2) AS engagement_cost,
        ROUND(spend / NULLIF(conversions, 0), 2) AS conversion_cost,
        ROUND(spend / NULLIF(clicks, 0), 2) AS cpc,
        ROUND((clicks / NULLIF(impressions, 0)) * 100, 2) AS ctr,
        ROUND(spend / NULLIF(impressions, 0), 2) AS cpi,
        ROUND((engagement / NULLIF(impressions, 0)) * 100, 2) AS engagement_rate
    FROM
        rename_facebook
)

SELECT *
FROM facebook_data