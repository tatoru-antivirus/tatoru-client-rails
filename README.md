# Tatoru Anti Virus Client for Rails

A simple rails integratino for the tatoru client (remote anti virus scanning with tatoru.io).

## Usage

### Installation

Add tatoru_client to your:

    # Gemfile
    gem 'tatoru_client-rails'

Install your bundle:

    > bundle install

### Setup

Use the generator to create the configuration file (config/initalizers/tatoru_client.rb):

    > rails g tatoru:client:install

Edit the configuration file to add your api token. If you don't have and api token, go to https://www.tatoru.io and sign up to get your token.

    # config/initializers/tatoru_client.rb
    Tatoru::Client.configure do |config|
      config.api_token = "<your-api-token>"
    end

As an alternative you can leave the configuration file as is and set your api token via environemnt variable:

    TATORU_ANTIVIRUS_API_KEY=<your-api-token> rails c

At this point you can check the status of your configuration.

When correctly configured you should get a success message:

    > rake tatoru_client:status
      => authorized: true

Otherwise, if authentication fails, you will get a corresponding failure message:

    > authorized: false
      => The client could not authorize. Please make you have configured your api token in config/initializers/tatoru_client.rb

### ActiveRecord/ActiveModel

You can scan files by using the TatoruValidator:

    class User < ActiveRecord::Base
      has_one_attached :profile_picture
      validates :profile_picture, tatoru: true
    end

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
