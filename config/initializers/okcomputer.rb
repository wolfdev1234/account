# frozen_string_literal: true

# Mounts in routes.rb
OkComputer.mount_at = false

OkComputer::Registry.register(
  'version',
  HealthChecks::VersionCheck.new
)

OkComputer::Registry.register(
  'symphony',
  HealthChecks::SymphonyCheck.new
)

OkComputer::Registry.register(
  'redis',
  OkComputer::RedisCheck.new(url: Settings.redis.database.uri)
)

# Optional Checks will report failures, but still return 200
# this will keep a pod from restarting when optional checks are failing
OkComputer.make_optional %w(redis version symphony)
