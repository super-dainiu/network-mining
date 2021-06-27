average cost: 3.6541916797363814 Diameter: 6.0 
CALL gds.alpha.allShortestPaths.stream({
  nodeProjection: 'Article',
  relationshipProjection: {
    relType: {
      type: 'Cite',
      orientation: 'UNDIRECTED',
      properties: {}
    }
  },
  relationshipWeightProperty: null
})
YIELD sourceNodeId, targetNodeId, distance AS cost
RETURN AVG(cost), MAX(cost)