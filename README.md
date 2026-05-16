# End-to-End Azure Data Engineering Pipeline – E-Commerce Analytics

## 📌 Project Overview
This project demonstrates a complete end-to-end Azure Data Engineering and Analytics solution using the E-Commerce public dataset. The project covers data ingestion, ETL pipeline development, incremental loading, cloud storage, data transformation, star schema modeling, and Power BI dashboard reporting using modern Azure services.

---

## 🏗️ Architecture

CSV Files
   ↓
Azure SQL Database
   ↓
Azure Data Factory (ADF)
   ↓
Azure Data Lake Gen2 (Bronze Layer)
   ↓
Azure Synapse Analytics (Silver & Gold Layer)
   ↓
Power BI Dashboards

---

## 🛠️ Tech Stack

- Azure SQL Database
- Azure Data Factory (ADF)
- Azure Data Lake Gen2 (ADLS)
- Azure Synapse Analytics
- Power BI
- SQL
- Parquet Files

---

## 📂 Project Structure

```text
E-commerce-data-platform/
│
├── README.md
├── architecture/
├── sql/
├── adf-pipelines/
├── synapse-scripts/
├── powerbi/
├── docs/
└── dataset-info/
```

---

## 📁 Dataset Used

E-Commerce Public Dataset by Olist

Main tables used:
- orders
- customers
- order_items
- products

---

## ⚙️ Key Features Implemented

#### ✅ Dynamic ADF Pipeline
- Parameterized pipelines
- Dynamic source and sink datasets
- Reusable ETL framework

- <img width="1291" height="597" alt="ADF_Pipeline" src="https://github.com/user-attachments/assets/287641dd-77fc-406c-8a4a-4f668cf67b70" />


### ✅ Metadata-Driven Architecture
- Lookup activity
- ForEach activity
- Metadata control table
- Dynamic processing for multiple tables

### ✅ Incremental Load
Implemented using:
- Watermark table
- Dynamic SQL query
- Lookup activity
- Stored procedure update

### ✅ Medallion Architecture
- Bronze Layer → Raw parquet files
- Silver Layer → Cleaned & transformed data
- Gold Layer → Business-ready star schema

---

## 🧠 Data Modeling

### Fact Table
- fact_orders

### Dimension Tables
- dim_customers
- dim_products
- dim_date

- <img width="1203" height="529" alt="star_schema" src="https://github.com/user-attachments/assets/66e5f976-24e8-4570-8999-32a1c01feaf0" />


---

## 📊 Power BI Dashboards

### Executive Dashboard
- Total Sales
- Total Orders
- Revenue Trends
- KPI Cards

- <img width="1249" height="694" alt="Executive_dashboard" src="https://github.com/user-attachments/assets/eb97f81a-994d-4554-92c6-045755d7cdd0" />


### Customer Analysis
- Orders by State
- Top Cities
- Customer Distribution

- <img width="1224" height="678" alt="customer_analysis" src="https://github.com/user-attachments/assets/f8415a09-cdc7-4efa-ad85-9965c6b625ad" />


### Product Analysis
- Top Products
- Category Sales
- Freight Analysis

- <img width="1213" height="684" alt="product_analysis" src="https://github.com/user-attachments/assets/da40e1c3-42f3-4813-b96a-a16bdc4685fc" />


---

## 📈 DAX Measures

```DAX
Total Sales = SUM(gold_fact_orders[price])

Total Orders = DISTINCTCOUNT(gold_fact_orders[order_id])

Avg Order Value =
DIVIDE([Total Sales],[Total Orders])

Total Freight =
SUM(gold_fact_orders[freight_value])
```

---

## 🗂️ Data Engineering Concepts Covered

- ETL Pipeline Design
- Parameterization
- Metadata-Driven Framework
- Incremental Loading
- Watermarking
- Data Lake Architecture
- OPENROWSET
- CETAS
- Star Schema Modeling

---

## 🔄 End-to-End Workflow

CSV Dataset
    ↓
Azure SQL Database
    ↓
ADF Dynamic Pipeline
    ↓
ADLS Bronze Layer
    ↓
Synapse Silver Transformations
    ↓
Gold Star Schema
    ↓
Power BI Analytics
```
---


## ▶️ How to Execute the Project

### Step 1 — Download Dataset
Download the Brazilian E-Commerce dataset CSV files:
- orders
- customers
- order_items
- products

---

### Step 2 — Create Azure Resources
Create the following Azure services:
- Azure SQL Database
- Azure Data Factory
- Azure Data Lake Gen2
- Azure Synapse Analytics

---

### Step 3 — Load Data into Azure SQL Database
Import CSV files into Azure SQL tables:
- orders
- customers
- order_items
- products

Execute SQL scripts from:

```text
/sql/
```

---

### Step 4 — Configure Azure Data Factory
1. Create Linked Services:
   - Azure SQL Database
   - Azure Data Lake Gen2

2. Import ADF pipeline JSON files from:

```text
/Azure_data_factory/
```

3. Publish pipelines.

---

### Step 5 — Execute Bronze Layer Pipeline
Run the metadata-driven ADF pipeline to:
- Extract data from Azure SQL Database
- Load parquet files into ADLS Bronze Layer

Output location:

```text
bronze/
```

---

### Step 6 — Execute Incremental Load Pipeline
Run incremental pipeline for:
- orders table

This pipeline:
- Reads watermark value
- Loads only new records
- Updates watermark table

---

### Step 7 — Execute Synapse SQL Scripts
Run SQL scripts from:

```text
/synapse-scripts/
```

Execution order:
1. Silver Layer Transformations
2. CETAS Scripts
3. Gold Layer Fact & Dimension Scripts

This creates:
- Silver Layer
- Gold Layer
- Star Schema

---

### Step 8 — Open Power BI Dashboard
Open:

```text
/powerbi/ecommerce_dashboard.pbix
```

Refresh dataset connections if required.

---

### Step 9 — Explore Dashboards
Available dashboard pages:
- Executive Dashboard
- Customer Analysis
- Product Analysis

Features included:
- Drill-through pages
- Sync slicers
- Hover tooltips
- Interactive navigation

---

### Step 10 — Verify End-to-End Workflow

```text
CSV Files
   ↓
Azure SQL Database
   ↓
ADF Pipelines
   ↓
ADLS Bronze Layer
   ↓
Synapse Silver & Gold Layer
   ↓
Power BI Dashboards
```
---


## 💡 Learning Outcomes

- Built cloud-based ETL pipelines
- Implemented incremental data loading
- Designed Medallion Architecture
- Developed star schema data model
- Created interactive Power BI dashboards
- Integrated multiple Azure services end-to-end


---

## ⭐ Project Outcome

This project demonstrates a complete production-style Azure Data Engineering and Business Intelligence solution with scalable ETL pipelines, cloud data architecture, and interactive analytics dashboards.
