module ThumbsYupRails
  class Railtie < ::Rails::Railtie
    config.before_configuration do
      Configuration.configure
    end
  end
end
