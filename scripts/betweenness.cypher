CALL gds.betweenness.stream({
  nodeProjection: 'User',
  relationshipProjection: {
    relType: {
      type: 'FOLLOWS',
      orientation: 'UNDIRECTED',
      properties: {}
    }
  }
})
YIELD nodeId, betweenness
WITH gds.util.asNode(nodeId) AS User_id, betweenness
RETURN User_id, betweenness
ORDER BY betweenness DESC
LIMIT 100;