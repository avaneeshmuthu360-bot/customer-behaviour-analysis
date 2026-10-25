# Customer Shopping Behaviour Analysis

An end-to-end data analytics project that turns 3,900 customer purchase records into business insights using **Python, SQL and Power BI**.

![Customer Behaviour Dashboard](<img width="1523" height="845" alt="dashboard" src="https://github.com/user-attachments/assets/42df1076-b10c-439e-b794-ccb6572afd90" />
)

---

## Overview

The goal of this project is to understand **who buys, what they buy, and how they spend**, so a retail business can improve marketing, subscriptions and discount strategy.

**Key finding:** only 7.3% of customers subscribe, and **not one female customer is subscribed**. This makes subscriptions the biggest growth opportunity for the business.

---

## Dataset

| Detail | Value |
| --- | --- |
| File | `customer_shopping_behavior.csv` |
| Rows | 3,900 (one row per purchase) |
| Columns | 18 |
| Missing values | 37 in `Review Rating` |
| Duplicates | None |

**Main columns:** Customer ID, Age, Gender, Item Purchased, Category, Purchase Amount (USD), Location, Size, Color, Season, Review Rating, Subscription Status, Shipping Type, Discount Applied, Promo Code Used, Previous Purchases, Payment Method, Frequency of Purchases.

---

## Tools

| Tool | Used for |
| --- | --- |
| Python (pandas) | Loading, EDA, cleaning, feature engineering |
| SQLite (SQLAlchemy) | Storing the cleaned data |
| SQL | Answering 10 business questions |
| Power BI | Interactive dashboard |
| Claude (AI assistant) | Drafting the project report and presentation |

> The SQL queries use standard syntax and can be run on PostgreSQL or MySQL with little or no change.

---

## Steps

### 1. Data loading and EDA
- Loaded the CSV with pandas and checked its shape, data types and summary statistics.
- Checked for missing values and duplicates.

### 2. Data cleaning and feature engineering
- Filled 37 missing review ratings with the **median rating of the same category**.
- Standardised column names (lowercase, underscores).
- Created `age_category`: four equal-size age groups (Young_adult, adult, Middle_aged, senior).
- Created `purchase_frequency_days`: converted text frequencies (e.g. "Weekly") into days.
- Dropped `promo_code_used` because it was identical to `discount_applied`.

### 3. SQL analysis
Loaded the cleaned data into the `customer_behaviour` table and answered 10 questions, including:
- Revenue by gender
- Top 5 products by average rating
- Subscriber vs non-subscriber spending
- Customer segments: New, Returning, Loyal
- Top 3 products in each category (window function)
- Revenue by age group

**SQL techniques used:** aggregations, subqueries, `CASE`, CTEs, `ROW_NUMBER() OVER (PARTITION BY ...)`.

### 4. Power BI dashboard
Built a one-page dashboard with KPI cards, category and age-group charts, and slicers for subscription status, gender, category and shipping type.

### 5. Report and presentation
Summarised the findings and recommendations in a project report and a slide deck for stakeholders.

---

## Dashboard

| KPI | Value |
| --- | --- |
| Number of customers | 3.9K |
| Average purchase amount | $59.76 |
| Average review rating | 3.75 |

The dashboard also shows revenue and units sold by category, purchases and revenue by age group, and the share of customers who subscribe.

---

## Results

### Key insights
- **No female subscribers:** all subscribers are male, although women are 32% of customers.
- **Low subscription rate:** 92.7% of customers are not subscribed.
- **Clothing leads** on both revenue and units sold; Outerwear is the weakest category.
- **Age groups are balanced:** young adults lead, but the gap between groups is small.
- **Discounts and promo codes always go together**, so they cannot be analysed separately.

### Business recommendations
1. **Win female subscribers** with offers and campaigns designed for them.
2. **Boost subscriptions** by promoting exclusive subscriber benefits.
3. **Launch a loyalty programme** to move repeat buyers into the Loyal segment.
4. **Review discount policy** to balance sales growth with profit margin.
5. **Promote top-rated and best-selling products** in campaigns.
6. **Target high-revenue age groups** and Express-shipping customers.

---

## Project Structure

```
customer-behaviour-analysis/
├── data/          customer_shopping_behavior.csv
├── notebooks/     customer_shopping_behaviour_analysis.ipynb
├── sql/           business_queries.sql
├── dashboard/     customer_behaviour_dashboard.pbix, dashboard.png
├── reports/       project_report.pdf, Customer_Behaviour_Analysis.pptx
└── README.md
```

---

## How to Run

1. **Clone the repository**
   ```bash
   git clone https://github.com/<your-username>/customer-behaviour-analysis.git
   cd customer-behaviour-analysis
   ```
2. **Install the libraries**
   ```bash
   pip install pandas sqlalchemy jupyter
   ```
3. **Run the notebook**
   ```bash
   jupyter notebook notebooks/customer_shopping_behaviour_analysis.ipynb
   ```
   This cleans the data and creates the SQLite database `expense.db`.
4. **Run the SQL queries**
   Open `expense.db` in [DB Browser for SQLite](https://sqlitebrowser.org/) and run `sql/business_queries.sql`.
5. **View the dashboard**
   Open `dashboard/customer_behaviour_dashboard.pbix` in Power BI Desktop.

---

## Author

**Muthu Avaneesh**
Aspiring Data Analyst | [LinkedIn](https://www.linkedin.com/in/www.linkedin.com/in/muthu-avaneesh-3b6284322) | [Email](mailto:avaneeshmuthu360@gmail.com)
