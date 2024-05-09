-- Create Tables
CREATE TABLE IF NOT EXISTS users
(
    user_id    VARCHAR(255) not null PRIMARY KEY,
    first_name VARCHAR(255),
    last_name  VARCHAR(255),
    email      VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS actors
(
    actor_id VARCHAR(255) NOT NULL PRIMARY KEY,
    name     VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS movies
(
    movie_id VARCHAR(255) NOT NULL PRIMARY KEY,
    title    VARCHAR(255),
    director VARCHAR(255),
    budget   INT,
    summary  TEXT,
    country  VARCHAR(255)
);

CREATE TABLE reviews
(
    review_id   VARCHAR(255) NOT NULL PRIMARY KEY,
    user_id     VARCHAR(255) REFERENCES users (user_id),
    movie_id    VARCHAR(255) REFERENCES movies (movie_id),
    review_text TEXT,
    score       INT
);

CREATE TABLE act
(
    actor_id VARCHAR(255) NOT NULL REFERENCES actors (actor_id),
    movie_id VARCHAR(255) NOT NULL REFERENCES movies (movie_id),
    PRIMARY KEY (actor_id, movie_id)
);

-- Insert Data into Tables
\copy users(user_id, first_name, last_name, Email) FROM './Data/tables/users.csv' DELIMITER ',' CSV HEADER;
\copy actors(actor_id, name) FROM './Data/tables/actors.csv' DELIMITER ',' CSV HEADER;
\copy movies(movie_id, title, director, budget, summary,countary) FROM './Data/tables/movies.csv' DELIMITER ',' CSV HEADER;
\copy reviews(review_id, user_id, movie_id, review_text, score) FROM './Data/tables/reviews.csv' DELIMITER ',' CSV HEADER;
\copy act(actor_id, movie_id) FROM './Data/tables/act.csv' DELIMITER ',' CSV HEADER;