FROM icr.io/appcafe/websphere-liberty:24.0.0.5-full-java8-openj9-ubi

ENV LICENSE accept

COPY Liberty /config/

EXPOSE 8080
