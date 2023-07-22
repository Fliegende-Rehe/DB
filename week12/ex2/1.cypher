MATCH (f:Fighter)-[:BEATS]->()
WHERE f.weight IN [155, 170, 185]
WITH f.weight AS weight, COUNT(DISTINCT f) AS num_fighters
WHERE num_fighters > 0
RETURN weight, num_fighters
