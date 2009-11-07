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
