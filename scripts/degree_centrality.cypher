CALL gds.alpha.degree.stream({
  nodeProjection: 'User',
  relationshipProjection: {
    relType: {
      type: 'FOLLOWS',
      orientation: 'UNDIRECTED',
      properties: {}
    }
  },
  relationshipWeightProperty: null
}) 
YIELD nodeId, degree
WITH gds.util.asNode(nodeId) AS User_id, degree
RETURN User_id, degree
ORDER BY degree DESC
LIMIT 100;