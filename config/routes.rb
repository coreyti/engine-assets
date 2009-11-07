ActionController::Routing::Routes.draw do |map|
  [:javascripts, :stylesheets].each do |type|
    map.send(type, "#{type}/:path.:format", {
      :controller => "engine_assets/#{type}",
      :action     => :show,
      :path       => /[A-Za-z0-9\/._-]+?/   # e.g., path/to/file.ext
    })
  end
end
