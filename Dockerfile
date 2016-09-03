FROM msaraiva/erlang:18.1

ENV PORT 80
EXPOSE $PORT

RUN apk --update add \
  erlang-crypto && \
  rm -rf /var/cache/apk/*

run mkdir /app
workdir /app
COPY helloworld /app

ENTRYPOINT ["/app/helloworld"]
