CALL gds.alpha.hits.stream({
  nodeProjection: '*',
  relationshipProjection: {
    relType: {
      type: '*',
      orientation: 'NATURAL',
      properties: {}
    }
  },
  relationshipWeightProperty: null,
  hitsIterations: 20
})
YIELD nodeId, values
WITH gds.util.asNode(nodeId) AS User_id, values.auth AS authScore, values.hub AS hubScore
RETURN User_id, authScore, hubScore
ORDER BY authScore DESC
LIMIT 100;