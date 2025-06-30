-- Create database (only if you run this manually, skip if using POSTGRES_DB env var)
CREATE DATABASE users_db;

-- Connect to users_db (run this command if executing manually)
\c users_db

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE
);
