engine-assets
==============================================================================

*Rails Engines with assets*

engine-assets is a Rails Engine which enables other Rails Engines to provide
assets:

  * javascript
  * css
  * images (TODO)


Requirements
------------------------------------------------------------------------------

  * Rails (see RAILS_VERSIONS file for supported versions)


Installation
------------------------------------------------------------------------------

  * TODO: basic gem installation.
  * TODO: bundler style.

Usage
------------------------------------------------------------------------------

  * TODO: write/find a related engine.
  * TODO: require/load engine-assets and related engine in your Rails app.
  * TODO: (optional) add Rails initializer (and use patched asset tag).


Customization
------------------------------------------------------------------------------

  * TODO: Rails initializer to selectively reference files.


TODO
------------------------------------------------------------------------------

  * Add spec/feature coverage for 'reloadable' controllers.
  * Add spec/feature coverage for gem-installed engine, rather than plugins.
  * Add spec/feature coverage for rails/init.rb making a difference.

        actionpack (3.0.0) lib/action_view/helpers/asset_tag_helper.rb:905:in `exist?'
        actionpack (3.0.0) lib/action_view/helpers/asset_tag_helper.rb:905:in `asset_file_path!'
        actionpack (3.0.0) lib/action_view/helpers/asset_tag_helper.rb:878:in `ensure_javascript_sources!'
        actionpack (3.0.0) lib/action_view/helpers/asset_tag_helper.rb:877:in `each'
        actionpack (3.0.0) lib/action_view/helpers/asset_tag_helper.rb:877:in `ensure_javascript_sources!'
        actionpack (3.0.0) lib/action_view/helpers/asset_tag_helper.rb:361:in `javascript_include_tag'
        app/views/layouts/application.html.erb:12:in `_app_views_layouts_application_html_erb___615183510_2191829220_0'


Contributors
------------------------------------------------------------------------------

  * Corey Innis <http://github.com/coreyti>  
    Author

Acknowledgments
------------------------------------------------------------------------------

  * thoughtbot <http://thoughtbot.com/>  
    For insight regarding techniques for running Cucumber features against
    multiple versions of Rails (in hoptoad_notifier).
  * Michael Bleigh <http://mbleigh.com>  
    For insight regarding techniques for running RSpec specs against multiple
    versions of Rails (in acts-as-taggable-on).
  * Jon Swope <http://jonswope.com>  
    For [his post](http://jonswope.com/2010/07/25/rails-3-engines-plugins-and-static-assets/ "Rails 3 Engines/Plugins and Static Assets")
    on serving static assets from Rails 3 Engines.

