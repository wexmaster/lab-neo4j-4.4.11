# lab-neo4j-4.4.11
Entorno Lab para restaurar un DUMP y hacer pruebas en neo4j incluye apoc

Descargamos el repo
```
git clone https://github.com/wexmaster/lab-neo4j-4.4.11.git
```

Incluir el DUMP en el mismo directorio de Dockerfile
```
bnj-at3n-es-cfs-graph.dump
```
Costruimos el Docker
```
docker build --no-cache -t neo4j:4.4.11 .
```

Como es un entorno de lab arrancamos en modo consola para que restaure la bbdd y aplique credenciales neo4j/admin123 cuando salgamos con CONTROL + C borrara el contenedor

```
docker run -it --rm --name neo4j -p 7474:7474 -p 7687:7687  neo4j:4.4.11

```

cuando ejecutemos veremos algo asi aunque no tarda 60 segundos dar el tiempo hasta que veamos al final el Started.

```
Esperando 60 segundos antes de iniciar Neo4j...
Selecting JVM - Version:11.0.26+4-post-Ubuntu-1ubuntu120.04, Name:OpenJDK 64-Bit Server VM, Vendor:Ubuntu
Done: 396 files, 1002MiB processed.
Iniciando Neo4j...
Directories in use:
home:         /var/lib/neo4j
config:       /etc/neo4j
logs:         /var/lib/neo4j/logs
plugins:      /var/lib/neo4j/plugins
import:       /var/lib/neo4j
data:         /var/lib/neo4j/data
certificates: /var/lib/neo4j/certificates
licenses:     /var/lib/neo4j/licenses
run:          /var/lib/neo4j/run
Starting Neo4j.
2025-02-06 07:41:36.617+0000 INFO  Note that since you did not explicitly set the port in dbms.connector.bolt.advertised_address Neo4j automatically set it to 7687 to match dbms.connector.bolt.listen_address. This behavior may change in the future and we recommend you to explicitly set it.
2025-02-06 07:41:36.618+0000 INFO  Note that since you did not explicitly set the port in dbms.connector.http.advertised_address Neo4j automatically set it to 7474 to match dbms.connector.http.listen_address. This behavior may change in the future and we recommend you to explicitly set it.
2025-02-06 07:41:36.618+0000 WARN  Unrecognized setting. No declared setting with name: dbms.plugins.enabled
2025-02-06 07:41:36.620+0000 INFO  Starting...
2025-02-06 07:41:37.164+0000 INFO  This instance is ServerId{61baea5f} (61baea5f-9661-412b-bd9b-f51411c850e6)
2025-02-06 07:41:38.229+0000 INFO  ======== Neo4j 4.4.11 ========
Configuramos claves
Selecting JVM - Version:11.0.26+4-post-Ubuntu-1ubuntu120.04, Name:OpenJDK 64-Bit Server VM, Vendor:Ubuntu
Changed password for user 'neo4j'. IMPORTANT: this change will only take effect if performed before the database is started for the first time.
2025-02-06 07:41:43.168+0000 INFO  Initializing system graph model for component 'security-users' with version -1 and status UNINITIALIZED
2025-02-06 07:41:43.175+0000 INFO  Setting up initial user from `auth.ini` file: neo4j
2025-02-06 07:41:43.175+0000 INFO  Creating new user 'neo4j' (passwordChangeRequired=false, suspended=false)
2025-02-06 07:41:43.185+0000 INFO  Setting version for 'security-users' to 3
2025-02-06 07:41:43.187+0000 INFO  After initialization of system graph model component 'security-users' have version 3 and status CURRENT
2025-02-06 07:41:43.193+0000 INFO  Performing postInitialization step for component 'security-users' with version 3 and status CURRENT
2025-02-06 07:41:44.689+0000 INFO  Called db.clearQueryCaches(): Query caches successfully cleared of 1 queries.
2025-02-06 07:41:44.751+0000 INFO  Bolt enabled on [0:0:0:0:0:0:0:0%0]:7687.
2025-02-06 07:41:45.416+0000 INFO  Remote interface available at http://localhost:7474/
2025-02-06 07:41:45.419+0000 INFO  id: 0409C1A8323675BE0006F692220CAA421A3F39D68B7A62DD30B296F78561F738
2025-02-06 07:41:45.419+0000 INFO  name: system
2025-02-06 07:41:45.419+0000 INFO  creationDate: 2025-02-06T07:41:39.018Z
2025-02-06 07:41:45.419+0000 INFO  Started.
Paramos neo4j para que tome las credenciales
Stopping Neo4j..2025-02-06 07:41:47.175+0000 INFO  Neo4j Server shutdown initiated by request
2025-02-06 07:41:47.176+0000 INFO  Stopping...
.....2025-02-06 07:41:53.145+0000 INFO  Stopped.
. stopped.
Directories in use:
home:         /var/lib/neo4j
config:       /etc/neo4j
logs:         /var/lib/neo4j/logs
plugins:      /var/lib/neo4j/plugins
import:       /var/lib/neo4j
data:         /var/lib/neo4j/data
certificates: /var/lib/neo4j/certificates
licenses:     /var/lib/neo4j/licenses
run:          /var/lib/neo4j/run
Starting Neo4j.
2025-02-06 07:41:59.848+0000 INFO  Note that since you did not explicitly set the port in dbms.connector.bolt.advertised_address Neo4j automatically set it to 7687 to match dbms.connector.bolt.listen_address. This behavior may change in the future and we recommend you to explicitly set it.
2025-02-06 07:41:59.849+0000 INFO  Note that since you did not explicitly set the port in dbms.connector.http.advertised_address Neo4j automatically set it to 7474 to match dbms.connector.http.listen_address. This behavior may change in the future and we recommend you to explicitly set it.
2025-02-06 07:41:59.849+0000 WARN  Unrecognized setting. No declared setting with name: dbms.plugins.enabled
2025-02-06 07:41:59.851+0000 INFO  Starting...
2025-02-06 07:42:00.129+0000 INFO  This instance is ServerId{61baea5f} (61baea5f-9661-412b-bd9b-f51411c850e6)
2025-02-06 07:42:00.892+0000 INFO  ======== Neo4j 4.4.11 ========
2025-02-06 07:42:04.515+0000 INFO  Performing postInitialization step for component 'security-users' with version 3 and status CURRENT
2025-02-06 07:42:04.515+0000 INFO  Updating the initial password in component 'security-users'
2025-02-06 07:42:05.965+0000 INFO  Called db.clearQueryCaches(): Query caches successfully cleared of 1 queries.
2025-02-06 07:42:06.013+0000 INFO  Bolt enabled on [0:0:0:0:0:0:0:0%0]:7687.
2025-02-06 07:42:06.584+0000 INFO  Remote interface available at http://localhost:7474/
2025-02-06 07:42:06.587+0000 INFO  id: 0409C1A8323675BE0006F692220CAA421A3F39D68B7A62DD30B296F78561F738
2025-02-06 07:42:06.587+0000 INFO  name: system
2025-02-06 07:42:06.587+0000 INFO  creationDate: 2025-02-06T07:41:39.018Z
2025-02-06 07:42:06.587+0000 INFO  Started.
```

Una vez echo esto ya podemos acceder http://localhost:7474/browser/ con las credenciales neo4j/admin123
