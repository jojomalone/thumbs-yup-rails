puts "*************** Railtie 0.1"
require 'rails'
puts "*************** Railtie 0.2"

module ThumbsYupRails
  class Railtie < ::Rails::Railtie
puts "*************** Railtie 1"
    initializer "thumbs_yup_rails config" do |app|
#puts "*************** Railtie 2"
      #configure do |config|
puts "*************** Railtie 3"
        class ThumbsYupRails::Configuration; end
puts "*************** Railtie 4"
      #end
    end
  end
end
