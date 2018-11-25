# frozen_string_literal: true

require 'hwmon/config'
require 'hwmon/monitors'

module HWMon
  class Monitor
    def self.monitor!
      new.execute
    end

    def execute
      loop do
        entry = {}

        HWMon::Config.monitors.each { |monitor| entry.merge! monitor.call }

        write entry

        sleep HWMon::Config.sleep_time
      end
    end

    protected

    # Write result entry
    def write(entry)
      exists = File.exist? HWMon::Config.output

      result = entry.keys.sort.map { |k| entry[k] }.join(',')

      File.open(HWMon::Config.output, 'a') do |f|
        f.write "timestamp,#{entry.keys.sort.join(',')}\n" unless exists
        f.write "#{Time.now.to_i},#{result}\n"
      end
    end
  end
end
