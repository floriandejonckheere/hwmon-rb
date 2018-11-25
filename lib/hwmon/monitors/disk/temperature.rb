# frozen_string_literal: true

module HWMon
  module Monitors
    module Disk
      class Temperature < ApplicationMonitor
        def call
          {
            :disk0 => temp('sda') || -1,
            :disk1 => temp('sdb') || -1
          }
        end

        protected

        def temp(drive)
          match = `smartctl -a /dev/#{drive}`.match /Temperatu.* (?<temp>[0-9]*) \(Min\/Max .*\)$/

          match['temp'] if match
        end
      end
    end
  end
end
