
/*
======================================================================
                  SQL NUMERIC FUNCTIONS PRACTICE
======================================================================

Project:
    Understanding SQL Mathematical Functions

Objective:
    Practice numeric functions by solving real-world business
    scenarios using SQL queries.

Functions Covered:

    • ROUND()
    • CEIL()
    • FLOOR()
    • MOD / %
    • Arithmetic Operations

Concepts Practiced:

    • Revenue calculation
    • Financial reporting
    • Warehouse calculations
    • Business analytics logic


======================================================================
                    STEP 1 : TABLE CREATION
======================================================================
*/

use joins;
CREATE TABLE store_sales (

    sale_id INT AUTO_INCREMENT PRIMARY KEY,

    product_sku VARCHAR(50),

    product_name VARCHAR(100),

    category VARCHAR(50),

    price DECIMAL(10,2),

    quantity INT,

    discount DECIMAL(5,2),

    sale_date DATETIME
);



/*
======================================================================
                    STEP 2 : INSERT SAMPLE DATA
======================================================================
*/


INSERT INTO store_sales 
(product_sku, product_name, category, price, quantity, discount, sale_date)

VALUES

('  ELEC-101  ', 'PRO LAPTOP ', 'Electronics', 1199.99, 2, 50.00, '2026-01-15 14:30:00'),

('elec-102', 'wireless mouse', 'Electronics', 25.55, 10, NULL, '2026-01-16 09:15:00'),

(' HOME-201 ', ' ergonomic chair ', 'Furniture', 249.45, 1, 25.50, '2026-02-01 11:00:00'),

('FIT-301', 'Smart Watch', 'Fitness', 199.00, 3, NULL, '2026-02-14 18:45:00'),

('ELEC-103', '4K Monitor', 'Electronics', 349.79, 1, 15.25, '2026-03-05 10:00:00');



/*
======================================================================
                         FUNCTION 1 : ROUND()
======================================================================

Purpose:

Used to round decimal values to a specific number of digits.

Business Use:

Financial reports require clean decimal formatting.
*/


SELECT

product_name,

price,

quantity,

ROUND(price * quantity,1) AS gross_revenue

FROM store_sales;



/*
======================================================================
                         FUNCTION 2 : FLOOR()
======================================================================

Purpose:

Rounds a number down to the nearest whole number.

Business Use:

Calculating complete units, boxes, vouchers, cycles etc.
*/


-- Ticket 1:
-- Shipping boxes calculation

-- Every box contains 3 items


SELECT

product_name,

quantity,

FLOOR(quantity / 3) AS full_boxes,

(quantity % 3) AS loose_items

FROM store_sales;



/*
======================================================================
                         FUNCTION 3 : CEIL()
======================================================================

Purpose:

Rounds a number upward.

Business Use:

Finding required resources where partial values
require a complete unit.
*/


-- Ticket 2:
-- Psychological pricing experiment


SELECT

product_name,

price,

(CEIL(price)-0.01) AS promo_price

FROM store_sales;



-- Ticket 6:
-- Pallet allocation


SELECT

product_name,

quantity,

CEIL(quantity / 4.0) AS pallets

FROM store_sales;



/*
======================================================================
                         FUNCTION 4 : MODULO (%)
======================================================================

Purpose:

Returns the remainder after division.

Business Use:

Finding leftovers, splitting amounts,
and allocation problems.
*/


-- Ticket 7:
-- Revenue splitting among partners


SELECT

product_name,

ROUND(price * 100) AS total_pennies,

ROUND(price * 100) % 3 AS administrative_fee

FROM store_sales;



/*
======================================================================
                    BUSINESS ANALYTICS PRACTICE
======================================================================
*/


-- Ticket 5:
-- Sales commission voucher calculation

-- Every complete $100 revenue gives one voucher


SELECT

product_name,

ROUND(price * quantity,2) AS gross_revenue,

FLOOR(price * quantity / 100) AS vouchers

FROM store_sales;



/*
======================================================================
                    PRODUCTION CYCLE ANALYSIS
======================================================================

Adding production time data.
*/


ALTER TABLE store_sales

ADD COLUMN production_minutes INT;



UPDATE store_sales

SET production_minutes = 35

WHERE product_sku LIKE '%elec-102%';



UPDATE store_sales

SET production_minutes = 60

WHERE product_sku LIKE '%ELEC-103%';



UPDATE store_sales

SET production_minutes = 110

WHERE product_sku LIKE '%ELEC-101%';



UPDATE store_sales

SET production_minutes = 45

WHERE product_sku LIKE '%HOME-201%';



UPDATE store_sales

SET production_minutes = 95

WHERE product_sku LIKE '%FIT-301%';



-- Calculate completed 45 minute production cycles


SELECT

product_name,

production_minutes,

FLOOR(production_minutes / 45) AS completed_cycles

FROM store_sales;



/*
======================================================================
                         KEY LEARNINGS
======================================================================


ROUND()

    Used for financial formatting and decimal control.


CEIL()

    Used when partial values require a complete unit.


FLOOR()

    Used when only complete units should be counted.


MOD (%)

    Used for finding remaining values after division.


Practical Applications:

• Revenue calculations
• Warehouse planning
• Shipping calculations
• Pricing experiments
• Production analytics
• Business reporting


======================================================================
                         END OF PRACTICE
======================================================================
*/

