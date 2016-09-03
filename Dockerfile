FROM trenpixster/elixir:1.2.0

ENV PORT 80
EXPOSE $PORT

# Install Elixir Deps
ADD mix.* ./
ENV MIX_ENV prod
RUN mix local.rebar
RUN mix local.hex --force
RUN mix deps.get
RUN mix compile
RUN mix escript.build

run mkdir /app
workdir /app
COPY helloworld /app

expose 80
ENTRYPOINT ["/app/helloworld"]
