require 'rubygems'

unless defined?(PROJECT_ROOT)
  PROJECT_ROOT   = File.expand_path(File.join(File.dirname(__FILE__), '..')).freeze
  SPEC_DIR       = File.join(PROJECT_ROOT, 'spec').freeze
  TEMP_DIR       = File.join(PROJECT_ROOT, 'tmp').freeze
  BUILT_GEM_ROOT = File.join(TEMP_DIR, 'built_gems').freeze
  LOCAL_GEM_ROOT = File.join(TEMP_DIR, 'local_gems').freeze
  WEBAPP_ROOT    = File.join(TEMP_DIR, 'rails_root').freeze
end

Dir[File.join(SPEC_DIR, 'support', '**', '*.rb')].each { |f| require f }

unless @webapp
  ENV["RAILS_ENV"] ||= 'test'

  @webapp = Support::Rails.new(ENV['RAILS_VERSION'])
  @webapp.build
  @webapp.setup
end

require 'lib/engine-assets'
%w(app config).each do |dir|
  Dir[File.join(PROJECT_ROOT, dir, '**', '*.rb')].each { |f| require f }
end

Dir[File.join(SPEC_DIR, 'shared', '**', '*.rb')].each { |f| require f }

begin
  # RSpec 1.3 (Rails 2)
  require 'spec/rails'
  require 'spec/autorun'
  require 'rr'

  Spec::Runner.configure do |config|
    include Support::Helpers

    config.fixture_path = File.join(SPEC_DIR, 'support', 'fixtures')
    config.mock_with :rr
  end
rescue LoadError
  # RSpec 2.0 (Rails 3)
  require 'rspec'
  require 'rspec/rails'
  require 'rr'

  RSpec.configure do |config|
    include Support::Helpers

    # config.fixture_path = File.join(SPEC_DIR, 'support', 'fixtures')
    config.mock_framework = :rr
  end
end



# begin
#   # RSpec 1.3 (Rails 2)
#   require 'spec/rails'
#   require 'spec/autorun'
# rescue LoadError
#   # RSpec 2.0 (Rails 3)
#   require 'rspec'
#   require 'rspec/rails'
# end
# 
# Dir[File.join(SPEC_DIR, 'shared', '**', '*.rb')].each { |f| require f }
# 
# Spec::Runner.configure do |config|
#   include Support::Helpers
# 
#   config.fixture_path = File.join(SPEC_DIR, 'support', 'fixtures')
#   config.mock_with :rr
# end
