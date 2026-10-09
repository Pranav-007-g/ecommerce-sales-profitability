# Power BI Dashboard Build Guide

## Page 1 — Executive Overview
**Slicers:** OrderDate, Region, Category, Segment

**Top KPI cards**
- Total Sales
- Total Profit
- Profit Margin %
- Total Orders

**Visuals**
1. Line chart: `Calendar[Year Month]` vs `[Total Sales]` and `[Total Profit]` (use separate visuals if scales obscure each other).
2. Clustered bar chart: Category by `[Total Sales]`.
3. Bar chart: Region by `[Total Profit]`.
4. Donut or stacked bar: Sales by Segment.
5. Detail table: Category, SubCategory, `[Total Sales]`, `[Total Profit]`, `[Profit Margin %]`.

## Page 2 — Profitability Drivers
**Slicers:** OrderDate, Category, Region

**Visuals**
1. Scatter chart: average Discount vs Profit, with Sales as size and Product/Category as details (aggregation choices affect interpretation).
2. Bar chart: SubCategory by `[Total Profit]`, sorted ascending to surface losses.
3. Column chart: discount bands vs profit margin. Create a discount-band column or use a grouped visual.
4. Matrix: Region × Category with `[Total Sales]`, `[Total Profit]`, `[Profit Margin %]`.

## Design checklist
- Use consistent currency and percentage formatting.
- Keep chart titles descriptive, e.g. “Profit by Region” rather than “Chart 2”.
- Use a restrained palette and align visuals to a grid.
- Add alt text where useful.
- Check slicers affect the intended visuals.
- Validate totals against the SQL KPI query.
- Add a footer note: “Synthetic dataset for portfolio demonstration.”

## Publish / portfolio checklist
- Save as `powerbi/Sales_Profitability_Dashboard.pbix`.
- Export a screenshot to `screenshots/` and update the README.
- Do not publish any confidential employer data.
