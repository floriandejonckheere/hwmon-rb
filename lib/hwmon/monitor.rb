# frozen_string_literal: true

require 'yaml'

require 'hwmon/config'
require 'hwmon/monitors'

module HWMon
  class Monitor
    def self.monitor!
      new.execute
    end

    def initialize
      # Buffer of entries to write to disk
      @entry_buffer = []

      # Time of last write to disk
      @last_write = Time.now.to_i
    end

    def execute
      loop do
        entry = {}

        HWMon::Config.monitors.each { |monitor| entry.merge! monitor.call }

        # Add timestamp
        entry.merge! :timestamp => Time.now.to_i

        write entry

        sleep HWMon::Config.sleep_time
      end
    end

    protected

    # Soft write result entry
    def write(entry)
      @entry_buffer << entry

      # Write buffer to disk every 10 entries or 300 seconds
      if @entry_buffer.length > 10 || (Time.now.to_i - @last_write) > 300
        # Write buffer
        write_buffer

        # Clear buffer
        @entry_buffer = []
        @last_write = Time.now.to_i
      end
    end

    # Hard write entry buffer
    def write_buffer
      if File.exist? HWMon::Config.output
        entries = YAML.load_file HWMon::Config.output
      else
        entries = []
      end

      entries.concat @entry_buffer

      File.open(HWMon::Config.output, 'w') { |f| f.write entries.to_yaml }
    end
  end
end
