-- Enable pgvector extension
-- CREATE EXTENSION IF NOT EXISTS vector;

-- Drop existing tables
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS products CASCADE;

-- Create departments table
CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create employees table
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department_id INT REFERENCES departments(id),
    email VARCHAR(255) UNIQUE NOT NULL,
    salary DECIMAL(10,2) NOT NULL CHECK (salary >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    name_embedding vector(384)
);

-- Create products table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    name_embedding vector(384)
);

-- Create orders table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    employee_id INT REFERENCES employees(id),
    order_total DECIMAL(10,2) NOT NULL CHECK (order_total >= 0),
    order_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    customer_name_embedding vector(384)
);

-- Create indexes for better performance
CREATE INDEX idx_employees_department ON employees(department_id);
CREATE INDEX idx_employees_salary ON employees(salary);
CREATE INDEX idx_orders_employee ON orders(employee_id);
CREATE INDEX idx_orders_date ON orders(order_date);
CREATE INDEX idx_products_price ON products(price);

-- Create vector indexes for similarity search
CREATE INDEX idx_employees_embedding ON employees USING ivfflat (name_embedding vector_cosine_ops) WITH (lists = 100);
CREATE INDEX idx_products_embedding ON products USING ivfflat (name_embedding vector_cosine_ops) WITH (lists = 100);
CREATE INDEX idx_orders_embedding ON orders USING ivfflat (customer_name_embedding vector_cosine_ops) WITH (lists = 100);