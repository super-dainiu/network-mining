MAX(cost): 8.0 AVG(cost): 3.6925068496966986
CALL gds.alpha.allShortestPaths.stream({
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
YIELD sourceNodeId, targetNodeId, distance AS cost
RETURN MAX(cost), AVG(cost)