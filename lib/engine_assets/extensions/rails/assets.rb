module ActionView::Helpers::AssetTagHelper
  def expand_javascript_sources(sources, recursive = false)
    if sources.include?(:all)
      all_javascript_files = collect_asset_files(JAVASCRIPTS_DIR, ('**' if recursive), '*.js')
      result = ((determine_source(:defaults, @@javascript_expansions).dup) + all_javascript_files).uniq
      result
    else
      expanded_sources = sources.collect do |source|
        determine_source(source, @@javascript_expansions)
      end.flatten
      expanded_sources << "application" if sources.include?(:defaults) && File.exist?(File.join(JAVASCRIPTS_DIR, "application.js"))
      expanded_sources
    end
  end
end
