FROM openjdk:21-jdk-alpine
RUN addgroup -S codify && adduser -S codify -G codify && mkdir -p /opt/codify
WORKDIR /opt/codify
COPY target/codifyss-springboot.jar app.jar
COPY startup.sh startup.sh
RUN chown -R codify:codify /opt/codify 
USER codify
EXPOSE 8080
ENTRYPOINT ["./startup.sh"]
