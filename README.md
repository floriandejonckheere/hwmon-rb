# hwmon-rb

Small framework written in plain Ruby to periodically collect system information. Data collected includes CPU temperature, fan speed, disk temperature and load averages.
Not all monitors may not work on your system. Adjust `lib/hwmon/config.rb` for configuration parameters. Run `bin/hwmon` in the background to collect and periodically write data
to a YAML file. Use `bin/yml-to-csv` to convert this file into a CSV file, ready to use in spreadsheet or data processing software.
