-- change time column type from timestamptz to time
ALTER TABLE bronze.laliga_2022_2023
ALTER COLUMN time TYPE time;

-- change time column datatype for 23/24 season
ALTER TABLE bronze.laliga_2023_2024
ALTER COLUMN time TYPE time;

-- change time column datatype for 24/25 season
ALTER TABLE bronze.laliga_2024_2025
ALTER COLUMN time TYPE time;

-- change time column datatype for 25/26 season
ALTER TABLE bronze.laliga_2025_2026
ALTER COLUMN time TYPE time;