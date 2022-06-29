ARG STACK_VERSION
FROM docker.elastic.co/logstash/logstash:${STACK_VERSION}


# install dependency
RUN /usr/share/logstash/bin/logstash-plugin install --no-verify
RUN /usr/share/logstash/bin/logstash-plugin install logstash-integration-jdbc
RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-aggregate
RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-mutate

# update dependency
# RUN /usr/share/logstash/bin/logstash-plugin update logstash-input-jdbc
# RUN /usr/share/logstash/bin/logstash-plugin update logstash-integration-jdbc
# RUN /usr/share/logstash/bin/logstash-plugin update logstash-filter-aggregate
# RUN /usr/share/logstash/bin/logstash-plugin update logstash-filter-mutate

# copy lib database jdbc jars
# COPY ./mysql-connector-java-8.0.11.jar /usr/share/logstash/logstash-core/lib/jars/mysql-connector-java.jar
COPY ./jars/ /usr/share/logstash/logstash-core/lib/jars/
COPY ./jars/ /usr/share/logstash/jars/
COPY ./pipeline/logstash.conf /usr/share/logstash/pipeline/


# COPY ./compose/sql-server/mssql-jdbc-7.4.1.jre11.jar /usr/share/logstash/logstash-core/lib/jars/mssql-jdbc.jar
# COPY ./compose/oracle/ojdbc6-11.2.0.4.jar /usr/share/logstash/logstash-core/lib/jars/ojdbc6.jar
# COPY ./compose/postgres/postgresql-42.2.8.jar /usr/share/logstash/logstash-core/lib/jars/postgresql.jar

# RUN chown 1000:1000 -R /usr/share/logstash/
USER root
RUN usermod -a -G root logstash
USER logstash
