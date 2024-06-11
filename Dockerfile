FROM icr.io/appcafe/websphere-liberty:24.0.0.5-full-java8-openj9-ubi

ENV LICENSE accept
ENV APPID_SAMPLE_HOST secure.1g3gcv5qwvkl.us-south.codeengine.appdomain.cloud
ENV APPID_SAMPLE_SSL_PORT 443

COPY Liberty /config/

EXPOSE 8080
