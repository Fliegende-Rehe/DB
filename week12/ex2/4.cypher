MATCH (f:Fighter)
OPTIONAL MATCH (f)-[:BEATS]->()
WITH f, COUNT(*) AS num_wins
WHERE num_wins = 0 OR NOT EXISTS(()-[:BEATS]->(f))
RETURN
  SUM(CASE WHEN num_wins = 0 THEN 1 ELSE 0 END) AS num_undefeated,
  SUM(CASE WHEN NOT EXISTS(()-[:BEATS]->(f)) THEN 1 ELSE 0 END) AS num_defeated