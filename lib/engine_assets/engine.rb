require 'rails' unless defined?(Rails)

class EngineAssets::Engine < Rails::Engine
  def initialize(*args)
    super(*args)

    EngineAssets::PublicLocator.paths.each do |path|
      Rails.configuration.middleware.use ::ActionDispatch::Static, path
    end
  end
end
