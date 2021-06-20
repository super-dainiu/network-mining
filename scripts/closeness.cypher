CALL gds.closeness.stream({
  nodeProjection: 'User',
  relationshipProjection: {
    relType: {
      type: 'FOLLOWS',
      orientation: 'UNDIRECTED',
      properties: {}
    }
  }
})
YIELD nodeId, closeness
WITH gds.util.asNode(nodeId) AS User_id, closeness
RETURN User_id, closeness
ORDER BY closeness DESC
LIMIT 100;