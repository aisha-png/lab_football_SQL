-- psql -d football -f football_queries.sql

DROP TABLE division;
DROP TABLE matches;


-- Find all the matches from 2017.

SELECT * FROM matches WHERE season = 2017;



--Find all the matches featuring Barcelona.
SELECT * FROM matches WHERE hometeam = 'Barcelona' OR awayteam = 'Barcelona';



--What are the names of the Scottish divisions included?
SELECT name FROM divisions WHERE country = 'Scotland'



--Find the division code for the Bundesliga. Use that code to find out how many matches Freiburg have
-- played in the Bundesliga since the data started being collected.
SELECT COUNT(*) FROM matches WHERE division_code = ('D1' AND (hometeam = 'Freiburg' OR awayteam = 'Freiburg');





--Find the unique names of the teams which include the word "City" in their name (as entered in the database)
SELECT DISTINCT hometeam FROM matches WHERE hometeam ILIKE '%city%';





--How many different teams have played in matches recorded in a French division?
SELECT COUNT(DISTINCT hometeam) FROM matches WHERE division_code ILIKE '%F%';





--Have Huddersfield played Swansea in the period covered?
SELECT COUNT(*) FROM matches WHERE hometeam = 'Swansea' AND awayteam = 'Huddersfield' OR hometeam = 'Huddersfield' AND awayteam = 'Swansea';





-- How many draws were there in the Eredivisie between 2010 and 2015?
SELECT COUNT(*) FROM matches WHERE ftr = 'D' AND division_code = 'N1' AND season >= 2010 AND season <= 2015;





-- Select the matches played in the Premier League in order of total goals scored from highest to lowest.
Where there is a tie the match with more home goals should come first.






--In which division and which season were the most goals scored?
SELECT SUM(fthg + ftag), division_code, season FROM matches  GROUP BY division_code, season ORDER BY SUM(fthg + ftag) DESC;