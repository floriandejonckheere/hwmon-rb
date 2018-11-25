# frozen_string_literal: true

module HWMon
  module Monitors
    class ApplicationMonitor
      def self.call(*args, &block)
        new.call(*args, &block)
      end

      # Define result fields
      def self.fields
        %i[]
      end
    end
  end
end
