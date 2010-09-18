ActionController::Routing::Routes.draw do |map|
  [:javascripts, :stylesheets].each do |type|
    map.send(type, "#{type}/:path.:format", {
      :controller => "engine_assets/#{type}",
      :action     => :show,
      :path       => /[A-Za-z0-9\/._-]+?/ # e.g., javascripts/path/file.js
    })
  end
end

# TODO: consider the following for Rails 3 (the abover works for now):
# Rails.application.routes.draw do |map|
#   [:javascripts, :stylesheets].each do |type|
#     match "#{type}/:path" => "engine_assets/#{type}#show",
#       :as          => type,
#       :constraints => {
#         :path   => /[A-Za-z0-9\/._-]+\.(css|js)$/
#       }
#   end
# end
