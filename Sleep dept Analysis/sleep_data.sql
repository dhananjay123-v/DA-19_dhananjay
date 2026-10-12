create database sleep_data

use sleep_data


select * from sleep_t

SELECT DISTINCT
    user_id,
    age,
    gender,
    occupation_type,
    chronotype,
    bedtime_phone_minutes,
    
    -- Clean app categories
    CASE 
        WHEN primary_bedtime_app LIKE '%TikTok%' OR primary_bedtime_app LIKE '%Reels%' THEN 'Social Video'
        WHEN primary_bedtime_app LIKE '%Instagram%' OR primary_bedtime_app LIKE '%Reddit%' THEN 'Social Feed'
        WHEN primary_bedtime_app LIKE '%Netflix%' OR primary_bedtime_app LIKE '%Hulu%' THEN 'Streaming TV'
        WHEN primary_bedtime_app LIKE '%YouTube%' THEN 'Video Platform'
        ELSE primary_bedtime_app
    END AS primary_bedtime_app_category,
    
    screen_brightness_pct,
    
    -- Convert 1/0 to Yes/No
    CASE WHEN blue_light_filter_active = 1 THEN 'Yes' ELSE 'No' END AS blue_light_filter,
    
    caffeine_post_5pm_mg,
    physical_activity_min,
    sleep_latency_min,
    total_sleep_hours,
    deep_sleep_pct,
    rem_sleep_pct,
    morning_alarm_snoozes,
    next_day_fatigue_score,
    sleep_debt_category

FROM sleep_t
WHERE user_id IS NOT NULL;