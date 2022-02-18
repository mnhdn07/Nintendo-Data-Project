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