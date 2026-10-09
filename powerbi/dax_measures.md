# Suggested DAX Measures

Assume the imported table is named `sales_data`. If Power BI changes the table name, update the references.

```DAX
Total Sales = SUM(sales_data[Sales])

Total Profit = SUM(sales_data[Profit])

Total Orders = DISTINCTCOUNT(sales_data[OrderID])

Units Sold = SUM(sales_data[Quantity])

Profit Margin % = DIVIDE([Total Profit], [Total Sales], 0)

Average Order Value = DIVIDE([Total Sales], [Total Orders], 0)

Average Discount % = AVERAGE(sales_data[Discount])

Sales Previous Month =
CALCULATE(
    [Total Sales],
    DATEADD(sales_data[OrderDate], -1, MONTH)
)

Sales MoM Change % =
DIVIDE(
    [Total Sales] - [Sales Previous Month],
    [Sales Previous Month],
    0
)
```

## Formatting
- `Total Sales`, `Total Profit`, `Average Order Value`: currency
- `Profit Margin %`, `Average Discount %`, `Sales MoM Change %`: percentage
- `Total Orders`, `Units Sold`: whole number

## Date table (recommended)
For a more robust time-intelligence model, create a calendar table, mark it as the date table, and relate `Calendar[Date]` to `sales_data[OrderDate]`.

```DAX
Calendar = CALENDAR(MIN(sales_data[OrderDate]), MAX(sales_data[OrderDate]))
Year = YEAR(Calendar[Date])
Month = FORMAT(Calendar[Date], "MMM")
Month Number = MONTH(Calendar[Date])
Year Month = FORMAT(Calendar[Date], "YYYY-MM")
```

Sort `Calendar[Month]` by `Calendar[Month Number]`, and sort `Calendar[Year Month]` by a suitable numeric year-month sort column if needed. Use Calendar fields for time-axis visuals and slicers.
