
DROP TABLE IF EXISTS food;
DROP TABLE IF EXISTS bees;
DROP TABLE IF EXISTS types;
DROP TABLE IF EXISTS plants;

CREATE TABLE types
(id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE bees
(id SERIAL8 primary key,
  name VARCHAR(255) not null,
  type_id INT8 REFERENCES types(id),
  hunger_level INT4
);

CREATE TABLE plants
(id SERIAL8 primary key,
  name VARCHAR(255),
  season VARCHAR(255),
  pollen INT4
);

CREATE TABLE food
(id SERIAL8 primary key,
  plant_id INT8 REFERENCES plants(id) ON DELETE CASCADE,
  bee_id INT8 REFERENCES bees(id) ON DELETE CASCADE
);
