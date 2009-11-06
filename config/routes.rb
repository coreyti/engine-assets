ActionController::Routing::Routes.draw do |map|
  # map.images      'images/:action.:format',      :controller => 'engine_assets/images'
  map.javascripts 'javascripts/:action.:format', :controller => 'engine_assets/javascripts'
  map.stylesheets 'stylesheets/:action.:format', :controller => 'engine_assets/stylesheets'
end
