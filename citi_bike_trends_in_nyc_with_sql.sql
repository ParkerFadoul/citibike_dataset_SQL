-- Citi Bike Trends in NYC - SQL Queries
-- Author: Parker Fadoul
-- Dataset: bigquery-public-data.new_york_citibike.citibike_trips
-- Analysis Date: July 2015 (unless otherwise noted)

------------------------------------------------------------
-- 1. Rides by Hour of Day (July 2015)
-- Shows how ridership varies by hour
------------------------------------------------------------
SELECT
  EXTRACT(HOUR FROM starttime) AS hour,
  COUNT(*) AS trip_count
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE starttime BETWEEN '2015-07-01' AND '2015-07-31'
GROUP BY hour
ORDER BY hour;

------------------------------------------------------------
-- 2. Rides by Hour and Gender
-- Reveals differences in hourly ridership patterns by gender
------------------------------------------------------------
SELECT
  EXTRACT(HOUR FROM starttime) AS hour,
  gender,
  COUNT(*) AS trip_count
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE starttime BETWEEN '2015-07-01' AND '2015-07-31'
GROUP BY hour, gender
ORDER BY hour, gender;

------------------------------------------------------------
-- 3. Rides by Hour and Age Group
-- Segments rides by age bin for each hour
------------------------------------------------------------
SELECT
  EXTRACT(HOUR FROM starttime) AS hour,
  CASE
    WHEN 2015 - birth_year BETWEEN 18 AND 24 THEN '18–24'
    WHEN 2015 - birth_year BETWEEN 25 AND 34 THEN '25–34'
    WHEN 2015 - birth_year BETWEEN 35 AND 44 THEN '35–44'
    WHEN 2015 - birth_year BETWEEN 45 AND 54 THEN '45–54'
    ELSE '55+'
  END AS age_group,
  COUNT(*) AS trip_count
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE starttime BETWEEN '2015-07-01' AND '2015-07-31'
  AND birth_year BETWEEN 1920 AND 2000
GROUP BY hour, age_group
ORDER BY hour, age_group;

------------------------------------------------------------
-- 4. Average Trip Duration by Age Group
------------------------------------------------------------
SELECT
  CASE
    WHEN 2015 - birth_year BETWEEN 18 AND 24 THEN '18–24'
    WHEN 2015 - birth_year BETWEEN 25 AND 34 THEN '25–34'
    WHEN 2015 - birth_year BETWEEN 35 AND 44 THEN '35–44'
    WHEN 2015 - birth_year BETWEEN 45 AND 54 THEN '45–54'
    ELSE '55+'
  END AS age_group,
  ROUND(AVG(tripduration) / 60, 2) AS avg_duration_minutes,
  COUNT(*) AS num_rides
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE starttime BETWEEN '2015-07-01' AND '2015-07-31'
  AND birth_year BETWEEN 1920 AND 2000
GROUP BY age_group
ORDER BY age_group DESC;

------------------------------------------------------------
-- 5. Average Trip Duration by Age, Gender, and User Type
-- Focused on rides under 2 hours
------------------------------------------------------------
SELECT
  usertype,
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
  WHERE birth_year IS NOT NULL AND tripduration <= 7200
)
GROUP BY usertype, age_group, gender
ORDER BY avg_trip_minutes DESC;

------------------------------------------------------------
-- 6. Unknown Gender Riders by User Type
-- Shows longer trip times and higher volume from 'unknown' gender
------------------------------------------------------------
SELECT
  usertype,
  COUNT(*) AS trip_count,
  ROUND(AVG(tripduration) / 60, 2) AS avg_trip_minutes
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE gender = 'unknown' AND tripduration <= 7200
GROUP BY usertype
ORDER BY avg_trip_minutes DESC;

------------------------------------------------------------
-- 7. Median vs. Average Trip Duration
-- Highlights skew in trip length
------------------------------------------------------------
SELECT
  ROUND(APPROX_QUANTILES(tripduration / 60, 2)[OFFSET(1)],2) AS median_minutes,
  ROUND(AVG(tripduration) / 60, 2) AS avg_minutes
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE tripduration BETWEEN 60 AND 7200;

------------------------------------------------------------
-- 8. Most Frequent Routes by Trip Count
-- Based on July 2015
------------------------------------------------------------
SELECT
  CONCAT(start_station_name, ' → ', end_station_name) AS route,
  COUNT(*) AS trip_count
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE starttime BETWEEN '2015-07-01' AND '2015-07-31'
  AND start_station_id IS NOT NULL
GROUP BY route
ORDER BY trip_count DESC
LIMIT 5;

------------------------------------------------------------
-- 9. Longest Average Routes (filtered for realism)
-- Filters outliers by requiring > 100 trips and caps duration at 4 hrs
------------------------------------------------------------
SELECT
  CONCAT(start_station_name, ' → ', end_station_name) AS route,
  ROUND(AVG(tripduration) / 60, 2) AS avg_duration_minutes,
  COUNT(*) AS trip_count
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE start_station_name IS NOT NULL
  AND end_station_name IS NOT NULL
  AND tripduration BETWEEN 60 AND 14400
GROUP BY route
HAVING trip_count > 100
ORDER BY avg_duration_minutes DESC
LIMIT 10;
