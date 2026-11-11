defmodule PullRequestAnalysisPoc.ApplicationTest do
  use ExUnit.Case
  doctest PullRequestAnalysisPoc.Application
  alias PullRequestAnalysisPoc.Config.{ConfigHolder, AppConfig}

  test "test childrens" do
    assert PullRequestAnalysisPoc.Application.env_children(:test, %AppConfig{}) == []
  end

  setup do
    if :ets.info(:pull_request_analysis_poc_config) == :undefined do
      :ets.new(:pull_request_analysis_poc_config, [:public, :named_table, read_concurrency: true])
    end

    :ets.delete_all_objects(:pull_request_analysis_poc_config)
    :ok
  end

  test "conf/0 returns the current config when it exists" do
    config = %AppConfig{env: :test, enable_server: true, http_port: 8083}

    :ets.insert(:pull_request_analysis_poc_config, {:config, config})

    assert ConfigHolder.conf() == config
  end

  test "get!/1 raises an error when the key does not exist" do
    :ets.delete_all_objects(:pull_request_analysis_poc_config)

    assert_raise RuntimeError, "Config with key :nonexistent_key not found", fn ->
      ConfigHolder.get!(:nonexistent_key)
    end
  end
end
