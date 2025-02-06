#!/bin/bash

echo "Esperando 60 segundos antes de iniciar Neo4j..."
/var/lib/neo4j/bin/neo4j-admin load --from=/home/bnj-at3n-es-cfs-graph.dump --database=neo4j --force

sleep 5

echo "Iniciando Neo4j..."
/var/lib/neo4j/bin/neo4j console &
sleep 5
echo "Configuramos claves"
/var/lib/neo4j/bin/neo4j-admin set-initial-password  admin123

sleep 5
echo "Paramos neo4j para que tome las credenciales"
/var/lib/neo4j/bin/neo4j stop
sleep 5
exec /var/lib/neo4j/bin/neo4j console


