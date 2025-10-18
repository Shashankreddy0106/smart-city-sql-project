# 🏙️ Smart City Mobility Analytics — MySQL Project

### 📊 Overview
This project simulates a **Smart City mobility system** using **MySQL**, built to analyze 10,000+ ride records across major Indian cities.  
It focuses on understanding **traffic patterns, ride demand, route efficiency, and driver performance** using advanced SQL queries.

---

### 🧱 Project Structure
| File | Description |
|------|--------------|
| `smart_city_schema.sql` | Database schema — creates all necessary tables for Riders, Drivers, Rides, and City data |
| `smart_city_seed_data.sql` | Inserts ~10,000 synthetic but realistic records |
| `analysis_queries.sql` | Core analytical queries — daily rides, city performance, and earnings |
| `advanced_queries.sql` | Advanced analytics — window functions, CTEs, route optimization, and trend detection |

---

### 🧩 Database Schema
**Main Tables:**
- **Cities** — Stores city names and traffic indexes  
- **Drivers** — Driver profiles, ratings, and total trips  
- **Riders** — Customer info, ride frequency, and registration date  
- **Rides** — Trip details (origin city, destination, fare, time, rating, etc.)

---

### 🧮 Sample Analytical Insights
| Objective | Query Technique Used |
|------------|----------------------|
| Top 5 busiest cities by total rides | `GROUP BY`, `ORDER BY`, `LIMIT` |
| Identify peak travel hours | `HOUR()` extraction, aggregation |
| Detect most profitable routes | `JOIN` between Rides & Cities |
| Find top-rated drivers | `AVG()` + `GROUP BY` |
| Compare daily ride trends | `CTE` + `WINDOW FUNCTION (LAG)` |

---

### ⚙️ How to Run
1. Open **MySQL Workbench**
2. Run `smart_city_schema.sql` to create tables  
3. Run `smart_city_seed_data.sql` to insert sample data  
4. Run `analysis_queries.sql` and `advanced_queries.sql` to explore insights

---

### 💡 Tools Used
- **Database:** MySQL 8.0  
- **Environment:** macOS (M2)  
- **Data Volume:** 10,000+ synthetic records  
- **Techniques:** Joins, CTEs, Window Functions, Subqueries, Aggregations

---

### 📈 Key Learnings
- Designed a normalized database schema for scalable analytics  
- Applied advanced SQL for mobility trend analysis  
- Improved query efficiency using indexing and joins  
- Created insights on route optimization and driver earnings

---

### 🧠 Future Improvements
- Add Power BI / Tableau dashboard using exported CSVs  
- Integrate Python (Pandas + SQLAlchemy) for automation  
- Add live data simulation using Faker or public transport APIs

---

### 👨‍💻 Author
**Shashank Reddy**  
Data Analyst Intern | SQL | Excel | Power BI | Python  
📧 *shashankr041@gmail.com*  
🔗 *[GitHub Profile](https://github.com/yourusername)*

---

⭐ *If you like this project, give it a star on GitHub!*
