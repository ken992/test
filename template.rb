dir = Dir::pwd

########################################
# Gemfile
########################################
gem 'better_errors'
gem 'binding_of_caller'
#gem 'byebug'

#IDE Rubymine
gem 'ruby-debug-ide'
gem 'debase'

gem 'bcrypt'

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

remove_file '.gitignore'
create_file '.gitignore' do
  body = <<EOS
*.rbc
capybara-*.html
.rspec
/log
/tmp
/db/*.sqlite3
/db/*.sqlite3-journal
/public/system
/coverage/
/spec/tmp
*.orig
rerun.txt
pickle-email-*.html

# TODO Comment out this rule if you are OK with secrets being uploaded to the repo
config/initializers/secret_token.rb

# Only include if you have production secrets in this file, which is no longer a Rails default
# config/secrets.yml

# dotenv
# TODO Comment out this rule if environment variables can be committed
.env

## Environment normalization:
/.bundle
/vendor/bundle

# these should all be checked in to normalize the environment:
# Gemfile.lock, .ruby-version, .ruby-gemset

# unless supporting rvm < 1.11.0 or doing something fancy, ignore this:
.rvmrc

# if using bower-rails ignore default bower_components path bower.json files
/vendor/assets/bower_components
*.bowerrc
bower.json

# Ignore pow environment settings
.powenv

# Ignore Byebug command history file.
.byebug_history

# Ignore Spring files.
/spring/*.pid

/.idea
EOS
end

