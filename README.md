# Fashion-Retail-Sales



## Overview
This repository contains two dashboards: Customer Behavior Analysis and Sales Performance Dashboard, built to analyze customer purchasing patterns, sales trends, and product performance for a retail business. The data spans from October 2022 to October 2023, covering 166 unique customers and 3400 transactions, with a total revenue of $511.94K. These dashboards were created using Excel for data cleaning, MySQL for querying, Power BI for visualizations, and DAX for creating measures and functions.  
The dashboards help stakeholders understand customer segments, identify top-performing products, track sales trends, and address underperforming items. Below is a detailed explanation of each visual, technical implementation, data validation, and enhanced insights with quantified recommendations.

---

## Technical Implementation

### Tools and Technologies
- **Excel**: Used for initial data cleaning, including removing duplicates, handling missing values, and standardizing formats.
- **MySQL**: Utilized for querying the cleaned data, aggregating transactions by customer ID, segmenting customers by CLV, and calculating monthly sales trends.
- **Power BI**: Employed for creating interactive visualizations such as bar charts, line charts, and donut charts.
- **DAX**: Used to define measures and functions, such as calculating average revenue per customer and segmenting CLV groups.

### Data Processing
1. **Data Cleaning in Excel**: 
   - Imported raw data into Excel.
   - Removed duplicate rows and filled missing customer ratings with an average value.
   - Standardized date formats and converted revenue columns to numeric values.
2. **Data Querying in MySQL**: 
   - Connected to the cleaned Excel data via a database import.
   - Executed SQL queries to aggregate data.
3. **Visualization and DAX in Power BI**: 
   - Imported MySQL file into Power BI.
   - Created some DAX measures.
   - Built visuals using Power BI’s drag-and-drop interface, customizing with DAX for dynamic segmentation.

---

## Dashboards and Visuals

### 1. Customer Behavior Analysis Dashboard

![customer_metrics](/Dashboard/Customer_Behaviour_Analysis.png)

This dashboard focuses on customer segmentation, spending patterns, and repeat purchase behavior.

#### Visual 1: Total Unique Customers
- **Description**: Displays the total number of unique customers.
- **Value**: 166
- **Insight**: The business has a small but loyal customer base, as 166 unique customers contributed to 3400 transactions, averaging 20.5 transactions per customer (3400 ÷ 166).

#### Visual 2: Repeat vs New Customers (Donut Chart)
- **Description**: A donut chart showing the proportion of repeat vs new customers.
- **Data**: All 166 customers (100%) are repeat customers.
- **Insight**: The absence of new customers highlights a reliance on repeat buyers. This loyalty is a strength but poses a risk if new customer acquisition doesn’t improve.

#### Visual 3: Top 10 Spending Customers (Table)
- **Description**: A table listing the top 10 customers by total revenue, including their purchase count and customer reference ID.
- **Data**: 
  - Customer 4075: 28 purchases, $7,763.00
  - Customer 4002: 26 purchases, $6,754.00
  - Customer 4108: 26 purchases, $7,827.00
  - Customer 4040: 25 purchases, $10,568.00
  - Customer 4010: 24 purchases, $7,088.00
  - Customer 4044: 24 purchases, $9,397.00
  - Customer 4103: 23 purchases, $6,709.00
  - Customer 4067: 21 purchases, $6,637.00
  - Customer 3984: 19 purchases, $6,943.00
  - Customer 4109: 16 purchases, $10,112.00
  - **Total Revenue from Top 10**: $79,798.00
- **Data Validation**: The top 10 customers contribute $79,798, which is 15.58% of the total revenue ($79,798 ÷ $511,940). This aligns with expectations, as the top 10 out of 166 customers (6% of customers) generating 15.5% of revenue indicates a moderate concentration of spending.
- **Insight**: High spenders like Customer 4040 are critical to revenue. Customer 4067’s low spending ($6,637.00) despite 21 purchases suggests they may be buying low-value items.

#### Visual 4: Average Customer Revenue by CLV Segment (Bar Chart)
- **Description**: A bar chart showing the average revenue per customer across three Customer Lifetime Value (CLV) segments.
- **Data**: 
  - High Value: $7K
  - Medium Value: $4K
  - Low Value: $2K
- **Insight**: High-value customers contribute 3.5x more revenue per person than low-value ones. Retaining these customers with loyalty discounts could increase their CLV by 10-15% (e.g., from $7K to $8K per customer).

---

### 2. Sales Performance Dashboard

![Project_Overview](/Dashboard/Sales_Performance_Dashboard1.png)

This dashboard provides a comprehensive view of sales metrics, product performance, and customer ratings.

