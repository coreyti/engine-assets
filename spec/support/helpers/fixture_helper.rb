module Support
  module Helpers
    def load_view_fixtures(controller_class)
      controller_class.prepend_view_path(File.join(File.dirname(__FILE__), '..', 'fixtures', 'app', 'views'))
      EngineAssets::PublicLocator.register(File.join(File.dirname(__FILE__), '..', 'fixtures'))
    end
  end
end
