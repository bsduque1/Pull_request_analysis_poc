import Config

config :pull_request_analysis_poc,
  timezone: "America/Bogota",
  env: :prod,
  http_port: 8080,
  enable_server: true,
  version: "0.0.1",
  custom_metrics_prefix_name: "pull_request_analysis_poc"

config :logger,
  level: :warning
