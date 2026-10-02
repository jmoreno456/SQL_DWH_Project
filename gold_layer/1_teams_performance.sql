-- Question 1: How has a team's performance changed from season to season?
-- team's performance season by season
-- create home team perspective
-- create away team perspective
-- count the number of matches, wins, draws, losses, goals scored, goals conceded, goal difference and points for each team in each season
-- then use group by to aggregate the data for each team and season
-- create view to store the aggregated data
CREATE OR REPLACE VIEW gold.team_season_stats AS
SELECT
    season,
    team,
    COUNT(*) AS matches,
    COUNT(
        CASE
            WHEN result = 'W' THEN 1
        END
    ) AS wins,
    COUNT(
        CASE
            WHEN result = 'D' THEN 1
        END
    ) AS draws,
    COUNT(
        CASE
            WHEN result = 'L' THEN 1
        END
    ) AS losses,
    SUM(goals_scored) AS goals_scored,
    SUM(goals_conceded) AS goals_conceded,
    SUM(goals_scored) - SUM(goals_conceded) AS goal_difference,
    SUM(
        CASE
            WHEN result = 'W' THEN 3
            WHEN result = 'D' THEN 1
            ELSE 0
        END
    ) AS points
FROM
    (
        SELECT
            season,
            home_team AS team,
            full_time_home_goals AS goals_scored,
            full_time_away_goals AS goals_conceded,
            CASE
                WHEN full_time_result = 'H' THEN 'W'
                WHEN full_time_result = 'D' THEN 'D'
                WHEN full_time_result = 'A' THEN 'L'
            END AS result
        FROM
            silver.laliga_matches
        UNION ALL
        SELECT
            season,
            away_team AS team,
            full_time_away_goals AS goals_scored,
            full_time_home_goals AS goals_conceded,
            CASE
                WHEN full_time_result = 'A' THEN 'W'
                WHEN full_time_result = 'D' THEN 'D'
                WHEN full_time_result = 'H' THEN 'L'
            END AS result
        FROM
            silver.laliga_matches
    ) AS aggregated_data
GROUP BY
    season,
    team;

-- check the view
SELECT
    *
FROM
    gold.team_season_stats
ORDER BY
    season,
    team;

-- check team's performance for a specific team and season
SELECT
    *
FROM
    gold.team_season_stats
WHERE
    team = 'Real Madrid'
ORDER BY
    season;