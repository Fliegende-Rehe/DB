MATCH (f:Fighter)-[:BEATS]->(f2:Fighter)-[:BEATS]->(f:Fighter)
WHERE f <> f2
RETURN f.name, f2.name, COUNT(*) AS num_wins_each_other
