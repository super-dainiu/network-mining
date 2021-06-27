CALL gds.louvain.write({
  nodeProjection: 'Article',
  relationshipProjection: {
    relType: {
      type: 'Cite',
      orientation: 'UNDIRECTED',
      properties: {}
    }
  },
  relationshipWeightProperty: null,
  includeIntermediateCommunities: false,
  seedProperty: 'id',
  nodeProperties: [
    'id'
  ],
  writeProperty: 'louvain'
});
MATCH (node:`Article`)
WHERE exists(node.`louvain`)
WITH node, node.`louvain` AS community
WITH collect(node) AS allNodes,
CASE WHEN apoc.meta.type(community) = "long[]" THEN community[-1] ELSE community END AS community,
CASE WHEN apoc.meta.type(community) = "long[]" THEN community ELSE null END as communities
RETURN community, communities, allNodes[0..$communityNodeLimit] AS nodes, size(allNodes) AS size
ORDER BY size DESC