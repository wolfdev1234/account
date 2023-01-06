# frozen_string_literal: true

Sidekiq.configure_server do |config|
  config.redis = { url: Settings.redis.sidekiq.uri, size: 15 }
  config.log_formatter = Sidekiq::Logger::Formatters::JSON.new
end

Sidekiq.configure_client do |config|
  config.redis = { url: Settings.redis.sidekiq.uri, size: 2 }
end
