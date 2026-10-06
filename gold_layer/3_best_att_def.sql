-- Question 3: Which team have the best attacking and defensive records?
-- season, team, goals_scored, goals_conceded, goal_difference
-- use view from Question 1 (gold.team_season_stats)
-- perform analysis
-- find the best attacking team (most goals scored)
SELECT
    season,
    team,
    goals_scored
FROM
    gold.team_season_stats
WHERE
    goals_scored = (
        SELECT
            MAX(goals_scored)
        FROM
            gold.team_season_stats AS subquery
        WHERE
            subquery.season = gold.team_season_stats.season
    )
ORDER BY
    season;

-- find the best defensive team (least goals conceded)
SELECT
    season,
    team,
    goals_conceded
FROM
    gold.team_season_stats
WHERE
    goals_conceded = (
        SELECT
            MIN(goals_conceded)
        FROM
            gold.team_season_stats AS subquery
        WHERE
            subquery.season = gold.team_season_stats.season
    )
ORDER BY
    season;