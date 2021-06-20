LOAD CSV FROM 'file:///facebook_combined.csv' AS line
MERGE (p:User{id:toInteger(line[0])})
MERGE (q:User{id:toInteger(line[1])})
MERGE (p)-[:FOLLOWS]->(q)
