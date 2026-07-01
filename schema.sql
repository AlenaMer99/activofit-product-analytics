CREATE TABLE events (event_id integer, user_id integer, event_time timestamp without time zone, event_type character varying, screen character varying, additional_info text);
CREATE TABLE subscriptions (subscription_id integer, user_id integer, start_date date, end_date date, status character varying, price_usd numeric);
CREATE TABLE users (user_id integer, install_date date, platform character varying, country character varying, acquisition_source character varying);
