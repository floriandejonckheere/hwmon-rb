# frozen_string_literal: true

module HWMon
  module Monitors
    module CPU
      class Temperature < ApplicationMonitor
        def call
          match = `sensors`.scan /(?<sensor>[^:\n]*): *\+(?<temp>[^°\n]*)°C/

          {
            :cpu => match.find { |k,v| k == 'Package id 0' }.last.to_f,
            :core0 => match.find { |k,v| k == 'Core 0' }.last.to_f,
            :core1 => match.find { |k,v| k == 'Core 1' }.last.to_f,
            :core2 => match.find { |k,v| k == 'Core 2' }.last.to_f,
            :core3 => match.find { |k,v| k == 'Core 3' }.last.to_f
          }
        end
      end
    end
  end
end
