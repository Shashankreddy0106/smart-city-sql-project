#Find which drivers contributed the most to total revenue in their respective city.
SELECT 
    r.city,
    d.name AS driver_name,
    ROUND(SUM(r.fare_rs), 2) AS driver_revenue,
    ROUND(100 * SUM(r.fare_rs) / SUM(SUM(r.fare_rs)) OVER (PARTITION BY r.city), 2) AS revenue_share_percent
FROM rides r
JOIN drivers d ON r.driver_id = d.driver_id
GROUP BY r.city, d.name
HAVING driver_revenue > 0
ORDER BY r.city, revenue_share_percent DESC;


#Find “loyal riders” — users who booked every month for 6+ consecutive months
WITH rider_activity AS (
  SELECT rider_id, DATE_FORMAT(start_time, '%Y-%m') AS ride_month
  FROM rides
  GROUP BY rider_id, ride_month
),
rider_streaks AS (
  SELECT rider_id, COUNT(*) AS active_months
  FROM rider_activity
  GROUP BY rider_id
)
SELECT r.name, rs.active_months
FROM rider_streaks rs
JOIN riders r ON rs.rider_id = r.rider_id
WHERE rs.active_months >= 6
ORDER BY rs.active_months DESC;

#Detect “inefficient rides” — high fare but low distance
SELECT 
    r.ride_id,
    d.name AS driver,
    r.city,
    r.distance_km,
    r.fare_rs,
    ROUND(r.fare_rs / r.distance_km, 2) AS fare_per_km
FROM rides r
JOIN drivers d ON r.driver_id = d.driver_id
WHERE r.distance_km > 1
ORDER BY fare_per_km DESC
LIMIT 10;

#Find correlation between driver experience and average feedback
SELECT 
    d.experience_years,
    ROUND(AVG(f.rating), 2) AS avg_feedback_rating,
    COUNT(*) AS total_feedbacks
FROM drivers d
JOIN rides r ON d.driver_id = r.driver_id
JOIN feedback f ON f.ride_id = r.ride_id
GROUP BY d.experience_years
ORDER BY d.experience_years;

#Find fastest growing cities by monthly ride volume
WITH monthly_rides AS (
  SELECT 
    city,
    DATE_FORMAT(start_time, '%Y-%m') AS month,
    COUNT(*) AS ride_count
  FROM rides
  GROUP BY city, month
),
growth AS (
  SELECT 
    city,
    month,
    ride_count,
    LAG(ride_count) OVER (PARTITION BY city ORDER BY month) AS prev_month_rides,
    ROUND(100 * (ride_count - LAG(ride_count) OVER (PARTITION BY city ORDER BY month)) / NULLIF(LAG(ride_count) OVER (PARTITION BY city ORDER BY month), 0), 2) AS growth_percent
  FROM monthly_rides
)
SELECT city, month, growth_percent
FROM growth
WHERE growth_percent IS NOT NULL
ORDER BY growth_percent DESC
LIMIT 10;