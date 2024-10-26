USE financial_data;

-- Create tables
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    phone_number VARCHAR(20)
);

CREATE TABLE accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(50),
    balance DECIMAL(15,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    date DATETIME,
    amount DECIMAL(15,2),
    type VARCHAR(50),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

-- Insert sample data
INSERT INTO customers (name, address, phone_number) VALUES
('John Doe', '123 Main St', '555-1234'),
('Jane Smith', '456 Elm St', '555-5678'),
('Robert Johnson', '789 Oak Ave', '555-9012'),
('Mary Williams', '321 Pine Rd', '555-3456'),
('James Brown', '654 Maple Dr', '555-7890'),
('Patricia Davis', '987 Cedar Ln', '555-2345'),
('Michael Miller', '147 Birch St', '555-6789'),
('Linda Wilson', '258 Spruce Ave', '555-0123'),
('William Moore', '369 Ash Rd', '555-4567'),
('Elizabeth Taylor', '741 Walnut Dr', '555-8901'),
('David Anderson', '852 Cherry Ln', '555-2345'),
('Jennifer Thomas', '963 Hickory St', '555-6789'),
('Richard Martin', '159 Cypress Ave', '555-0123'),
('Barbara White', '357 Willow Rd', '555-4567'),
('Joseph Lee', '486 Beech Dr', '555-8901'),
('Margaret Hall', '753 Poplar Ln', '555-2345'),
('Charles Clark', '951 Elm St', '555-6789'),
('Susan Lewis', '147 Oak Ave', '555-0123'),
('Thomas Young', '258 Pine Rd', '555-4567'),
('Sandra King', '369 Maple Dr', '555-8901'),
('Daniel Wright', '741 Cedar Ln', '555-2345'),
('Nancy Lopez', '852 Birch St', '555-6789'),
('Paul Hill', '963 Spruce Ave', '555-0123'),
('Betty Scott', '159 Ash Rd', '555-4567'),
('Kevin Green', '357 Walnut Dr', '555-8901'),
('Lisa Adams', '486 Cherry Ln', '555-2345'),
('Mark Baker', '753 Hickory St', '555-6789'),
('Dorothy Nelson', '951 Cypress Ave', '555-0123'),
('George Carter', '147 Willow Rd', '555-4567'),
('Helen Mitchell', '258 Beech Dr', '555-8901'),
('Frank Phillips', '369 Poplar Ln', '555-2345'),
('Carol Turner', '741 Oak Ave', '555-6789'),
('Donald Evans', '852 Pine Rd', '555-0123'),
('Ruth Collins', '963 Maple Dr', '555-4567'),
('Steven Edwards', '159 Cedar Ln', '555-8901');

-- Create checking and savings accounts for each customer
INSERT INTO accounts (customer_id, account_type, balance) VALUES
(1, 'Checking', 1000.00), (1, 'Savings', 5000.00),
(2, 'Checking', 2000.00), (2, 'Savings', 7500.00),
(3, 'Checking', 1500.00), (3, 'Savings', 6000.00),
(4, 'Checking', 3000.00), (4, 'Savings', 9000.00),
(5, 'Checking', 2500.00), (5, 'Savings', 8000.00),
(6, 'Checking', 1800.00), (6, 'Savings', 4500.00),
(7, 'Checking', 2200.00), (7, 'Savings', 7000.00),
(8, 'Checking', 3500.00), (8, 'Savings', 12000.00),
(9, 'Checking', 1700.00), (9, 'Savings', 5500.00),
(10, 'Checking', 2800.00), (10, 'Savings', 9500.00),
(11, 'Checking', 1900.00), (11, 'Savings', 6500.00),
(12, 'Checking', 2100.00), (12, 'Savings', 8500.00),
(13, 'Checking', 2600.00), (13, 'Savings', 7800.00),
(14, 'Checking', 3200.00), (14, 'Savings', 11000.00),
(15, 'Checking', 1600.00), (15, 'Savings', 4800.00),
(16, 'Checking', 2900.00), (16, 'Savings', 9200.00),
(17, 'Checking', 2300.00), (17, 'Savings', 6800.00),
(18, 'Checking', 1400.00), (18, 'Savings', 5200.00),
(19, 'Checking', 2700.00), (19, 'Savings', 8700.00),
(20, 'Checking', 3100.00), (20, 'Savings', 10500.00),
(21, 'Checking', 2400.00), (21, 'Savings', 7200.00),
(22, 'Checking', 1300.00), (22, 'Savings', 4200.00),
(23, 'Checking', 2500.00), (23, 'Savings', 8300.00),
(24, 'Checking', 3300.00), (24, 'Savings', 11500.00),
(25, 'Checking', 1800.00), (25, 'Savings', 5800.00),
(26, 'Checking', 2200.00), (26, 'Savings', 7600.00),
(27, 'Checking', 2800.00), (27, 'Savings', 9800.00),
(28, 'Checking', 1500.00), (28, 'Savings', 4600.00),
(29, 'Checking', 3400.00), (29, 'Savings', 12500.00),
(30, 'Checking', 2600.00), (30, 'Savings', 8900.00),
(31, 'Checking', 1900.00), (31, 'Savings', 6200.00),
(32, 'Checking', 2700.00), (32, 'Savings', 9100.00),
(33, 'Checking', 3000.00), (33, 'Savings', 10800.00),
(34, 'Checking', 2100.00), (34, 'Savings', 7100.00),
(35, 'Checking', 2400.00), (35, 'Savings', 8400.00);

-- Replace the transactions INSERT with this corrected version
INSERT INTO transactions (account_id, date, amount, type) VALUES
-- Using account_ids from 1-70 only
(1, '2023-05-01 10:00:00', -100.00, 'Withdrawal'),
(2, '2023-05-02 11:15:00', 200.00, 'Deposit'),
(3, '2023-05-03 09:30:00', 500.00, 'Deposit'),
(4, '2023-05-04 14:45:00', -150.00, 'Withdrawal'),
(5, '2023-05-05 13:20:00', 300.00, 'Deposit'),
(6, '2023-05-06 15:10:00', -200.00, 'Withdrawal'),
(7, '2023-05-07 16:30:00', 400.00, 'Deposit'),
(8, '2023-05-08 10:45:00', -250.00, 'Withdrawal'),
(9, '2023-05-09 11:50:00', 600.00, 'Deposit'),
(10, '2023-05-10 09:15:00', -175.00, 'Withdrawal'),
(11, '2023-05-11 14:20:00', 450.00, 'Deposit'),
(12, '2023-05-12 13:40:00', -225.00, 'Withdrawal'),
(13, '2023-05-13 15:55:00', 550.00, 'Deposit'),
(14, '2023-05-14 16:10:00', -275.00, 'Withdrawal'),
(15, '2023-05-15 10:25:00', 650.00, 'Deposit'),
(16, '2023-05-16 11:35:00', -325.00, 'Withdrawal'),
(17, '2023-05-17 09:50:00', 750.00, 'Deposit'),
(18, '2023-05-18 14:05:00', -375.00, 'Withdrawal'),
(19, '2023-05-19 13:15:00', 850.00, 'Deposit'),
(20, '2023-05-20 15:30:00', -425.00, 'Withdrawal'),
(21, '2023-05-21 16:45:00', 950.00, 'Deposit'),
(22, '2023-05-22 10:20:00', -475.00, 'Withdrawal'),
(23, '2023-05-23 11:40:00', 1050.00, 'Deposit'),
(24, '2023-05-24 09:35:00', -525.00, 'Withdrawal'),
(25, '2023-05-25 14:50:00', 1150.00, 'Deposit'),
(26, '2023-05-26 13:25:00', -575.00, 'Withdrawal'),
(27, '2023-05-27 15:40:00', 1250.00, 'Deposit'),
(28, '2023-05-28 16:15:00', -625.00, 'Withdrawal'),
(29, '2023-05-29 10:30:00', 1350.00, 'Deposit'),
(30, '2023-05-30 11:45:00', -675.00, 'Withdrawal'),
(31, '2023-05-31 09:20:00', 1450.00, 'Deposit'),
(32, '2023-05-31 14:35:00', -725.00, 'Withdrawal'),
(33, '2023-05-31 13:50:00', 1550.00, 'Deposit'),
(34, '2023-05-31 15:15:00', -775.00, 'Withdrawal'),
(35, '2023-05-31 16:20:00', 1650.00, 'Deposit'),
(36, '2023-05-31 10:35:00', -825.00, 'Withdrawal'),
(37, '2023-05-31 11:55:00', 1750.00, 'Deposit'),
(38, '2023-05-31 09:40:00', -875.00, 'Withdrawal'),
(39, '2023-05-31 14:25:00', 1850.00, 'Deposit'),
(40, '2023-05-31 13:30:00', -925.00, 'Withdrawal'),
(41, '2023-05-31 15:45:00', 1950.00, 'Deposit'),
(42, '2023-05-31 16:25:00', -975.00, 'Withdrawal'),
(43, '2023-05-31 10:40:00', 2050.00, 'Deposit'),
(44, '2023-05-31 11:20:00', -1025.00, 'Withdrawal'),
(45, '2023-05-31 09:25:00', 2150.00, 'Deposit'),
(46, '2023-05-31 14:40:00', -1075.00, 'Withdrawal'),
(47, '2023-05-31 13:35:00', 2250.00, 'Deposit'),
(48, '2023-05-31 15:50:00', -1125.00, 'Withdrawal'),
(49, '2023-05-31 16:30:00', 2350.00, 'Deposit'),
(50, '2023-05-31 10:45:00', -1175.00, 'Withdrawal');
