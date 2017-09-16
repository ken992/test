dir = Dir::pwd

########################################
# Gemfile
########################################
gem 'better_errors'
gem 'binding_of_caller'
#gem 'byebug'

application <<-APPEND
  config.active_record.default_timezone = :local
  config.time_zone = 'Tokyo'
  config.i18n.default_locale = :ja
APPEND

#inside('config/locales') do
#  run "curl https://raw.githubusercontent.com/svenfuchs/rails-i18n/master/rails/locale/ja.yml > ja.yml"
#end
