# Usa Ubuntu como base
FROM ubuntu:20.04

# Variables de entorno para Neo4j
ENV NEO4J_VERSION=4.4.11 \
    NEO4J_HOME=/var/lib/neo4j \
    NEO4J_CONF=/etc/neo4j \
    NEO4J_AUTH=admin/admin
# Cambia la contraseña inicial aquí

# Instalar dependencias y herramientas necesarias
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    openjdk-11-jdk \
    ca-certificates \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Crear directorios antes de cambiar permisos
RUN mkdir -p $NEO4J_CONF $NEO4J_HOME

# Crear usuario Neo4j para seguridad
RUN groupadd -r neo4j && useradd -r -g neo4j neo4j \
    && chown -R neo4j:neo4j $NEO4J_HOME $NEO4J_CONF

# Descargar Neo4j
RUN wget -O neo4j.tar.gz "https://dist.neo4j.org/neo4j-community-${NEO4J_VERSION}-unix.tar.gz" \
COPY neo4j.tar.gz /neo4j.tar.gz
RUN tar -xzf neo4j.tar.gz -C /var/lib/ \
    && mv /var/lib/neo4j-community-${NEO4J_VERSION}/* /var/lib/neo4j/ \
    && rm -rf /var/lib/neo4j-community-${NEO4J_VERSION} \
    && rm neo4j.tar.gz
# Descarga Apoc
RUN wget https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/4.4.0.7/apoc-4.4.0.7-all.jar
RUN mv apoc-4.4.0.7-all.jar /var/lib/neo4j/plugins/

COPY bnj-at3n-es-cfs-graph.dump /home/bnj-at3n-es-cfs-graph.dump
# Copy Config
COPY neo4j.conf /etc/neo4j/neo4j.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
# Asignar permisos correctos después de mover archivos
RUN chown -R neo4j:neo4j $NEO4J_HOME $NEO4J_CONF /var/lib/neo4j/logs /var/lib/neo4j/run \
    && chmod -R 755 $NEO4J_HOME /var/lib/neo4j/logs /var/lib/neo4j/run

# Exponer los puertos de Neo4j
EXPOSE 7474 7687

# Establecer Neo4j como usuario predeterminado
USER neo4j

# Comando de inicio
#CMD ["/var/lib/neo4j/bin/neo4j", "console"]
ENTRYPOINT ["/entrypoint.sh"]
