# 🚲 Citi Bike Trends in NYC with SQL

**By:** Parker Fadoul  
**Tool:** Google BigQuery  
**Status:** In Progress

---

## 📌 Overview

This project dives into New York City’s Citi Bike data to explore how, when, and where people ride. Using SQL in Google BigQuery, I’ve written queries to uncover patterns in trip timing, popular stations, rider demographics, and more. It’s part analysis, part curiosity — and fully hands-on.

---

## 📊 Key Questions

1. **When are New Yorkers riding?**  
   Hourly ridership trends initially revealed a spike at **hour 0 (midnight)** — but further investigation showed that many trips had completely null values and were excluded from analysis.

2. **Where do riders go most?**  
   Which stations are the busiest? I’m starting with top start and end points and planning to expand into **trip pairings** and route patterns.

3. **Who’s riding these bikes?**  
   I’m segmenting by **age and gender**, grouping riders into bins (e.g., 18–24, 25–34, etc.) and comparing **ride durations** across these groups. Patterns are already emerging.

4. **How long are rides?** *(under review)*  
   Still exploring this one. I'm testing out trip duration distributions to see what the "typical ride" looks like — or whether that’s even a useful concept.

---

## 📂 Dataset

**Source:**  
`bigquery-public-data.new_york_citibike.citibike_trips`

**Size:**  
Tens of millions of trips (depending on date range)

**Key columns:**
- `starttime`, `stoptime`
- `start_station_name`, `end_station_name`
- `tripduration`
- `birth_year`, `gender`, `usertype`

---

## 🧠 Methods

- SQL queries written and run in BigQuery
- Aggregations, filtering, date functions, and CASE logic
- Rider age calculated from birth year, then grouped into custom bins
- Results manually reviewed and cleaned before summarizing insights

---

## 🔍 Early Insights

- The dataset contains ~5.8 million rows that are completely null. These rows have no values in any field and were excluded from all analysis.
- The most common bike routes often begin or end near transit hubs or parks.
- Most riders are aged 25–40, with more men riding than women — but **ride duration doesn’t vary much across gender** (still testing this).
- **Customers take longer trips on average than subscribers**, suggesting tourists or casual users are more exploratory, while subscribers may use bikes for commuting.

---

## ⚠️ Limitations

- `gender` is stored as numeric codes (0 = unknown, 1 = male, 2 = female) — limited nuance  
- `birth_year` has some anomalies — yes, apparently there are some very fit 90-year-old cyclists
- Current queries don’t yet include seasonality, holidays, or weather effects

---

## 🛠️ Next Steps

- Expand origin-destination trip pair analysis  
- Visualize findings in Tableau as Part C of this project  
- Publish cleaned SQL queries and refined summary statistics
