CREATE
  (Khabib:Fighter {name: 'Khabib Nurmagomedov', weight: 155}),
  (Rafael:Fighter {name: 'Rafael Dos Anjos', weight: 155}),
  (Neil:Fighter {name: 'Neil Magny', weight: 170}),
  (Jon:Fighter {name: 'Jon Jones', weight: 205}),
  (Daniel:Fighter {name: 'Daniel Cormier', weight: 205}),
  (Michael:Fighter {name: 'Michael Bisping', weight: 185}),
  (Matt:Fighter {name: 'Matt Hamill', weight: 185}),
  (Brandon:Fighter {name: 'Brandon Vera', weight: 205}),
  (Frank:Fighter {name: 'Frank Mir', weight: 230}),
  (Brock:Fighter {name: 'Brock Lesnar', weight: 230}),
  (Kelvin:Fighter {name: 'Kelvin Gastelum', weight: 185})

CREATE
  (Khabib)-[:BEATS]->(Rafael),
  (Rafael)-[:BEATS]->(Neil),
  (Jon)-[:BEATS]->(Daniel),
  (Michael)-[:BEATS]->(Matt),
  (Jon)-[:BEATS]->(Brandon),
  (Brandon)-[:BEATS]->(Frank),
  (Frank)-[:BEATS]->(Brock),
  (Neil)-[:BEATS]->(Kelvin),
  (Kelvin)-[:BEATS]->(Michael),
  (Michael)-[:BEATS]->(Matt),
  (Michael)-[:BEATS]->(Kelvin),
  (Matt)-[:BEATS]->(Jon)
