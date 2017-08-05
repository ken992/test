application <<-APPEND
  config.active_record.default_timezone = :local
  config.time_zone = 'Tokyo'
APPEND

gem 'better_errors'
gem 'binding_of_caller'
gem 'byebug'
