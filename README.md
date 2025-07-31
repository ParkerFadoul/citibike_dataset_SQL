# 🚲 Citi Bike Trends in NYC with SQL

**By:** Parker Fadoul

---

## 📌 Project Overview

This project explores ridership trends in New York City’s Citi Bike program using public data from Google BigQuery. Through SQL-based analysis, I investigated patterns in trip timing, rider demographics, popular routes, and behavioral differences across user types. My goal was to turn raw ride data into insights that reflect how, when, and by whom the system is being used — all while applying real-world analytics techniques.

---

## 📁 Dataset

- **Source:** `bigquery-public-data.new_york_citibike.citibike_trips`
- **Focus:** All trips from **July 2015** (chosen for data completeness)
- **Fields used:** `starttime`, `endtime`, `tripduration`, `start_station_name`, `end_station_name`, `usertype`, `birth_year`, `gender`

---

## 🧠 Methods

- SQL queries written and run in **Google BigQuery**
- Data cleaning, filtering (e.g., removing fully null rows)
- Aggregations, CASE logic, and date functions
- Rider age calculated from birth year and grouped into bins
- Summary statistics interpreted for use in dashboards and storytelling

---

## 🔍 Key Insights from July 2015

- The dataset contained ~5.8 million **completely null rows**, which were excluded from all analysis.
- The **most popular routes** connected major transit hubs and park areas.
- **Hourly trends** were consistent with commuting and recreational patterns; no midnight spike was found after cleaning.
- **Subscribers took significantly more trips** than customers, and their average ride durations were shorter — likely due to commuting.
- **Riders aged 25–34** were the most active group by far, with over 340,000 trips. The youngest group (18–24) took the fewest rides.
- **Trip duration remained fairly consistent** across age groups, suggesting ride time is driven more by purpose than age.
- **Average trip duration peaked around 4pm (~16 minutes)**, with the shortest rides in the early morning — likely due to short commutes vs. longer leisure trips later in the day.
- **Trip volume peaked during typical commuting hours**, but ride length and ride frequency followed different curves — a contrast that highlights varied rider intentions throughout the day.

---

## ⚠️ Data Limitations

- `gender` is stored as numeric codes (0 = unknown, 1 = male, 2 = female) and lacks nuance
- `birth_year` contains anomalies (e.g., implausibly old values)
- Dataset ends in **May 2018**, limiting long-term trend analysis
- Does not currently incorporate **weather, holidays, or seasonality**

---

## 🛠️ Next Steps

- Add Tableau dashboard to visualize rider patterns and route usage  
- Publish cleaned SQL queries in a separate `queries.sql` file  
- Explore seasonal or environmental factors in ridership patterns

---

## 👤 About the Analyst

I'm Parker Fadoul — a certified data analyst with a background in education, performance, and creative leadership. After over two decades of mentoring students and managing programs, I now apply that same problem-solving mindset to data. This project is part of my transition into the data analytics field and showcases my ability to explore, interpret, and present real-world datasets using SQL.


🔗 [LinkedIn](https://www.linkedin.com/in/parker-fadoul-63449135b/)  
🔗 [GitHub](https://github.com/ParkerFadoul)
