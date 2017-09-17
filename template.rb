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

#最新の翻訳ファイルを自動DL
inside('config/locales') do
  run "curl https://raw.githubusercontent.com/svenfuchs/rails-i18n/master/rails/locale/ja.yml > ja.yml"
end
#run "curl https://raw.githubusercontent.com/svenfuchs/rails-i18n/master/rails/locale/ja.yml > #{dir}/config/locales/ja.yml"

#複数のビューで使われるパーシャルの専用ディレクトリ
run "mkdir -p #{dir}/app/views/shared"
