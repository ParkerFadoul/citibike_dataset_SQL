# 🚲 Citi Bike Trends in NYC with SQL

**By:** Parker Fadoul  
**Tool:** Google BigQuery  
**Status:** In Progress

## 📌 Overview

This project explores New York City’s Citi Bike data to uncover how, when, and where people ride. Using SQL in Google BigQuery, I analyzed rider behavior across demographics, trip timing, and route patterns. The goal: dig deeper into the human rhythms behind all those blue bikes.

## 📊 Key Questions

1. **When are New Yorkers riding?**  
   Hourly ridership and trip duration patterns show strong commuting trends — but also some midday and weekend surges worth exploring.

2. **Where do riders go most?**  
   Most common routes and busiest stations help identify commuter corridors, tourist paths, and local favorites.

3. **Who’s riding these bikes?**  
   Segmenting riders by age, gender, and user type reveals clear behavioral differences — especially between casual and subscriber usage.

4. **How long are rides?**  
   By looking at ride duration distributions and time-of-day effects, I explored how long riders typically keep bikes and when the longest trips occur.

## 📂 Dataset

**Source:**  
`bigquery-public-data.new_york_citibike.citibike_trips`  
**Date Range Used:** July 2015  
**Size:** Tens of millions of trips

**Key columns include:**
- `starttime`, `stoptime`
- `start_station_name`, `end_station_name`
- `tripduration`
- `usertype`, `gender`, `birth_year`

## 🧠 Methods

- SQL queries written and executed in BigQuery  
- Use of `CASE` statements for custom age bins 
- Filters applied to cap `tripduration` at 2 hours to remove outliers  
- Grouping, aggregation, and ordering to summarize trends  
- Exported to CSV for potential Tableau visualization  

## 🔍 Key Insights

- **Riders aged 25–34** had the highest ridership, followed by 35–44 and 45–54. Youngest (18–24) and oldest (55+) rode least.  
- **Customers ride longer than Subscribers**, often several minutes more per trip.  
- **Trip duration peaks around 4pm**, possibly indicating leisure or end-of-day travel.  
- **Riders with gender labeled 'unknown' were mostly Customers**, and they had **the longest average trip durations**. These are likely casual riders or tourists who do not provide demographic details.  
- The dataset includes **~5.8 million fully null rows**, which were excluded from all analysis.  

## ⚠️ Limitations

- `birth_year` has some outliers and unrealistic values (filtered to 1920–2000)  
- `gender` is limited to `'male'`, `'female'`, `'unknown'`, which lacks nuance  
- Only a single month (July 2015) was used to reduce data volume for testing — further months could reveal seasonal patterns  

## 📈 Next Steps

- Visualize trip duration and ride volume by hour in Tableau  
- Explore route popularity by Customer vs. Subscriber  
- Examine temporal changes by comparing multiple years  

## 👤 About the Analyst

I'm Parker Fadoul — a certified data analyst with a background in education, performance, and creative leadership. After over two decades of mentoring students and managing programs, I now apply that same problem-solving mindset to data. This project is part of my transition into the data analytics field and showcases my ability to explore, interpret, and present real-world datasets using SQL.


🔗 [LinkedIn](https://www.linkedin.com/in/parker-fadoul-63449135b/)  
🔗 [GitHub](https://github.com/ParkerFadoul)
