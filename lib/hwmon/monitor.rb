# frozen_string_literal: true

require 'hwmon/config'
require 'hwmon/monitors'

module HWMon
  class Monitor
    def self.monitor!
      monitor = self.new

      loop do
        monitor.execute
        sleep HWMon::Config.sleep_time
      end
    end

    def execute
      monitors.each do |monitor|
        result = monitor.call

        puts "#{monitor.to_s}: #{result}"
      end
    end

    def monitors
      return @monitors if @monitors

      @monitors = []

      HWMon::Config.monitors.each do |monitor|
        @monitors << HWMon::Monitors.const_get(monitor.capitalize)
      end

      @monitors
    end
  end
end
