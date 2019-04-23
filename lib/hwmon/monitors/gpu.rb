# frozen_string_literal: true

module HWMon
  module Monitors
    class GPU < ApplicationMonitor
      def call
        {
          :temp => `nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader`.strip.to_i
        }
      end
    end
  end
end
