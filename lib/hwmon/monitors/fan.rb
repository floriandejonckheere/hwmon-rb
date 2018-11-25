# frozen_string_literal: true

module HWMon
  module Monitors
    class Fan < ApplicationMonitor
      def call
        `cat /sys/bus/platform/devices/thinkpad_hwmon/hwmon/hwmon1/fan1_input`
      end
    end
  end
end
