# 🚲 Citi Bike Trends in NYC with SQL

**By:** Parker Fadoul  
**Tool:** Google BigQuery  
**Status:** In Progress

## 📌 Overview

This project explores when, where, and how people ride Citi Bikes in New York City. Using SQL in Google BigQuery, I analyze trip timing, route patterns, and rider demographics to uncover real-world behavioral insights from raw transportation data.

## 📊 Key Questions

1. **When are New Yorkers riding?**  
   What times of day see the most activity?

2. **Where do riders go most?**  
   What are the most common start-to-end station routes?

3. **Who’s riding these bikes?**  
   How do age, gender, and user type influence trip patterns?

4. **How long are rides?**  
   What do average and median trip durations reveal about rider behavior?

## 📂 Dataset

**Source:**  
`bigquery-public-data.new_york_citibike.citibike_trips`

**Size:**  
Millions of rows depending on the date range selected.

**Key columns:**
- `starttime`, `stoptime`
- `start_station_name`, `end_station_name`
- `tripduration`
- `birth_year`, `gender`, `usertype`

## 🧠 Methods

- SQL queries written and run in Google BigQuery  
- Date/time extraction, CASE statements, and filtering  
- Grouped aggregations and duration calculations  
- Manual data review and cleaning  
- Exported for Tableau visualization

## 🔍 Insights

- **Hourly Trends:** Ridership peaks during commute hours (8–9am, 5–6pm). Average ride time is longest mid-afternoon.
- **Age Group:** Most riders are 25–44. Younger users (18–24) take shorter trips on average.
- **Gender Patterns:** Women ride significantly less than men at night, especially after 8pm — suggesting possible safety or access concerns.
- **User Type:** Customers (non-subscribers) take longer trips than Subscribers, particularly during afternoons.
- **Outliers:** Trip durations are skewed. Median duration (~10.45 mins) is notably lower than the average (~13.91 mins).
- **Routes:** High-volume routes tend to be short and direct. Longer average-duration routes may reflect sightseeing or casual rides.
- **Unknown Gender Riders:** Most “unknown” riders are Customers rather than Subscribers. They take longer rides and are especially active in the afternoon and evening — possibly tourists or riders who declined to disclose gender.

## ⚠️ Limitations

- Gender is stored as categorical values (`male`, `female`, `unknown`) and may be system-generated or self-reported.
- Birth year data includes anomalies with implausibly old or young riders.
- Weather, day-of-week, and seasonal effects are not yet factored in.
- Long-duration outliers may reflect undocked bikes or data quality issues.

## 📈 Next Steps

- Build Tableau dashboards to visualize key findings  
- Explore seasonality and weather effects  
- Analyze trip pairings and map-based routes

## 👤 About the Analyst

I’m Parker Fadoul — a certified data analyst transitioning from a 20+ year career in the performing arts. I bring a deep background in education, mentorship, and creative leadership to data storytelling and analysis. This project showcases my ability to explore, interpret, and communicate insights from complex datasets using SQL.

🔗 [LinkedIn](https://www.linkedin.com/in/parker-fadoul-63449135b/)  
🔗 [GitHub](https://github.com/ParkerFadoul)
