CALL gds.pageRank.stream({
  nodeProjection: 'User',
  relationshipProjection: {
    relType: {
      type: 'FOLLOWS',
      orientation: 'UNDIRECTED',
      properties: {}
    }
  },
  relationshipWeightProperty: null,
  dampingFactor: 0.85,
  maxIterations: 200
})
YIELD nodeId, pagerank
WITH gds.util.asNode(nodeId) AS User_id, pagerank
RETURN User_id, pagerank
ORDER BY pagerank DESC
LIMIT 100;