module EngineAssets
  class << self
    def version
      IO.read(File.join(File.dirname(__FILE__), '..', 'VERSION')).strip
    end
  end
end

require 'engine_assets/public_locator'
require 'engine_assets/extensions/rails/assets'
