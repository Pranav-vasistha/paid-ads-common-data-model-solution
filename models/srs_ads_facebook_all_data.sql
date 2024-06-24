-- SQL script for Facebook Ads data processing
WITH facebook_data AS (
    SELECT
        ad_id,
        add_to_cart,
        adset_id,
        campaign_id,
        channel,
        clicks,
        comments,
        creative_id,
        creative_title,
        objective,
        buying_type,
        campaign_type,
        creative_body AS ad_description,
        date,
        likes,
        shares,
        views AS video_views,
        clicks,
        impressions,
        mobile_app_install AS installs,
        inline_link_clicks AS link_clicks,
        purchase,
        complete_registration AS registrations,
        purchase_value AS revenue,
        spend,
        ROUND(spend / NULLIF(comments, 0), 2) AS engagement_cost, -- Using comments as engagements proxy
        ROUND(spend / NULLIF(purchase, 0), 2) AS conversion_cost,
        impressions AS impressions_by_channel,
        ROUND(spend / NULLIF(clicks, 0), 2) AS cpc,
        ROUND((clicks / NULLIF(impressions, 0)) * 100, 2) AS ctr,
        ROUND((spend / NULLIF(impressions, 0)) * 100, 2) AS cpi,
        purchase AS cv,  -- Assuming purchase as conversions
        ROUND((comments / NULLIF(impressions, 0)) * 100, 2) AS engagement_rate  -- Using comments as engagements proxy
    FROM 
        {{ ref('src_ads_creative_facebook_all_data') }}
)
