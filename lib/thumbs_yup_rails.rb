#require 'thumbs_yup_rails/version'
require 'thumbs_yup_rails/configuration'
require 'thumbs_yup_rails/server_embed'
#require 'thumbs_yup_rails/railtie' if defined? ::Rails::Railtie

puts "*************** IN GEM"

#module ThumbsYupRails
  #class Configuration
  #end
#end

module ThumbsYupRails
  class << self
    def configure(&block)
      yield(configuration)
      configuration
    end

    def configuration
      @_configuration ||= Configuration.new
    end
  end
end
