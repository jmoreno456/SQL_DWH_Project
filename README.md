# Data Warehouse & Analysis
In this analytical project, I built an end-to-end data pipeline. I focused on taking raw soccer data and building a data warehouse with three layers bronze -> silver -> gold. I looked into team performances, best home records, best attack and defence, home advantage, and shot generation analysis. Then, I built a dashboard to further visualize my analysis.

## Questions
1. How has a team's performance changed from season to season?
2. Which teams ahve the best home records across all seasons?
3. Which team has the best attacking the defensive records?
4. How important is home advantage?
5. How does shot generation relate to match results?

## Tools Used
- SQL: Querying the database to build queries and views from data
- PostgreSQL: database managment system
- Tableau: build charts and a dashboard for my analysis
- VSCode: preferred IDE to execute SQL queries
- Git & GitHub: used for version control and sharing SQL scripts / analysis

## Data Architecture
- Bronze Layer: created schemas used for the project. created tables for each season used (4). loaded raw data. 
- Silver Layer: created one table called laliga.matches and dropped unused columns, changed column names, added each of the season using UNION ALL. Then, I validated data.
- Gold Layer: created a view for each business question and performed analysis, ready for visualization and then used tableau to visualize.

## Analysis

### 1. Team performance
I wanted to see how a team's performance changed from season to season. I used the 22/23, 23/24, 24/25, 25/26 la liga seasons for the team Real Madrid to perform this analysis. 

- In the 22/23 season, Real Madrid had a record of 24/6/8 which translates to 24 wins 6 draws and 8 losses resulting in a total of 78 points accumulated. The team also scored 75 goals and conceded 36 goals. 

- For the 23/24 season, There was an improvement from the team. Their wins grew by 5, the draws grew by 2 and the biggest change was the losses, resulting from 8 to only 1 loss in this season. The total points accumulated went from 78 to 95. Goals scored increased while goals conceded decreased.

- The following two seasons (24/25, 25/26) had similar numbers where the team won 26-27 games, 5-6 draws, and 6 losses. resulting in 84-86 points. Goals scored was also in the range of 75-80 goals. goals conceded was in the range of 35-38 goals.

### 2. Best home records
In this section, I wanted to analyze which teams have the best home records across the four seasons. There are a total of 38 matches in the spanish football division. therefore, 19 of those matches are played at home.

- After analyzing the data I noticed that Barcelona and Real Madrid were the best home teams across the seasons. 

- In 22/23, Barcelona had 15 wins, 3 draws, and 1 loss at home. a total of 48 points accumulated at home of the possible 114 points. This resulted in a home win percentage of 78.95%

- In 23/24, Real Madrid had the best home record for this season, with 16 wins, 3 draws, 0 losses. With 51 home points and a win percentage of 84.21%

- 24/25, Real Madrid once again was the best home team. 16 wins, 1 draw, 2 losses. 49 home points and a 84.21% home win percentage.

- 25/26, Barcelona had the best home record of the four seasons analyzed, 19 wins, 0 draws, 0 losses. 57 home points and 100% home win percentage.

### 3. Which teams had the best attacking and defensive records
In this analysis, I wanted to see which teams had the best attacking and defensive records across all seasons. I wrote 2 separate queries to get results for attacking, defending.

- For attacking, in 22/23, 23/24 Real Madrid had the best attacking record with a total of 75 and 87 goals scored. In 24/25, 25/26 Barcelona had the best attacking records eith 102 and 95 goals scored.

- for defending, in 22/23 and 23/24 Barcelona and Real Madrid had the best defense. Barcelona only conceded 20 goals and Real Madrid only conceded 26 goals. In the 25/26 season, athletic club of bilbao had the best defense only conceding 29 goals. In 25/26 season the best defense wasReal Madrid's conceding 35 goals.

### 4. How Important is home advantage?
In this section, I wanted to know if home advantage is real phenonmenon and if it actually matters. I will be performing this analysis across all four of the chosen seasons.

- In the 22/23 season, there was a total of 182 home wins, 89 draws, 109 losses. This resulted in a home win percentage of 47.89%. When comparing with away win percentage, this resulted with a home win advantage of 19.21%

- for 23/24, 167 wins, 107 draws, and 106 losses. A home win percentage of 43.95%. compared with away win percentage, the total home win advantage was 16.06%

- 24/25, 169 wins, 97 draws, and 114 losses. A home win percentage of 44.47%. compared with away win percentage, the total home win advantage was 14.47%

- 25/26, 186 wins, 93 draws, and 101 losses. A home win percentage of 48.95%. compared with away win percentage, the total home win advantage was 22.37%

### 5. How does shot generation relate to match result
For this business question, I wanted to explore if there was a correlation between shots and match results. 

- 22/23, for this season, Real Madrid lead the league with a total of 647 shots, an average of 17 shots per match. They had a record of 24 wins, 6 draws, 8 losses. As compared to the least shot generated team; Mallorca had 328 total shots, an average of 9 shots per match. Their record was 14 wins, 8 draws, 16 losses.

- 23/24, In this season Real Madrid also lead the league in shots generated with 596 shots. An average of 16 shots per match. Their record was 29 wins, 8 draws, 1 loss. Valencia had the least shots in this season with 377 shots. An average of 10 shots per match. Their record was 13 wins, 10 draws, 15 losses.

- 24/25, In this season Barcelona lead the league in shots generated with 678 shots. An average of 18 shots per match. Their record was 28 wins, 4 draws, 6 losses. Valladolid had the least shots in this season with 335 shots. An average of 9 shots per match. Their record was 4 wins, 4 draws, 30 losses.

- 25/26, In this season Barcelona also lead the league in shots generated with 692 shots. An average of 18 shots per match. Their record was 31 wins, 1 draw, 6 losses. Getafe had the least shots in this season with 351 shots. An average of 9 shots per match. Their record was 15 wins, 6 draws, 17 losses.