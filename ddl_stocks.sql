DROP TABLE IF EXISTS stocks;

CREATE TABLE IF NOT EXISTS stocks(
    ticker VARCHAR(5),
    trade_date DATE,
    open DOUBLE PRECISION,
    high DOUBLE PRECISION,
    low DOUBLE PRECISION,
    close DOUBLE PRECISION,
    adj_close DOUBLE PRECISION,
    volume INTEGER,
    divident_amt DOUBLE PRECISION,
    split_coef DOUBLE PRECISION,
    UNIQUE(ticker, trade_date)
);

-- CREATE OR REPLACE FUNCTION remove_dupe_price()
-- RETURNS trigger AS
-- $func$
-- BEGIN
--     IF EXISTS (
--         SELECT ticker, trade_date FROM stocks
--         WHERE ticker = NEW.ticker AND trade_date = NEW.trade_date
--     ) THEN RETURN NULL;
--     END IF;
--     RETURN NEW;
-- END
-- $func$  LANGUAGE plpgsql;
--
-- CREATE TRIGGER insert_on_stocks
-- BEFORE INSERT ON stocks
-- FOR EACH ROW EXECUTE PROCEDURE remove_dupe_price();
