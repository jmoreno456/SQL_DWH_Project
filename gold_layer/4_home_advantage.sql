-- Q4: How important is home advantage?
-- This query calculates the win percentage for home and away games to determine the impact of home advantage.
-- home_wins, home_draws, home_losses, away_wins, away_draws, away_losses, home win percentage, away win percentage
-- home_points, away_points
-- if home win percentage > away win percentage, then home advantage is significant, else it is not significant.
-- create new view
CREATE OR REPLACE VIEW gold.home_advantage AS
SELECT
    *,
    home_win_percentage - away_win_percentage AS home_win_advantage
FROM
    (
        SELECT
            season,
            SUM(
                CASE
                    WHEN full_time_home_goals > full_time_away_goals THEN 1
                    ELSE 0
                END
            ) AS home_wins,
            SUM(
                CASE
                    WHEN full_time_home_goals = full_time_away_goals THEN 1
                    ELSE 0
                END
            ) AS home_draws,
            SUM(
                CASE
                    WHEN full_time_home_goals < full_time_away_goals THEN 1
                    ELSE 0
                END
            ) AS home_losses,
            SUM(
                CASE
                    WHEN full_time_away_goals > full_time_home_goals THEN 1
                    ELSE 0
                END
            ) AS away_wins,
            SUM(
                CASE
                    WHEN full_time_away_goals = full_time_home_goals THEN 1
                    ELSE 0
                END
            ) AS away_draws,
            SUM(
                CASE
                    WHEN full_time_away_goals < full_time_home_goals THEN 1
                    ELSE 0
                END
            ) AS away_losses,
            ROUND(
                SUM(
                    CASE
                        WHEN full_time_home_goals > full_time_away_goals THEN 1
                        ELSE 0
                    END
                ) * 100.0 / COUNT(*),
                2
            ) AS home_win_percentage,
            ROUND(
                SUM(
                    CASE
                        WHEN full_time_away_goals > full_time_home_goals THEN 1
                        ELSE 0
                    END
                ) * 100.0 / COUNT(*),
                2
            ) AS away_win_percentage
        FROM
            silver.laliga_matches
        GROUP BY
            season
    ) AS home_advantage_stats;

-- test the view
SELECT
    *
FROM
    gold.home_advantage;

-- perform analysis to determine if home advantage is significant
SELECT
    *
FROM
    gold.home_advantage
ORDER BY
    season;