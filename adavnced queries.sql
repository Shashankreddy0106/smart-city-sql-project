USE smart_city;

-- Check tables
SHOW TABLES;

-- Check number of records
SELECT COUNT(*) AS riders_count FROM riders;
SELECT COUNT(*) AS drivers_count FROM drivers;
SELECT COUNT(*) AS rides_count FROM rides;
SELECT COUNT(*) AS feedback_count FROM feedback;

-- Peek at some data
SELECT * FROM riders LIMIT 5;
SELECT * FROM drivers LIMIT 5;
SELECT * FROM rides LIMIT 5;
SELECT * FROM feedback LIMIT 5;