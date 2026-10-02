-- Question 2: Which teams have the best home record across all seasons?
-- one row per team per season
-- only consider home matches
-- this includes home wins, home draws, and home losses
-- home win percentage
-- home points
-- create view
CREATE OR REPLACE VIEW gold.team_home_stats AS
SELECT
    season,
    home_team AS team,
    COUNT(*) AS home_matches,
    COUNT(
        CASE
            WHEN full_time_result = 'H' THEN 1
        END
    ) AS home_wins,
    COUNT(
        CASE
            WHEN full_time_result = 'D' THEN 1
        END
    ) AS home_draws,
    COUNT(
        CASE
            WHEN full_time_result = 'A' THEN 1
        END
    ) AS home_losses,
    ROUND(
        (
            CASE
                WHEN COUNT(*) > 0 THEN SUM(
                    CASE
                        WHEN full_time_result = 'H' THEN 1
                        ELSE 0
                    END
                ) * 100.0 / COUNT(*)
                ELSE 0
            END
        ),
        2
    ) AS home_win_percentage,
    SUM(
        CASE
            WHEN full_time_result = 'H' THEN 3
            WHEN full_time_result = 'D' THEN 1
            ELSE 0
        END
    ) AS home_points
FROM
    silver.laliga_matches
WHERE
    home_team IS NOT NULL
GROUP BY
    season,
    team;

-- test the view
SELECT
    *
FROM
    gold.team_home_stats;

-- perform analysis
SELECT
    *
FROM
    gold.team_home_stats
ORDER BY
    season,
    home_win_percentage DESC,
    home_points DESC;