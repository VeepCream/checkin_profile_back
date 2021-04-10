FROM postgres
COPY init.sql /docker-entrypoint-initdb.d/

EXPOSE 5432

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD vee123456
ENV POSTGRES_DB checkin_profile