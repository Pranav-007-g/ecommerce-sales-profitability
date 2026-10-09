# E-commerce Sales & Profitability Analysis

An entry-level Business Intelligence portfolio project built around **Power BI, DAX, SQL, and optional Python**. It explores sales, profitability, product categories, customer segments, regions, and discount impact.

> **Dataset note:** `data/sales_data.csv` is synthetic data generated for this portfolio project. It is not real company/customer data and should not be represented as real business performance.

## Business questions
1. How do sales and profit change over time?
2. Which categories, sub-categories, and regions contribute the most sales and profit?
3. Which customer segments contribute the most revenue?
4. Are high discounts associated with lower profitability?
5. Which products or regions have negative profit and may need investigation?

## Repository structure
```text
ecommerce-sales-profitability/
├── data/sales_data.csv
├── sql/analysis_queries.sql
├── powerbi/dax_measures.md
├── powerbi/dashboard_build_guide.md
├── notebooks/analysis_starter.py
├── screenshots/dashboard_preview.png
├── requirements.txt
└── README.md
```

## Tools
- Power BI Desktop: data model, DAX measures, report pages and slicers
- SQL (SQLite-compatible queries): aggregation and business questions
- Python (optional): quick profiling and exploratory analysis

## Dataset dictionary
| Column | Description |
|---|---|
| `OrderID` | Unique order-line identifier for this synthetic dataset |
| `OrderDate` | Date of the order |
| `Region` | Sales region |
| `Segment` | Customer segment |
| `Category` | Product category |
| `SubCategory` | Product sub-category |
| `Product` | Product label |
| `Quantity` | Units sold |
| `UnitPrice` | Unit price before discount |
| `Discount` | Discount fraction, e.g. `0.10` = 10% |
| `Sales` | Revenue after discount |
| `Profit` | Simulated profit amount |

## Build the Power BI report
1. Download and install Power BI Desktop.
2. Select **Get data → Text/CSV**, then import `data/sales_data.csv`.
3. Set `OrderDate` to the **Date** data type and `Discount` to **Decimal number**.
4. Create the DAX measures in [`powerbi/dax_measures.md`](powerbi/dax_measures.md).
5. Build the two report pages described in [`powerbi/dashboard_build_guide.md`](powerbi/dashboard_build_guide.md).
6. Save the Power BI file as `powerbi/Sales_Profitability_Dashboard.pbix`.
7. Export a screenshot and replace `screenshots/dashboard_preview.png` with your actual report screenshot.

A `.pbix` file is **not included** because it must be authored and saved in Power BI Desktop. The preview image is a generated data overview, not a screenshot of a finished Power BI report.

## SQL analysis
Open `sql/analysis_queries.sql`. The queries are SQLite-compatible. For a quick run, import the CSV into a table named `sales_data` using a SQL client that supports CSV import. Some SQL clients may require you to adapt date functions.

## Python starter
Run:
```bash
pip install -r requirements.txt
python notebooks/analysis_starter.py
```

## Suggested GitHub description
`Power BI and SQL sales analytics project exploring revenue, profit, category performance, regional trends, and discount impact using synthetic data.`

## Important portfolio advice
- Do not claim business impact or percentages that you have not measured.
- Keep the synthetic-data disclaimer visible.
- Once you build the report in Power BI, add a real screenshot and the `.pbix` file if its size is reasonable.
