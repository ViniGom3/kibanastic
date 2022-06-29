ARG STACK_VERSION
FROM docker.elastic.co/logstash/logstash:${STACK_VERSION}
# install dependency
RUN /usr/share/logstash/bin/logstash-plugin install logstash-input-jdbc || echo '0'
RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-aggregate || echo '0'
RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-jdbc_streaming || echo '0'
RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-mutate || echo '0'

# copy lib database jdbc jars
# COPY ./mysql-connector-java-8.0.11.jar /usr/share/logstash/logstash-core/lib/jars/mysql-connector-java.jar
COPY ./mysql-connector-java-8.0.29.jar /usr/share/logstash/logstash-core/lib/jars/mysql-connector-java.jar
# COPY ./compose/sql-server/mssql-jdbc-7.4.1.jre11.jar /usr/share/logstash/logstash-core/lib/jars/mssql-jdbc.jar
# COPY ./compose/oracle/ojdbc6-11.2.0.4.jar /usr/share/logstash/logstash-core/lib/jars/ojdbc6.jar
# COPY ./compose/postgres/postgresql-42.2.8.jar /usr/share/logstash/logstash-core/lib/jars/postgresql.jar

USER root
RUN usermod -a -G root logstash
USER logstash