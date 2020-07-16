-- DROP TABLE IF EXISTS sentiment;

CREATE TABLE IF NOT EXISTS sentiment(
    ticker VARCHAR(5),
    post_date DATE,
    posts INTEGER,
    upvotes INTEGER,
    downvotes INTEGER,
    comments INTEGER,
    negative DOUBLE PRECISION,
    positive DOUBLE PRECISION,
    compound DOUBLE PRECISION,
    UNIQUE(ticker, post_date)
);

INSERT INTO sentiment
SELECT stock AS ticker
    , DATE(created_utc) AS post_date
    , COUNT(DISTINCT post_id) AS posts
    , SUM(upvote) AS upvotes
    , SUM(downvote) AS downvotes
    , SUM(comments) AS comments
    , AVG(neg) AS negative
    , AVG(pos) AS positive
    , AVG(compound) AS compound
FROM reddit
GROUP BY 1, 2
ORDER BY 1, 2;
