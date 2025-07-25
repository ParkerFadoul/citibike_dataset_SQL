# 🚲 Citi Bike Trends in NYC with SQL

**By:** Parker Fadoul  
**Tool:** Google BigQuery  
**Status:** In Progress

## 📌 Overview

This project dives into New York City’s Citi Bike data to explore how, when, and where people ride. Using SQL in Google BigQuery, I’ve written queries to uncover patterns in trip timing, popular stations, rider demographics, and more. It’s part analysis, part curiosity — and fully hands-on.

## 📊 Key Questions

1. **When are New Yorkers riding?**  
   Hourly ridership trends revealed a spike at **hour 0 (midnight)** — I'm digging into why that's happening and whether it's real, reporting lag, or something else entirely.

2. **Where do riders go most?**  
   Which stations are the busiest? I’m starting with top start and end points and planning to expand into **trip pairings** and route patterns.

3. **Who’s riding these bikes?**  
   I’m segmenting by **age and gender**, grouping riders into bins (e.g., 18–24, 25–34, etc.) and comparing **ride durations** across these groups. Patterns are already emerging.

4. **How long are rides?** *(under review)*  
   Still exploring this one. I'm testing out trip duration distributions to see what the "typical ride" looks like — or whether that’s even a useful concept.

## 📂 Dataset

**Source:**  
`bigquery-public-data.new_york_citibike.citibike_trips`

**Size:**  
Tens of millions of trips (depending on date range)

**Key columns:**
- `starttime`, `stoptime`
- `start_station_name`, `end_station_name`
- `tripduration`
- `birth_year`, `gender`

## 🧠 Methods

- SQL queries written and run in BigQuery
- Aggregations, filtering, date functions, and CASE logic
- Rider age calculated from birth year, then grouped into custom bins
- Results manually reviewed and cleaned before summarizing insights

## 🔍 Early Insights

- Hour 0 ridership is unusually high — potentially due to trip recording behavior or data issues (under investigation)
- Busiest stations cluster around transit corridors and parks
- Most riders are aged 25–40, with more men riding than women — but **ride duration doesn’t vary much across gender** (still testing this)

## ⚠️ Limitations

- `gender` is stored as numeric codes (0 = unknown, 1 = male, 2 = female) — limited nuance  
- `birth_year` has some anomalies — yes, apparently there are some very fit 90-year-old cyclists
- Current queries don’t yet include seasonality or weather effects

## 🛠️ Next Steps

- Expand origin-destination trip pair analysis  
- Finish investigating midnight ridership anomalies  
- Visualize findings in Tableau as Part C of this project  
- Publish cleaned SQL queries and refined summary statistics
