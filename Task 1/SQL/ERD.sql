-- SQL Script to Add Foreign Key Constraints (Relationships)

-- This script assumes the tables 'customers', 'products', 'orders', and 'order_line_items' already exist.
-- It adds the foreign key constraints to define the relationships between them based on the ERD.

-- Add Foreign Key from 'orders' to 'customers'
ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (Customer_ID) REFERENCES customers(Customer_ID);

-- Add Foreign Key from 'order_line_items' to 'orders'
ALTER TABLE order_line_items
ADD CONSTRAINT fk_order_line_items_orders
FOREIGN KEY (Order_ID) REFERENCES orders(Order_ID);

-- Add Foreign Key from 'order_line_items' to 'products'
ALTER TABLE order_line_items
ADD CONSTRAINT fk_order_line_items_products
FOREIGN KEY (Product_ID) REFERENCES products(Product_ID);

-- Note: Ensure the referenced columns (Customer_ID in customers, Order_ID in orders, Product_ID in products)
-- are primary keys or have unique constraints in their respective tables before running this script.
-- The constraint names (e.g., fk_orders_customers) are examples; you can adjust them as needed.
