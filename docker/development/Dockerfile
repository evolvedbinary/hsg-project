FROM existdb/existdb:release

LABEL org.opencontainers.image.authors="Evolved Binary Ltd <tech@evolvedbinary.com>" \
      org.opencontainers.image.vendor="Evolved Binary" \
      org.opencontainers.image.url="https://github.com/evolvedbinary/hsg-project" \
      org.opencontainers.image.source="https://github.com/evolvedbinary/hsg-project" \
      org.opencontainers.image.description="HSG Project - Development Image" \
      org.opencontainers.image.title="hsg-project-dev"

COPY xars/*.xar /exist/autodeploy

EXPOSE 8080 8443

CMD [ "java", "org.exist.start.Main", "jetty" ]