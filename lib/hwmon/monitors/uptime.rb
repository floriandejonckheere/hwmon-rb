# frozen_string_literal: true

module HWMon
  module Monitors
    class Uptime < ApplicationMonitor
      def call
        match = `cat /proc/loadavg`.match /^(?<load_avg1>[0-9\.]*) (?<load_avg5>[0-9\.]*) (?<load_avg10>[0-9\.]*) (?<proc_used>[0-9]*)\/(?<proc_total>[0-9]*) (?<last_pid>[0-9\.]*)\n$/
        {
          :load_avg1 => match['load_avg1'],
          :load_avg5 => match['load_avg5'],
          :load_avg10 => match['load_avg10'],
          :proc_used => match['proc_used'],
          :proc_total => match['proc_total'],
        }
      end
    end
  end
end
