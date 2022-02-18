#Creating Table from NintendoGames CSV via Kaggle


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

