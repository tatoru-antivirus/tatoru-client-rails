#!/bin/bash
DUMMY_APP_PATH="spec/dummy"

# Delete old dummy app
if [ -d "$DUMMY_APP_PATH" ]; then rm -rf $DUMMY_APP_PATH; fi


# Generate new dummy app
DUMMY_APP_PATH=$DUMMY_APP_PATH DISABLE_MIGRATE=true bundle exec rake dummy:app

if [ ! -d "$DUMMY_APP_PATH/config" ]; then exit 1; fi

rm $DUMMY_APP_PATH/.ruby-version
rm $DUMMY_APP_PATH/Gemfile

cd $DUMMY_APP_PATH

# Use correct Gemfile
sed -i "s|../Gemfile|../../../Gemfile|g" config/boot.rb

# Install simple form
# bundle exec rails generate simple_form:install

# Add webpacker
# sed -i "17irequire 'webpacker'" config/application.rb

# Raise unpermitted params in test and development environments
# echo "$(awk 'NR==4{print "  config.action_controller.action_on_unpermitted_parameters = :raise"}1' config/environments/development.rb)" > config/environments/development.rb
# echo "$(awk 'NR==10{print "  config.action_controller.action_on_unpermitted_parameters = :raise"}1' config/environments/test.rb)" > config/environments/test.rb

# I18n configuration
# touch config/initializers/i18n.rb
# echo "Rails.application.config.i18n.available_locales = [:en, :de]" >> config/initializers/i18n.rb
# echo "Rails.application.config.i18n.default_locale    = :de" >> config/initializers/i18n.rb

# I18n routing
# sed -i "17irequire 'route_translator'" config/application.rb

# touch config/initializers/route_translator.rb
# echo "RouteTranslator.config do |config|" >> config/initializers/route_translator.rb
# echo "  config.force_locale = true" >> config/initializers/route_translator.rb
# echo "end" >> config/initializers/route_translator.rb

# sed -i "2i  around_action :set_locale_from_url" app/controllers/application_controller.rb

# Add ActiveStorage
bundle exec rails active_storage:install

# Setup dummy app
bundle exec rails g model Post

cat <<EOT > app/models/post.rb
class Post < ActiveRecord::Base
  has_many_attached :assets

  validates :assets, tatoru: true
end
EOT

# Install
bundle exec rails generate tatoru:client:rails:install
bundle exec rails db:migrate
bundle exec rails db:test:prepare
