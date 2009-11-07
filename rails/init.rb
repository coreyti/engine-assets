dir = File.dirname(__FILE__)
$LOAD_PATH.unshift(File.join(dir, '..', 'app'))

require 'engine-assets'
require 'controllers/engine_assets/assets_controller'
require 'controllers/engine_assets/javascripts_controller'
require 'controllers/engine_assets/stylesheets_controller'

class Rails::Plugin
  class Loader
    def register_plugin_as_loaded_with_engine_assets(plugin)
      register_plugin_as_loaded_without_engine_assets(plugin)

      if(plugin.engine? && File.exist?(public_dir = File.join(plugin.directory, 'public')))
        EngineAssets::PublicLocator.paths << public_dir
      end
    end
    alias_method_chain :register_plugin_as_loaded, :engine_assets
  end
end
