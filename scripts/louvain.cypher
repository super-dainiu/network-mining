CALL gds.louvain.stream({
  nodeProjection: 'User',
  relationshipProjection: {
    relType: {
      type: 'FOLLOWS',
      orientation: 'UNDIRECTED',
      properties: {}
    }
  },
  relationshipWeightProperty: null,
  includeIntermediateCommunities: false,
  seedProperty: ''
})
YIELD nodeId, communityId AS community, intermediateCommunityIds AS communities
WITH gds.util.asNode(nodeId) AS node, community, communities
WITH community, communities, collect(node) AS User_id
RETURN community, communities, User_id, size(nodes) AS size
ORDER BY size DESC
LIMIT 100;