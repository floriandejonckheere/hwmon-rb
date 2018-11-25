# frozen_string_literal: true

module HWMon
  module Monitors
    class ApplicationMonitor
      def self.call(*args, &block)
        new.call(*args, &block)
      end
    end
  end
end
