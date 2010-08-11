unless defined?(RAILS_PATH)
  RAILS_PATH = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'vanilla'))

  dir = File.dirname(__FILE__)
  $LOAD_PATH.unshift(dir)

  def require_files(*segments)
    Dir[File.expand_path(File.join(*segments))].each { |file| require file }
  end

  ENV["RAILS_ENV"] = "test"

  require "#{File.join(RAILS_PATH, 'config', 'environment')}"
  require "#{File.join(File.dirname(__FILE__), '..', 'lib', 'engine-assets')}"
  require "#{File.join(File.dirname(__FILE__), '..', 'app', 'controllers', 'engine_assets', 'assets_controller.rb')}"
  require "#{File.join(File.dirname(__FILE__), '..', 'app', 'controllers', 'engine_assets', 'javascripts_controller.rb')}"
  require "#{File.join(File.dirname(__FILE__), '..', 'app', 'controllers', 'engine_assets', 'stylesheets_controller.rb')}"
  require 'spec/autorun'
  require 'spec/rails'

  require_files(dir, 'support', '**', '*.rb')

  Spec::Runner.configure do |config|
    include Support::Helpers

    config.fixture_path = "#{File.dirname(__FILE__)}/../spec/support/fixtures"
    config.mock_with :rr
    config.use_transactional_fixtures = true
    config.use_instantiated_fixtures  = false

    def basedir
      @basedir ||= "#{File.expand_path(File.join(File.dirname(__FILE__), '..'))}"
    end
  end
end
