module ActionView::Helpers::AssetTagHelper
  def expand_javascript_sources_with_engine_assets(sources, recursive = false)
    if sources.include?(:all)
      return (determine_source(:defaults, @@javascript_expansions).dup | expand_javascript_sources_without_engine_assets(sources, recursive))
    else
      raise NotImplementedError
    end
  end
  alias_method_chain :expand_javascript_sources, :engine_assets
end
