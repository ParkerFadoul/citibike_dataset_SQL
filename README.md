# 🚲 Citi Bike Trends in NYC with SQL

**By:** Parker Fadoul  
**Tool:** Google BigQuery  
**Status:** In Progress

## 📌 Overview

This project explores how, when, and where people ride Citi Bikes in New York City. Using SQL in Google BigQuery, I’ve written queries to uncover patterns in trip timing, popular stations, rider demographics, and more. The goal is to extract meaningful, real-world insights from raw transportation data.

## 📊 Key Questions

1. **When are New Yorkers riding?**  
   Explore hourly trends in ridership to identify when demand peaks.

2. **Where do riders go most?**  
   Analyze the most frequent routes based on start and end station combinations.

3. **Who’s riding these bikes?**  
   Segment ridership by gender, age group, and user type to understand behavioral patterns.

4. **How long are rides?**  
   Compare average vs. median trip durations and examine trip length distributions.

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

- **Hourly Trends:** Ridership peaks around 8–9am and 5–6pm. Average ride duration peaks mid-afternoon.
- **Age Group:** Most riders fall between 25–44 years old, and younger riders (18–24) take the shortest rides.
- **Gender:** Women ride less at night than men, especially after 8pm. A strong candidate for further safety or access research.
- **User Type:** Customers (casual riders) have longer average trip times than subscribers.
- **Outliers:** Trip duration data is heavily skewed. Median trip duration (~10.45 mins) is much lower than the average (~13.91 mins).
- **Routes:** Common routes tend to be short and direct, but some longer average-duration routes may suggest scenic or casual trips.
- **Unknown Gender Riders:** The majority of riders listed as “unknown” gender are Customers, not Subscribers. They tend to take longer trips and are especially active in the afternoon and evening, possibly reflecting tourist behavior or non-disclosure.

## ⚠️ Limitations

- Gender data is categorical (`male`, `female`, `unknown`) and self-reported or system-limited.
- Birth years have anomalies, with some riders appearing implausibly old or young.
- Weather, day-of-week, and seasonal factors not yet included.
- Outliers with extremely long durations may reflect undocked bikes or data errors.

## 📈 Next Steps

- Build Tableau dashboards to visualize key findings  
- Investigate seasonality and weather overlays  
- Continue exploring trip pairings and map-based visualizations

## 👤 About the Analyst

I'm Parker Fadoul — a certified data analyst with a background in education, performance, and creative leadership. After over two decades of mentoring students and managing programs, I now apply that same problem-solving mindset to data. This project is part of my transition into the data analytics field and showcases my ability to explore, interpret, and present real-world datasets using SQL.


🔗 [LinkedIn](https://www.linkedin.com/in/parker-fadoul-63449135b/)  
🔗 [GitHub](https://github.com/ParkerFadoul)
