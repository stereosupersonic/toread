# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
#
# https://github.com/javan/whenever
#
set :output, "/var/log/cron.log"

ENV.each { |k, v| env(k, v) }

every 5.minutes do
  rake "internet_speed:run"
end
