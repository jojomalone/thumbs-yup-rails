require 'thumbs_yup_rails/version'
require 'thumbs_yup_rails/configuration'
require 'thumbs_yup_rails/server_embed'

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

require 'thumbs_yup_rails/railtie' if defined?(Rails)
