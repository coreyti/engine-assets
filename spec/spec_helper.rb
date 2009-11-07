RAILS_PATH = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'vanilla'))

dir = File.dirname(__FILE__)
$LOAD_PATH.unshift(dir)

ENV["RAILS_ENV"] = "test"

require "#{File.join(RAILS_PATH, 'config', 'environment')}"
require 'engine-assets'
require 'spec'
require 'spec/autorun'
require 'spec/rails'
require 'support/helpers/fixture_helper'
require 'support/helpers/textmate_helper'
require 'support/shared/assets_controller_spec'
require 'support/shared/assets_routing_spec'

Spec::Runner.configure do |config|
  include Support::Helpers

  config.fixture_path = "#{File.dirname(__FILE__)}/../spec/support/fixtures"
  config.mock_with :rr
  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false

  # def add_fixture_views(controller_class)
  #   controller_class.prepend_view_path(File.join(basepath, '..', 'fixtures', 'app', 'views'))
  #   controller_class.prepend_view_path(File.join(basepath, '..', 'fixtures', 'public'))
  # end
  # 
  # def basepath
  #   @basepath ||= File.join(File.dirname(__FILE__), '..')
  # end
end
