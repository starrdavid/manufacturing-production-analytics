CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    sale_price DECIMAL(10, 2),
    filament_cost DECIMAL(10, 2)
);

CREATE TABLE production_runs (
    run_id INT PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    printer_name VARCHAR(30),
    run_date DATE,
    status VARCHAR(20)
);

INSERT INTO products VALUES
(1, 'Industrial Mounting Bracket', 40.00, 2.50),
(2, 'Control Knob Pack (10x)', 22.00, 0.80),
(3, 'Modular Storage Enclosure', 30.00, 2.10),
(4, 'Custom Prototype Housing', 35.00, 3.00);

INSERT INTO production_runs VALUES
(101, 1, 'Machine_01', '2026-11-10', 'Success'),
(102, 1, 'Machine_01', '2026-11-11', 'Success'),
(103, 1, 'Machine_02', '2026-11-12', 'Failed'),
(104, 2, 'Machine_02', '2026-11-12', 'Success'),
(105, 3, 'Machine_01', '2026-11-13', 'Success'),
(106, 3, 'Machine_02', '2026-11-14', 'Failed'),
(107, 4, 'Machine_03', '2026-11-15', 'Success'),
(108, 4, 'Machine_03', '2026-11-16', 'Success');
