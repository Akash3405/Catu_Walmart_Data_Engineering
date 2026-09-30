
# ⚙️ Walmart dbt Transformation Project

This folder contains the dbt Core transformation project used to transform Walmart business data in Databricks. It implements a layered data modeling approach using Silver and Gold models, configuration-driven SQL generation, snapshots, and data quality tests.

## 🏗️ Transformation Architecture

```text
PostgreSQL Source
       |
       v
Bronze Layer (Databricks)
       |
       v
Silver Technical Models
       |
       v
Silver Business Layer
(Configuration-Driven OBT)
       |
       v
Gold Layer
(Fact Models and Snapshots)
       |
       v
Analytics and Reporting
```

## 🎯 Project Objectives

- Transform ingested Walmart data into analytics-ready datasets.
- Implement modular SQL transformations using dbt Core.
- Use Jinja templates for configuration-driven SQL generation.
- Maintain historical data using dbt snapshots.
- Apply data quality tests to validate key columns.
- Organize transformation logic into reusable and maintainable models.
- Automate ingestion and dbt execution using Databricks scheduling.

## 📂 Project Structure

| Directory | Purpose |
|---|---|
| `models/Sources/` | Source definitions and model properties |
| `models/Silver_tech/` | Entity-level technical transformation models |
| `models/Silver_b/` | Configuration-driven business transformation models |
| `models/Gold/Facts/` | Analytical fact models |
| `models/Gold/ephemeral/` | Intermediate helper models |
| `macros/` | Reusable dbt macro logic |
| `snapshots/` | Historical change tracking configurations |
| `analyses/` | Analytical SQL queries |
| `tests/` | Data quality test definitions |

## 🧩 Key Implementation Details

### 1. Source Definitions

The project defines six Bronze source tables:

- Customers
- Employees
- Order Items
- Orders
- Products
- Stores

These tables provide the input data for downstream dbt transformations.

### 2. Silver Technical Models

The `models/Silver_tech/` directory contains entity-level transformation models for customers, employees, order items, orders, products, and stores.

These models prepare the source data for business-level transformations.

### 3. Configuration-Driven SQL Generation

The `models/Silver_b/obt_b.sql` model uses Jinja templates and configuration objects to dynamically generate selected columns, table aliases, and `LEFT JOIN` clauses.

This approach helps organize complex transformation logic and reduces repetitive SQL code.

### 4. Gold Analytical Modeling

The Gold layer contains analytical models, including:

- `gold.fact_orders`

The fact model provides a structured dataset for downstream analytical queries and reporting.

### 5. Historical Change Tracking

The project includes five dbt snapshot configurations:

- `dim_customers`
- `dim_employees`
- `dim_orders`
- `dim_products`
- `dim_stores`

All five snapshots executed successfully during the latest verified dbt build. Further validation of historical changes and SCD Type 2 behavior remains part of the project improvement plan.

### 6. Data Quality Testing

The project includes dbt data quality tests for product data:

- `not_null_products_tech_product_id`
- `unique_products_tech_product_id`

Both tests passed during the latest verified dbt build.

## 🔄 Orchestration and Scheduling

The project uses Databricks scheduling for the ingestion and transformation workflows.

| Workflow | Schedule | Status |
|---|---|---|
| PostgreSQL to Bronze ingestion pipeline | Daily at 6:00 AM IST | Configured |
| dbt transformation job | Daily at 7:00 AM IST | Configured |

**Execution flow:**

1. Source data is ingested from PostgreSQL into the Bronze layer.
2. The dbt job executes `dbt deps` and `dbt build`.
3. Silver models transform the ingested data.
4. The business transformation model generates the OBT.
5. Gold analytical models and snapshots are built.
6. Configured data quality tests are executed.

**Scheduling note:** The ingestion and dbt jobs use separate schedules. A dependency-aware trigger and automated failure handling are planned improvements; the current schedule does not guarantee that ingestion has completed successfully before dbt starts.

## ✅ Latest Verified Execution

The latest verified manual dbt build completed successfully in Databricks.

| Execution Metric | Result |
|---|---|
| dbt models discovered | 13 |
| Snapshots discovered | 5 |
| Sources discovered | 6 |
| Incremental models executed | 6 |
| Snapshot executions | 5 successful |
| Table models executed | 2 |
| Data quality tests | 2 passed |
| Total completed resources | 15 |
| Errors | 0 |
| Warnings | 0 |
| Approximate execution time | 47 seconds |

**Execution status:** `PASS=15, WARN=0, ERROR=0, SKIP=0, NO-OP=0, REUSED=0`

The successful execution confirms that the configured models, snapshots, and data quality tests ran without errors in that build.

## 🛠️ Technology Stack

- **Data Source:** PostgreSQL
- **Data Platform:** Databricks
- **Transformation Framework:** dbt Core
- **Languages:** SQL and Jinja
- **Configuration:** YAML
- **Data Modeling:** Bronze, Silver, and Gold layers
- **Orchestration:** Databricks Jobs and Pipelines
- **Version Control:** Git and GitHub

## 🚀 Future Improvements

- Implement dependency-aware orchestration between ingestion and dbt jobs.
- Add automated failure notifications and retry handling.
- Expand data quality coverage across all important models.
- Validate historical changes and SCD Type 2 behavior using test data.
- Improve incremental processing and execution monitoring.
- Add documentation for business rules and analytical metrics.

## 🔗 Parent Repository

[Walmart End-to-End Data Engineering Project](https://github.com/Akash3405/Catu_Walmart_Data_Engineering)