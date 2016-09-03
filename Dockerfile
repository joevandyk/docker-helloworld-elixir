FROM trenpixster/elixir:1.3.2

ENV PORT 80
EXPOSE $PORT

# Install Elixir Deps
ADD mix.* ./
RUN MIX_ENV=prod mix local.rebar
RUN MIX_ENV=prod mix local.hex --force
RUN MIX_ENV=prod mix deps.get

run mkdir /app
workdir /app
COPY helloworld /app

ENTRYPOINT ["/app/helloworld"]
