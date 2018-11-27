# frozen_string_literal: true

module HWMon
  module Monitors
    class Uptime < ApplicationMonitor
      def call
        match = `cat /proc/loadavg`.match /^(?<load_avg1>[0-9\.]*) (?<load_avg5>[0-9\.]*) (?<load_avg10>[0-9\.]*) (?<proc_used>[0-9]*)\/(?<proc_total>[0-9]*) (?<last_pid>[0-9\.]*)\n$/
        {
          :load_avg1 => match['load_avg1'].to_f,
          :load_avg5 => match['load_avg5'].to_f,
          :load_avg10 => match['load_avg10'].to_f,
          :proc_used => match['proc_used'].to_i,
          :proc_total => match['proc_total'].to_i,
        }
      end
    end
  end
end
