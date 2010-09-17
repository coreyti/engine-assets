# TODO:
#   * find a mechanism to do this without monkey-patching Rails
#   * add an autoload option to load all from plugins, or similar
#   * allow engines to indicate (automatically when #register is called?)
#     which assets to include.

module ActionView::Helpers::AssetTagHelper
  def expand_javascript_sources_with_engine_assets(sources, recursive = false)
    if sources.include?(:all)
      result = (determine_source(:defaults, @@javascript_expansions).dup | expand_javascript_sources_without_engine_assets(sources, recursive))
      result.map! { |entry| entry =~ /\.js$/ ? entry : "#{entry}.js" }
      return result.uniq
    else
      raise NotImplementedError
    end
  end
  alias_method_chain :expand_javascript_sources, :engine_assets
end
