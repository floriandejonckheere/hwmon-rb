# frozen_string_literal: true

module HWMon
  class Config
    # Array of monitors to execute
    def self.monitors
      %w(temperature fan)
    end

    # Time between executions in seconds
    def self.sleep_time
      3
    end
  end
end
