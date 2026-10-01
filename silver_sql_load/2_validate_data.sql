/*
- Check for missing values
*/
SELECT
    *
FROM
    silver.laliga_matches
WHERE
    season IS NULL
    OR date IS NULL
    OR home_team IS NULL
    OR away_team IS NULL;

/*
- Check for duplicate matches
*/
SELECT
    season,
    date,
    home_team,
    away_team,
    COUNT(*)
FROM
    silver.laliga_matches
GROUP BY
    season,
    date,
    home_team,
    away_team
HAVING
    COUNT(*) > 1;

/*
- Check for invalid values
*/
SELECT
    *
FROM
    silver.laliga_matches
WHERE
    full_time_home_goals < 0
    OR full_time_away_goals < 0
    OR home_team_shots < 0
    OR away_team_shots < 0
    OR home_team_shots_on_target < 0
    OR away_team_shots_on_target < 0;