MATCH (player:Player)-[:PLAYS_FOR]->(team:Team {name: 'Lakers'})
RETURN player.name
