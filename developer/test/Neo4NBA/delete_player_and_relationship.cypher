MATCH (player:Player {name: 'LeBron James'})-[r:PLAYS_FOR]->(team:Team {name: 'Lakers'})
DELETE r
DELETE player
