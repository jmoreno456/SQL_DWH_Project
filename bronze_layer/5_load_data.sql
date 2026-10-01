-- switch PostgreSQL to Day/Month/Year mode
SET
    datestyle TO 'European';

-- Load data into 22/23 table
COPY bronze.laliga_2022_2023
FROM
    '/Users/jessemoreno/SQL_DWH_Project/Datasets/2022-2023.csv'
WITH
    (FORMAT CSV, HEADER TRUE);

-- load data into 23/24 table
COPY bronze.laliga_2023_2024
FROM
    '/Users/jessemoreno/SQL_DWH_Project/Datasets/2023-2024.csv'
WITH
    (FORMAT CSV, HEADER TRUE);

-- load data into 24/25 table
COPY bronze.laliga_2024_2025
FROM
    '/Users/jessemoreno/SQL_DWH_Project/Datasets/2024-2025.csv'
WITH
    (FORMAT CSV, HEADER TRUE);

-- load data into 25/26 table
COPY bronze.laliga_2025_2026
FROM
    '/Users/jessemoreno/SQL_DWH_Project/Datasets/2025-2026.csv'
WITH
    (FORMAT CSV, HEADER TRUE);