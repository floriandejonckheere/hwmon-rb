# frozen_string_literal: true

module HWMon
  module Monitors
    class ACPI < ApplicationMonitor
      def call
        match = `sensors`.scan /(?<sensor>[^:\n]*): *\+(?<temp>[^°\n]*)°C/

        {
          :temp => match.find { |k,v| k == 'temp1' }.last.to_f,
        }
      end
    end
  end
end
