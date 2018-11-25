# frozen_string_literal: true

module HWMon
  module Monitors
    module Disk
      class Temperature < ApplicationMonitor
        def call
          {
            :disk0 => parse_temp('sda')['temp'] || -1,
            :disk1 => parse_temp('sdb')['temp'] || -1
          }
        end

        protected

        def parse_temp(drive)
          `smartctl -a /dev/#{drive}`.match /Temperatu.* (?<temp>[0-9]*) \(Min\/Max .*\)$/
        end
      end
    end
  end
end
