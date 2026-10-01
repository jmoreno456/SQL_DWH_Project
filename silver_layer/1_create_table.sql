/*
- truncate table
*/
TRUNCATE TABLE silver.laliga_matches
/*
-- create tables from bronze into silver layer
-- create the columns we will be using in final analysis
-- create table for each season of La Liga
*/
CREATE TABLE IF NOT EXISTS silver.laliga_matches (
    season VARCHAR(9),
    div VARCHAR(10),
    date DATE,
    time TIME,
    home_team VARCHAR(50),
    away_team VARCHAR(50),
    full_time_home_goals INT,
    full_time_away_goals INT,
    full_time_result VARCHAR(10),
    half_time_home_goals INT,
    half_time_away_goals INT,
    half_time_result VARCHAR(10),
    home_team_shots INT,
    away_team_shots INT,
    home_team_shots_on_target INT,
    away_team_shots_on_target INT,
    home_team_fouls INT,
    away_team_fouls INT,
    home_team_corners INT,
    away_team_corners INT,
    home_team_yellow_cards INT,
    away_team_yellow_cards INT,
    home_team_red_cards INT,
    away_team_red_cards INT,
    dwh_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/*
-- insert from bronze table into silver tables
-- create season column to identify the different seasons
-- clean data and transform data to match silver table structure
-- change column names for better readability
*/
INSERT INTO
    silver.laliga_matches (
        season,
        div,
        date,
        time,
        home_team,
        away_team,
        full_time_home_goals,
        full_time_away_goals,
        full_time_result,
        half_time_home_goals,
        half_time_away_goals,
        half_time_result,
        home_team_shots,
        away_team_shots,
        home_team_shots_on_target,
        away_team_shots_on_target,
        home_team_fouls,
        away_team_fouls,
        home_team_corners,
        away_team_corners,
        home_team_yellow_cards,
        away_team_yellow_cards,
        home_team_red_cards,
        away_team_red_cards
    )
SELECT
    '2022-2023' AS season,
    div,
    date,
    time,
    hometeam AS home_team,
    awayteam AS away_team,
    fthg AS full_time_home_goals,
    ftag AS full_time_away_goals,
    ftr AS full_time_result,
    hthg AS half_time_home_goals,
    htag AS half_time_away_goals,
    htr AS half_time_result,
    hs AS home_team_shots,
    away_team_shots,
    hst AS home_shots_on_target,
    ast AS away_shots_on_target,
    hf AS home_fouls,
    af AS away_fouls,
    hc AS home_corners,
    ac AS away_corners,
    hy AS home_yellow_cards,
    ay AS away_yellow_cards,
    hr AS home_red_cards,
    ar AS away_red_cards
FROM
    bronze.laliga_2022_2023
UNION ALL
SELECT
    '2023-2024' as season,
    div,
    date,
    time,
    hometeam AS home_team,
    awayteam AS away_team,
    fthg AS full_time_home_goals,
    ftag AS full_time_away_goals,
    ftr AS full_time_result,
    hthg AS half_time_home_goals,
    htag AS half_time_away_goals,
    htr AS half_time_result,
    hs AS home_team_shots,
    away_team_shots,
    hst AS home_shots_on_target,
    ast AS away_shots_on_target,
    hf AS home_fouls,
    af AS away_fouls,
    hc AS home_corners,
    ac AS away_corners,
    hy AS home_yellow_cards,
    ay AS away_yellow_cards,
    hr AS home_red_cards,
    ar AS away_red_cards
FROM
    bronze.laliga_2023_2024
UNION ALL
SELECT
    '2024-2025' AS season,
    div,
    date,
    time,
    hometeam AS home_team,
    awayteam AS away_team,
    fthg AS full_time_home_goals,
    ftag AS full_time_away_goals,
    ftr AS full_time_result,
    hthg AS half_time_home_goals,
    htag AS half_time_away_goals,
    htr AS half_time_result,
    hs AS home_team_shots,
    away_team_shots,
    hst AS home_shots_on_target,
    ast AS away_shots_on_target,
    hf AS home_fouls,
    af AS away_fouls,
    hc AS home_corners,
    ac AS away_corners,
    hy AS home_yellow_cards,
    ay AS away_yellow_cards,
    hr AS home_red_cards,
    ar AS away_red_cards
FROM
    bronze.laliga_2024_2025
UNION ALL
SELECT
    '2025-2026' AS seasons,
    div,
    date,
    time,
    hometeam AS home_team,
    awayteam AS away_team,
    fthg AS full_time_home_goals,
    ftag AS full_time_away_goals,
    ftr AS full_time_result,
    hthg AS half_time_home_goals,
    htag AS half_time_away_goals,
    htr AS half_time_result,
    hs AS home_team_shots,
    away_team_shots,
    hst AS home_shots_on_target,
    ast AS away_shots_on_target,
    hf AS home_fouls,
    af AS away_fouls,
    hc AS home_corners,
    ac AS away_corners,
    hy AS home_yellow_cards,
    ay AS away_yellow_cards,
    hr AS home_red_cards,
    ar AS away_red_cards
FROM
    bronze.laliga_2025_2026;

/*
- run query to make sure insert worked
*/
SELECT
    season,
    COUNT(*)
FROM
    silver.laliga_matches
GROUP BY
    season
ORDER BY
    season;