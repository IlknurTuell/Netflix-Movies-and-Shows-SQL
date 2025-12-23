            --- Which movies and TV shows rank among the top 10 and bottom 10 based on their IMDb ratings?---
-- TOP 10 Movies 
SELECT TOP 10 title,type, imdb_score from titles
WHERE imdb_score >= 8.0 
AND type = 'MOVIE'
ORDER BY imdb_score DESC;

-- TOP 10 Shows 
SELECT TOP 10 title,type, imdb_score from titles
WHERE imdb_score >= 8.0 
AND type = 'SHOW'
ORDER BY imdb_score DESC;

--Bottom 10 Movies 
SELECT TOP 10 title,type, imdb_score from titles
WHERE imdb_score IS NOT NULL 
AND type = 'MOVIE'
ORDER BY imdb_score ASC;

--Bottom 10 Shows
SELECT TOP 10 title,type, imdb_score from titles
WHERE imdb_score IS NOT NULL 
AND type = 'SHOW'
ORDER BY imdb_score ASC;

                        ---Which genres are the most common on Netflix?---
--Most Common Movie Genres
SELECT TOP 10 genres,
COUNT(*) AS title_count FROM titles
WHERE type = 'MOVIE'
GROUP BY genres
ORDER BY title_count DESC;

--Most Common Show Genres
SELECT TOP 10 genres,
COUNT(*)AS title_count FROM titles
WHERE type = 'Show'
GROUP BY genres
ORDER BY title_count DESC;

--Top 3 most common genres OVERALL
SELECT TOP 3 t.genres, 
COUNT(*) AS genre_count 
FROM titles t
WHERE t.type = 'MOVIE' or t.type = 'SHOW'
GROUP BY t.genres
ORDER BY genre_count DESC;

---How many movies and shows fall in each decade in Netflix's library?---
SELECT CAST((release_year / 10) * 10 AS varchar(4)) + 's' AS decade,
COUNT(*) AS movies_shows_count from titles
WHERE release_year >= 1940
GROUP BY (release_year / 10) * 10
ORDER BY decade;


--- TV Shows with More Than 25 Seasons
SELECT title, seasons FROM titles
WHERE type = 'SHOW' AND seasons > 25
ORDER BY seasons DESC;

----- Actors Appearing in the Highest Number of Productions---
SELECT TOP 10 c.name, t.type,
COUNT(DISTINCT t.id) AS production_count
FROM credits c JOIN titles t
ON c.id = t.id
WHERE c.role = 'ACTOR'
GROUP BY c.name, t.type
ORDER BY production_count DESC;

-- Movies and TV Shows Featuring Leonardo DiCaprio :)

SELECT c.name, t.title,t.type, t.release_year,t.imdb_score,t.tmdb_popularity
FROM titles t JOIN credits c 
ON t.id = c.id
WHERE C.name = 'Leonardo DiCaprio' AND c.role = 'ACTOR'
ORDER BY t.release_year

-- Actors With the Highest Average IMDb Scores

SELECT c.name, AVG(t.imdb_score) AS avg_imdb
FROM credits c 
JOIN titles t 
ON c.id = t.id
WHERE c.role = 'ACTOR' AND t.imdb_score IS NOT NULL
GROUP BY c.name
ORDER BY avg_imdb DESC;

-- Titles and Directors of movies with high IMDB scores (>7.5) and high TMDB popularity scores (>80) 

SELECT t.title, c.name AS director_name, t.imdb_score, t.tmdb_popularity
FROM titles t
JOIN credits c
ON t.id = c.id
WHERE t.type = 'MOVIE'
  AND c.role = 'DIRECTOR'
  AND t.imdb_score > 7.5
  AND t.tmdb_popularity > 80
ORDER BY t.imdb_score DESC, t.tmdb_popularity DESC;

-- Average Runtime of Movies and TV Shows
SELECT type, AVG(runtime) AS avg_runtime
FROM titles
WHERE runtime IS NOT NULL
GROUP BY type;


-- Top 10 Directors with the Highest Number of Movies and TV Shows

SELECT TOP 10 c.name AS director_name,
COUNT(DISTINCT t.id) AS total_titles
FROM credits c
JOIN titles t
ON c.id = t.id
WHERE c.role = 'DIRECTOR'
GROUP BY c.name
ORDER BY total_titles DESC;

-- Top 10 Actors Who Appeared in the Most Movies and TV Shows

SELECT TOP 10 c.name AS actor_name,
COUNT(DISTINCT t.id) AS total_titles
FROM credits c
JOIN titles t
ON c.id = t.id
WHERE c.role = 'ACTOR'
GROUP BY c.name
ORDER BY total_titles DESC;
