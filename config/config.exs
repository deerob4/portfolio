import Config

config :esbuild,
  version: "0.19.9",
  default: [
    args:
      ~w(app.js --bundle --target=es2017 --outdir=../../out/assets --external:/fonts/* --external:/images/* --log-level=error),
    cd: Path.expand("../priv/scripts", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :phoenix_copy,
  default: [
    source: Path.expand("../priv/images/", __DIR__),
    destination: Path.expand("../out/assets/images", __DIR__),
    debounce: 100
  ]

config :tailwind,
  version: "3.2.7",
  default: [
    args: ~w(
    --config=../tailwind.config.js
    --input=styles/app.css
    --output=../out/assets/app.css
  ),
    cd: Path.expand("../priv", __DIR__)
  ]
