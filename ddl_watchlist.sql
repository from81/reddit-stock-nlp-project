DROP TABLE IF EXISTS watchlist;

CREATE TABLE IF NOT EXISTS watchlist(
    ticker VARCHAR(5) UNIQUE,
    name VARCHAR(30)
);
INSERT INTO watchlist(ticker, name)
    VALUES ('SPY', 'S&P 500'),
           ('QQQ', 'Nasdaq 100'),
           ('TSLA', 'Tesla'),
           ('BYND', 'Beyond Meat'),
           ('LMND', 'Lemonade'),
           ('DOCU', 'DocuSign'),
           ('NIO', 'Nio'),
           ('DDOG', 'Datadog'),
           ('NET', 'CloudFlare'),
           ('SPOT', 'Spotify'),
           ('MTCH', 'Match');

CREATE OR REPLACE FUNCTION remove_dupe()
RETURNS trigger AS
$func$
BEGIN
    IF EXISTS (
        SELECT post_id, stock FROM reddit
        WHERE post_id = NEW.post_id AND stock = NEW.stock
    ) THEN RETURN NULL;
    END IF;
    RETURN NEW;
END
$func$  LANGUAGE plpgsql;

CREATE TRIGGER insert_on_reddit
BEFORE INSERT ON reddit
FOR EACH ROW EXECUTE PROCEDURE remove_dupe();
