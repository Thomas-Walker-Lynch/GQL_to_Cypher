MATCH (player:Player {name: 'LeBron James'}), (team:Team {name: 'Lakers'})
CREATE (player)-[:PLAYS_FOR]->(team)
