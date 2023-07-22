MATCH (f:Fighter)-[:BEATS]->()
WITH f, COUNT(*) AS num_fights
ORDER BY num_fights DESC
LIMIT 1
RETURN f.name, num_fights
