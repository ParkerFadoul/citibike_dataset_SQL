-- Citi Bike Trends in NYC with SQL
-- By Parker Fadoul
-- Initial SQL queries using BigQuery public dataset: bigquery-public-data.new_york_citibike.citibike_trips

-- 1. Total number of trips in the dataset
SELECT COUNT(*) AS total_trips
FROM `bigquery-public-data.new_york_citibike.citibike_trips`;

-- 2. Total trips by hour of the day (excluding NULL start times)
SELECT
  EXTRACT(HOUR FROM starttime) AS hour,
  COUNT(*) AS trip_count
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE starttime IS NOT NULL
GROUP BY hour
ORDER BY hour;

-- 3. Deeper look at trips during hours 0, 1, and 23 (excluding NULL start times)
SELECT
  EXTRACT(HOUR FROM starttime) AS hour,
  EXTRACT(DATE FROM starttime) AS date,
  COUNT(*) AS trips
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE starttime IS NOT NULL
  AND EXTRACT(HOUR FROM starttime) IN (0, 1, 23)
GROUP BY hour, date
ORDER BY date, hour;

-- 4. Rider age and gender breakdown with age group bins
SELECT
  CASE
    WHEN age BETWEEN 18 AND 24 THEN '18–24'
    WHEN age BETWEEN 25 AND 34 THEN '25–34'
    WHEN age BETWEEN 35 AND 44 THEN '35–44'
    WHEN age BETWEEN 45 AND 54 THEN '45–54'
    ELSE '55+'
  END AS age_group,
  gender,
  COUNT(*) AS trip_count,
  ROUND(AVG(tripduration) / 60, 2) AS avg_trip_minutes
FROM (
  SELECT
    *,
    EXTRACT(YEAR FROM CURRENT_DATE()) - birth_year AS age
  FROM `bigquery-public-data.new_york_citibike.citibike_trips`
  WHERE birth_year IS NOT NULL
)
GROUP BY age_group, gender
ORDER BY age_group, gender;
