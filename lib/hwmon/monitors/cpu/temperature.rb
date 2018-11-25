# frozen_string_literal: true

module HWMon
  module Monitors
    module CPU
      class Temperature < ApplicationMonitor
        def call
          match = `sensors`.scan /(?<sensor>[^:\n]*): *\+(?<temp>[^°\n]*)°C/

          {
            :cpu => match.find { |k,v| k == 'Package id 0' }.last,
            :core0 => match.find { |k,v| k == 'Core 0' }.last,
            :core1 => match.find { |k,v| k == 'Core 1' }.last,
            :core2 => match.find { |k,v| k == 'Core 2' }.last,
            :core3 => match.find { |k,v| k == 'Core 3' }.last
          }
        end
      end
    end
  end
end
