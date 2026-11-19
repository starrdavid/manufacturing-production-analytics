# Additive Manufacturing Production & Scrap Rate Analysis (PostgreSQL)

## Business Objective
Track machine reliability, unit profitability, and material waste across an additive manufacturing floor to identify equipment bottlenecks and protect margins.

## Database Architecture
* **`products`**: Stores SKU details, unit sale prices, and raw material costs.
* **`production_runs`**: Logs individual machine jobs, dates, and pass/fail production outcomes.

## Key SQL Techniques Used
* **Relational Joins (`JOIN`)** to connect production logs with product pricing and cost data.
* **Conditional Aggregation (`SUM(CASE WHEN ...)`)** to calculate machine-level scrap rates and wasted material costs in a single query.
* **Grouping & Ranking (`GROUP BY`, `ORDER BY`)** to surface top-performing SKUs and underperforming equipment.

## Key Findings
* **Equipment Bottleneck:** `Machine_02` accounts for **100% of production failures** (66.7% scrap rate; $4.60 in wasted material), while `Machine_01` and `Machine_03` operated at a 0.0% scrap rate.
* **Profit Drivers:** `Industrial Mounting Bracket` generated the highest net profit ($75.00), followed by `Custom Prototype Housing` ($64.00).
* **Recommendation:** Pull `Machine_02` for preventative maintenance and calibration before scheduling additional high-volume runs.
