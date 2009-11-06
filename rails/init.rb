dir = File.dirname(__FILE__)
$LOAD_PATH.unshift(File.join(dir, '..', 'app'))

require 'engine-assets'
require 'controllers/engine_assets/assets_controller'
require 'controllers/engine_assets/javascripts_controller'
require 'controllers/engine_assets/stylesheets_controller'
