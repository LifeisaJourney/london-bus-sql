DROP DATABASE IF EXISTS london_bus;
CREATE DATABASE london_bus;
\c london_bus;

DROP TABLE IF EXISTS stops;
DROP TABLE IF EXISTS routes;
DROP TABLE IF EXISTS bus;

CREATE TABLE stops (
    id serial PRIMARY KEY,
    name_stop varchar(50) NOT NULL, 
    bus_id integer REFERENCES bus(id),
    route_id varchar(50) REFERENCES routes(id),
    dock_time DATETIME 
);

CREATE TABLE routes (
    id serial PRIMARY KEY, 
    num varchar(50) PRIMARY KEY NOT NULL,
    company text PRIMARY KEY NOT NULL,
    pos integer PRIMARY KEY NOT NULL, 
    stop_id integer REFERENCES stops(id),
    bus_id integer REFERENCES bus(id)
);

CREATE TABLE bus (
    id serial PRIMARY KEY, 
    num varchar(50) PRIMARY KEY NOT NULL, 
    date_started integer NOT NULL,
    company_created varchar(50) NOT NULL, 
    repair_needed boolean NOT NULL, 
    stop_id integer REFERENCES stops(id),
    route_id varchar(50) REFERENCES routes(id),
    dock_time DATETIME 
);