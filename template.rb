application <<-APPEND
  config.active_record.default_timezone = :local
  config.time_zone = 'Tokyo'
  config.i18n.default_locale = :ja
APPEND

gem 'better_errors'
gem 'binding_of_caller'
#gem 'byebug'
