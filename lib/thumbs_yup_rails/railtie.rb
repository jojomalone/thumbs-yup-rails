require 'rails'

module ThumbsYupRails
  class Railtie < ::Rails::Railtie
    initializer "thumbs_yup_rails config" do |app|
      configure do |config|
        class Configuration::ThumbsYupRails; end
        app.config.middleware.insert_before "ThumbsYupRails::Middleware"
      end
    end
  end
end
