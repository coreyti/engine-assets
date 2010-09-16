# module ActionView::Helpers::AssetTagHelper
#   def expand_javascript_sources_with_engine_assets(sources, recursive = false)
#     if sources.include?(:all)
#       result = (determine_source(:defaults, @@javascript_expansions).dup | expand_javascript_sources_without_engine_assets(sources, recursive))
#       result.map! { |entry| entry =~ /\.js$/ ? entry : "#{entry}.js" }
#       return result.uniq
#     else
#       raise NotImplementedError
#     end
#   end
#   alias_method_chain :expand_javascript_sources, :engine_assets
# 
#   def asset_file_path_with_engine_assets(path)
#     primary = asset_file_path_without_engine_assets(path)
#     return primary if File.exist?(primary)
# 
#     EngineAssets::PublicLocator.locate(path)
#   end
#   alias_method_chain :asset_file_path, :engine_assets
# end