#### Visual 1: Key Metrics
- **Description**: Displays four key metrics for the period (October 2022 to October 2023).
- **Data**: 
  - Total Revenue: $511.94K
  - Total Transactions: 3400
  - Unique Customers: 166
  - Average Rating: 3.00
- **Insight**: The average transaction value is $150.57 ($511,940 ÷ 3400). The average rating of 3.00 suggests moderate satisfaction, and improving this to 3.5 could increase repeat purchases by 10%, based on industry benchmarks.

#### Visual 2: Top 10 Selling Items (Horizontal Bar Chart)
- **Description**: A bar chart showing the top 10 items by total revenue.
- **Data (approximate revenue)**: 
  - Tunic: $18.3K
  - Handbag: $14.6K
  - Jeans: $14.5K
  - Loafers: $13.4K
  - Onesie: $11.3K
  - Wallet: $11.3K
  - Tank Top: $10.6K
  - Leggings: $10K
  - Jacket: $9.9K
  - Trousers: $9K
- **Insight**: Tunics and handbags dominate sales. Improving the quality of low-rated top sellers (e.g., Tunic, avg rated 2.44 and Handbags avg rated 3.2) could boost their revenue.

#### Visual 3: Monthly Sales Trend (Line Chart)
- **Description**: A line chart showing monthly sales revenue from October 2022 to October 2023.
- **Data**: Sales peak around December 2022 ($54K) and decline to $400 by October 2023.
- **Insight**: The sharp decline suggests a lack of sales initiatives in the second half of 2023. Running a mid-year promotion could have sustained sales at least $50K/month, adding $200K in revenue ([$54K - $400] × 4 months).

#### Visual 4: Sales by Day of Week (Bar Chart)
- **Description**: A bar chart showing sales revenue by day of the week.
- **Data (approximate revenue)**: 
  - Sunday: $85.3K
  - Friday: $80.6K
  - Monday: $76K
  - Tuesday: $74K
  - Thursday: $69K
  - Wednesday: $63.4K
  - Saturday: $63.3K
- **Insight**: Sundays and Fridays are peak days. A 10% sales boost on these days through promotions could add $16.5K to annual revenue ($85.3K × 10% + $80.6K × 10%).

#### Visual 5: Revenue by Payment Method (Donut Chart)
- **Description**: A donut chart showing the revenue split between payment methods.
- **Data**: 
  - Credit Card: $240.1K (47%)
  - Cash: $271.84K (53%)
- **Insight**: Shifting 10% of cash payments to credit cards (e.g., through incentives) could improve transaction tracking and potentially increase sales by 5% due to easier upselling, adding $25K to revenue ($511.94K × 5%).

#### Visual 6: Frequency, Monetary, and Recency by purchase_amount (Bubble Chart)
- **Description**: A bubble chart plotting customers based on frequency, monetary value, and recency.
- **Data**: Frequency ranges from 5 to 30, monetary value from $0 to $10K.
- **Insight**: High-frequency, high-value customers are key. A loyalty program for these customers could increase their frequency by 10%, adding $50K in revenue (based on their current contribution).

#### Visual 7: Low-Rated Products (Table)
- **Description**: A table listing products with the lowest average customer ratings.
- **Data**: 
  - Raincoat: 1.70
  - Tunic: 1.76
  - Onesie: 1.82
  - Jacket: 1.83
  - Loafers: 1.85
  - Jeans: 1.85
  - Hat: 1.85
  - Camisole: 1.86
- **Insight**: Addressing quality issues for low-rated top sellers (e.g., Tunic) could improve ratings to 2.5, potentially increasing sales by 15% ($3.75K for Tunic alone).

---

## Key Insights and Recommendations
1. **Customer Retention vs Acquisition**: With 100% repeat customers, focus on new customer acquisition. A marketing campaign could attract 50 new customers, potentially adding $75K in revenue (assuming they match the average customer revenue of $1.5K).
2. **Seasonal Sales Trends**: The sales decline in late 2023 could be mitigated with mid-year promotions, potentially adding $120K in revenue.
3. **Product Performance**: Improving quality for low-rated top sellers like Tunic could add $5K to revenue per item.
4. **Payment Methods**: Shifting 10% of cash payments to credit cards could add $25K in revenue.
5. **Sales by Day**: Promotions on Sundays and Fridays could add $19K annually.

---

## How to Use This Repository
- **Customer Behavior Analysis Dashboard**: Understand customer segments and high-value customers.
- **Sales Performance Dashboard**: Track sales, identify top/low-performing products, and analyze trends.
