FROM trenpixster/elixir:1.2.0

ENV PORT 80
EXPOSE $PORT
ENV MIX_ENV prod

run mkdir /app
workdir /app

# Install Elixir Deps
ADD lib  ./lib
add config ./config
add mix.* ./
ADD Dockerrun.aws.json ./
RUN mix local.rebar
RUN mix local.hex --force
RUN mix deps.get
RUN mix compile
RUN mix escript.build

ENTRYPOINT ["/app/helloworld"]
