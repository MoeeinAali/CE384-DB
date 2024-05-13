-- Query 1
SELECT *
FROM movies
WHERE movies.summary LIKE '%Gotham%';
-- Query 2
UPDATE users
SET email = 'pawn.kumar@gmail.com'
WHERE (first_name, last_name) = ('Pawan', 'Kumar');
SELECT *
FROM users
WHERE (first_name, last_name) = ('Pawan', 'Kumar');
-- Query 3
SELECT name, average_budget
FROM (SELECT actors.actor_id, AVG(movies.budget) as average_budget
      FROM actors
               JOIN act ON actors.actor_id = act.actor_id
               JOIN movies ON act.movie_id = movies.movie_id
      GROUP BY actors.actor_id) AS A
         JOIN actors
              ON actors.actor_id = A.actor_id;
-- Query 4
SELECT Movies.country, COUNT(*) as number_of_movies
FROM movies
GROUP BY movies.country
ORDER BY number_of_movies DESC
LIMIT 1;
-- Query 5
CREATE OR REPLACE FUNCTION get_review_count(id TEXT)
    RETURNS INT AS
$$
DECLARE
    review_count INT;
BEGIN
    SELECT COUNT(*)
    INTO review_count
    FROM reviews
    WHERE movie_id = id;
    RETURN review_count;
END
$$
    LANGUAGE plpgsql;
SELECT get_review_count('tt1375666');
-- Query 6
SELECT title, get_review_count(movie_id) AS review_count
FROM movies