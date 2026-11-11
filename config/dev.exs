import Config

config :pull_request_analysis_poc,
  timezone: "America/Bogota",
  env: :dev,
  http_port: 8083,
  enable_server: true,
  version: "0.0.1",
  custom_metrics_prefix_name: "pull_request_analysis_poc_local"

config :logger,
  level: :debug
