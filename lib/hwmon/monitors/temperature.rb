# frozen_string_literal: true

module HWMon
  module Monitors
    class Temperature < ApplicationMonitor
      def call
        {
          :cpu => 0,
          :core0 => 0,
          :core1 => 0,
          :core2 => 0,
          :core3 => 0
        }
      end
    end
  end
end
