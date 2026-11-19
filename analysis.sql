-- Query 1: Pull all failed print jobs
SELECT *
FROM production_runs
WHERE status = 'Failed';

-- Query 2: Count failures by machine
SELECT 
    printer_name, 
    COUNT(*) AS failed_prints
FROM production_runs
WHERE status = 'Failed'
GROUP BY printer_name;

-- Query 3: Total profit by product (successful runs only)
SELECT 
    p.product_name,
    COUNT(r.run_id) AS units_made,
    SUM(p.sale_price - p.filament_cost) AS total_profit
FROM production_runs r
JOIN products p ON r.product_id = p.product_id
WHERE r.status = 'Success'
GROUP BY p.product_name
ORDER BY total_profit DESC;

-- Query 4: Scrap rate % and wasted filament cost by printer
SELECT
    r.printer_name,
    COUNT(*) AS total_runs,
    SUM(CASE WHEN r.status = 'Failed' THEN 1 ELSE 0 END) AS failed_runs,
    ROUND(
        SUM(CASE WHEN r.status = 'Failed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        1
    ) AS scrap_rate_pct,
    SUM(CASE WHEN r.status = 'Failed' THEN p.filament_cost ELSE 0 END) AS wasted_filament_cost
FROM production_runs r
JOIN products p ON r.product_id = p.product_id
GROUP BY r.printer_name
ORDER BY scrap_rate_pct DESC;
