# frozen_string_literal: true

module HWMon
  class Config
    class << self
      # Array of monitors to execute
      def monitors
        %w[temperature fan]
      end

      # Time between executions in seconds
      def sleep_time
        1
      end

      # File to append results to
      def output
        File.join Dir.pwd, 'hwmon.csv'
      end
    end
  end
end
