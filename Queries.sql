#Creating table from NintendoGames CSV via Kaggle
CREATE TABLE nintendo_games(
	meta_score INTEGER,
	title VARCHAR(1000) NOT NULL,
	platform VARCHAR(100),
	release_date DATE,
	user_score DECIMAL,
	esrb_rating VARCHAR(10),
	developers VARCHAR(1000),
	genres VARCHAR(1000)
);


#Cleaning NULL values from meta_score, user_score and esrb_rating
DELETE FROM nintendo_games
WHERE user_score is null OR
	meta_score is null OR
	esrb_rating is null;



--------------------------------------------------------------------------------

SELECT * FROM nintendo_games;


#Checking all platforms released by Nintendo
SELECT DISTINCT (platform) as total_platforms
FROM nintendo_games;

#Checking all ratings of games per rating (E, E10+, T, M)
SELECT DISTINCT COUNT (esrb_rating) as amount, esrb_rating 
FROM nintendo_games
GROUP BY esrb_rating
ORDER BY amount desc;

#Games that have greater than a 95 critic score on Metacritic are displayed here
SELECT title, meta_score, platform
FROM nintendo_games
WHERE meta_score >= '95'
ORDER BY meta_score desc
LIMIT 15;

#Wanting to know how many scores are above a 95 crtitic score on Metacritic per platform
#Can limit this result to top 3 to see the best performing platforms (N64,GC,GBA)
SELECT COUNT(title) as total_per_platform, platform
FROM nintendo_games
WHERE meta_score >= '95'
GROUP BY platform
ORDER BY COUNT(title) desc;

SELECT COUNT(title) as total_per_platform, platform
FROM nintendo_games
WHERE meta_score >= '95'
GROUP BY platform
ORDER BY COUNT(title) desc
LIMIT 3;


#The best user reviewed scores on Metacritic
#Outlier of Metal Torrent with a 9.7 user score but 62 critic score
SELECT title, user_score, platform
FROM nintendo_games
WHERE user_score > '9.0'
ORDER BY user_score desc
LIMIT 15;


#Looking at the best 3 rated video games of each platform generation exlcuding iOS
SELECT title, platform, meta_score
FROM nintendo_games
WHERE meta_score >= '90' AND
platform LIKE '%N64%'
ORDER BY meta_score desc
LIMIT 3;

SELECT title, platform, meta_score
FROM nintendo_games
WHERE meta_score >= '90' AND
platform LIKE '%GBA%'
ORDER BY meta_score desc
LIMIT 3;

SELECT title, platform, meta_score
FROM nintendo_games
WHERE meta_score >= '90' AND
platform LIKE '%GC%'
ORDER BY meta_score desc
LIMIT 3;

SELECT title, platform, meta_score
FROM nintendo_games
WHERE meta_score >= '90' AND
platform LIKE 'DS%'
ORDER BY meta_score desc
LIMIT 3;

SELECT title, platform, meta_score
FROM nintendo_games
WHERE meta_score >= '90' AND
platform LIKE '%WII'
ORDER BY meta_score desc
LIMIT 3;

SELECT title, platform, meta_score
FROM nintendo_games
WHERE meta_score >= '90' AND
platform LIKE '3DS%'
ORDER BY meta_score desc
LIMIT 3;

SELECT title, platform, meta_score
FROM nintendo_games
WHERE meta_score >= '90' AND
platform LIKE '%WIIU'
ORDER BY meta_score desc
LIMIT 3;

SELECT title, platform, meta_score
FROM nintendo_games
WHERE meta_score >= '90' AND
platform LIKE '%Switch%'
ORDER BY meta_score desc
LIMIT 3;


#Total count of genres
#Getting best performing genres based on metascore
SELECT genres, COUNT (genres) as total_per_genre
FROM nintendo_games
GROUP BY genres
ORDER BY total_per_genre desc;


SELECT genres, COUNT (genres) as best_genre
FROM nintendo_games
WHERE meta_score > '90'
GROUP BY genres
ORDER BY best_genre desc;











