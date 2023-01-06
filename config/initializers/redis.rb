# frozen_string_literal: true

Redis.current = Redis.new url: Settings.redis.database.uri
