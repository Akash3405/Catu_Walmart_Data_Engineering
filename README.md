
<div align="center">

# 🛒 Walmart End-to-End Data Engineering

### From PostgreSQL Source Data to Analytics-Ready Gold Models

**Building a scalable, modular data pipeline using Databricks, PySpark, SQL & dbt Core**

<br/>

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)
![Databricks](https://img.shields.io/badge/Databricks-FF3621?style=for-the-badge&logo=databricks&logoColor=white)
![Apache Spark](https://img.shields.io/badge/PySpark-E25A1C?style=for-the-badge&logo=apachespark&logoColor=white)
![dbt](https://img.shields.io/badge/dbt_Core-FF694B?style=for-the-badge&logo=dbt&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)

<br/>

[📂 View Repository](https://github.com/Akash3405/Catu_Walmart_Data_Engineering)
&nbsp; • &nbsp;
[🧑‍💻 Author](https://github.com/Akash3405)

</div>

---

## 🎯 Project Overview

This project demonstrates an **end-to-end Data Engineering workflow** that ingests Walmart business data from PostgreSQL into Databricks and transforms it into structured, analytics-ready datasets.

The project focuses on modular transformations, configuration-driven SQL generation, reusable dbt logic, historical data tracking, and analytical data modeling.

### 💡 Key Highlights

- 🔄 **Data Ingestion:** PostgreSQL source tables ingested into Databricks Bronze.
- 🥉 **Bronze Layer:** Source data landing layer.
- 🥈 **Silver Layer:** Entity-level SQL transformation models.
- 🥇 **Gold Layer:** Analytical fact model for downstream reporting.
- ⚙️ **Configuration-Driven SQL:** Jinja-based dynamic column selection and table joins.
- 🧩 **Reusable dbt Logic:** Macros and ephemeral helper models.
- 📸 **Historical Tracking:** dbt snapshot configurations for business entities.
- 🚀 **Orchestration:** Databricks Workflows implementation in progress.

---

## 🏗️ Data Architecture

```mermaid
flowchart TD
    A["🐘 PostgreSQL / Neon"] --> B["📥 Data Ingestion"]
    B --> C["🥉 Bronze Layer<br/>Databricks"]
    C --> D["🥈 Silver Layer<br/>dbt SQL Models"]
    D --> E["🥇 Gold Layer<br/>Fact Models"]
    E --> F["📊 Analytics & Reporting"]

    G["⚙️ dbt Jinja & Macros"] -.-> D
    H["📸 dbt Snapshots"] -.-> D

    style A fill:#4169E1,color:#ffffff,stroke:#294A9B
    style C fill:#CD7F32,color:#ffffff,stroke:#995C24
    style D fill:#A7B5C8,color:#111827,stroke:#64748B
    style E fill:#D4AF37,color:#111827,stroke:#9A7B17
    style F fill:#198754,color:#ffffff,stroke:#12663F
```

### 🔍 Medallion Architecture

| Layer | Purpose | Implementation |
|---|---|---|
| 🥉 Bronze | Land ingested source tables | Databricks |
| 🥈 Silver | Transform and organize entity-level data | dbt SQL models |
| 🥇 Gold | Prepare analytical datasets | Fact model |

---

## 🛠️ Technology Stack

| Technology | Role in the Project |
|---|---|
| 🐍 Python | Data ingestion scripts and utilities |
| 🐘 PostgreSQL (Neon) | Source database |
| 🔥 Databricks | Data platform and processing |
| ⚡ PySpark / Spark SQL | Distributed data processing technologies |
| 🧱 dbt Core | SQL transformation and model dependencies |
| 🌀 Jinja | Dynamic SQL generation |
| 🧩 dbt Macros | Reusable SQL logic |
| 📸 dbt Snapshots | Historical change tracking configuration |
| 🗂️ YAML | Source and project configuration |
| 🌿 Git & GitHub | Version control and code repository |
| 📦 uv | Python environment and dependency management |

---

## 🚀 Key Data Engineering Features

### 1. ⚙️ Configuration-Driven SQL Generation

Implemented in `models/Silver_b/obt_b.sql` using Jinja templating.

- Dynamic SELECT column generation from configuration objects.
- Configurable model references and table aliases.
- LEFT JOIN generation using configured join conditions.
- dbt `ref()` dependencies between transformation models.
- A reusable approach designed to reduce repetitive SQL and simplify future schema extensions.

**Business value:** Adding columns or extending the join structure can require changes primarily to the configuration rather than rewriting the entire SQL statement.

### 2. 🧱 Modular dbt Transformation Framework

- SQL models organized by source, Silver, and Gold layers.
- YAML-based source definitions.
- Reusable schema naming macro.
- Ephemeral helper models for intermediate transformation logic.
- Model dependencies managed using dbt references.

### 3. 📸 Historical Data Tracking

Snapshot configuration files are defined for:

- Customers
- Employees
- Orders
- Products
- Stores

These configurations provide a foundation for historical change tracking. Snapshot strategies and SCD Type 2 behavior should be validated against the configured keys and change-detection logic.

### 4. 📊 Analytical Data Modeling

- Entity-level Silver transformation models.
- Gold-layer order fact model.
- Structured transformation dependencies.
- Modular SQL intended to improve maintainability and downstream analytical use.

---

## 🔄 Data Pipeline Workflow

```text
PostgreSQL Source
       │
       ▼
Databricks Bronze
       │
       ▼
dbt Silver Models
       │
       ├── Configuration-driven SQL
       ├── Reusable macros
       └── Ephemeral helper models
       │
       ▼
Gold Fact Model
       │
       ▼
Analytics & Reporting
```

---

## 📁 Project Structure

```text
Akash_DE_2026/
│
├── Catu_Walmart_Project/
│   ├── analyses/
│   ├── macros/
│   │   └── generate_schema_name.sql
│   ├── models/
│   │   ├── Sources/
│   │   ├── Silver_tech/
│   │   ├── Silver_b/
│   │   │   └── obt_b.sql
│   │   └── Gold/
│   │       ├── Facts/
│   │       └── ephemeral/
│   ├── snapshots/
│   ├── tests/
│   └── dbt_project.yml
│
├── src/
├── pyproject.toml
├── uv.lock
└── README.md
```

---

## 📌 Implementation Status

| Component | Status |
|---|---|
| PostgreSQL source data setup | ✅ Completed |
| Databricks Bronze ingestion | ✅ Completed |
| Silver transformation models | ✅ Created |
| Gold fact model | ✅ Created |
| Configuration-driven SQL generation | ✅ Implemented |
| dbt macros and ephemeral model configurations | ✅ Added |
| Snapshot configuration files | ✅ Added |
| Git and GitHub version control | ✅ Completed |
| Databricks Workflows orchestration | ✅ Completed |
| End-to-end scheduled execution | ✅ Completed |
| Automated data quality validation | ✅ Completed |

---

## 🔮 Planned Enhancements

- 🚀 Orchestrate ingestion and dbt transformations through Databricks Workflows.
- 🧪 Execute dbt tests and validate data quality.
- 📸 Validate snapshot behavior and SCD Type 2 requirements.
- ⚡ Evaluate incremental processing where appropriate.
- 📈 Add execution monitoring and failure handling.
- 📚 Document pipeline dependencies, lineage, and operational procedures.

---

## 💼 Skills Demonstrated

`SQL` · `Python` · `PostgreSQL` · `Databricks` · `PySpark` · `dbt Core` · `Jinja` · `Data Modeling` · `Git` · `GitHub`

---

<div align="center">

### ⭐ Explore the Project

**Thanks for visiting!**

[![GitHub](https://img.shields.io/badge/Explore%20Source%20Code-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Akash3405/Catu_Walmart_Data_Engineering)

*Built as a hands-on Data Engineering portfolio project.*

</div>