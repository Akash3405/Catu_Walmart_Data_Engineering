
# ⚙️ Walmart dbt Transformation Project

This folder contains the dbt Core project used to transform Walmart business data within Databricks.

## 🏗️ Transformation Architecture

```text
Bronze Source Tables
        |
        v
   Silver Models
        |
        v
 Configuration-Driven OBT
        |
        v
    Gold Models
```

## 📂 Project Structure

| Directory | Purpose |
|---|---|
| `models/Sources/` | Source definitions and model properties |
| `models/Silver_tech/` | Entity-level transformation models |
| `models/Silver_b/` | Configuration-driven business transformation |
| `models/Gold/Facts/` | Analytical fact models |
| `models/Gold/ephemeral/` | Intermediate helper models |
| `macros/` | Reusable dbt macro logic |
| `snapshots/` | Historical change tracking configurations |
| `analyses/` | Analytical SQL queries |
| `tests/` | Location for dbt data tests |

## 🧩 Key Implementation Details

### Configuration-Driven SQL
The `models/Silver_b/obt_b.sql` model uses Jinja templates and configuration objects to generate selected columns and LEFT JOIN clauses dynamically.

### Reusable dbt Logic
The project uses dbt model references, macros, and ephemeral model configurations to organize transformation logic into manageable components.

### Historical Tracking
Snapshot configuration files are defined for customers, employees, orders, products, and stores. Snapshot execution and SCD Type 2 behavior should be validated against the configured strategies.

### Analytics Modeling
Silver models prepare entity-level datasets, while Gold models provide analytical structures for downstream reporting.

## 🛠️ Technology Stack

- Databricks
- dbt Core
- SQL and Jinja
- YAML configuration
- Git and GitHub

## 🚀 Next Steps

- Validate dbt tests and data quality.
- Verify snapshot execution and historical change tracking.
- Document execution monitoring and failure handling.

---

**Parent repository:** [Walmart End-to-End Data Engineering](https://github.com/Akash3405/Catu_Walmart_Data_Engineering)