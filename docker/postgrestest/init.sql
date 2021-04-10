CREATE DATABASE checkin_profile;
CREATE USER dartuser;
ALTER USER dartuser WITH password 'vee123456';
GRANT all ON database checkin_profile TO dartuser;

\connect checkin_profile


CREATE TABLE IF NOT EXISTS CheckHistoryTable (
    id SERIAL PRIMARY KEY,

    datetime TIMESTAMP,
    userId TEXT NOT NULL,
    location JSONB,
    image TEXT,
    statusCheck TEXT

);