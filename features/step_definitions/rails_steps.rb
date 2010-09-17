Given /^I have built and installed the "([^"]*)" gem$/ do |gem_name|
  @terminal.build_and_install(File.join(PROJECT_ROOT, "#{gem_name}.gemspec"))
end

When /^I generate a new Rails application$/ do
  @terminal.cd(TEMP_DIR)

  version = ENV['RAILS_VERSION']
  rails3  = version =~ /^3/

  if rails3
    rails_create_command = 'new'
  else
    rails_create_command = ''
  end

  load_rails = <<-RUBY
    gem 'rails', '#{version}'; \
    load Gem.bin_path('rails', 'rails', '#{version}')
  RUBY

  @terminal.run(%{ruby -rubygems -e "#{load_rails.strip!}" #{rails_create_command} rails_root})

  if rails_root_exists?
    @terminal.echo("Generated a Rails #{version} application")
  else
    raise "Unable to generate a Rails application:\n#{@terminal.output}"
  end
end

When /^I configure my application to require the "([^"]*)" gem$/ do |gem_name|
  if rails_manages_gems?
    config_gem(gem_name)
  elsif bundler_manages_gems?
    bundle_gem(gem_name)
  else
    File.open(environment_path, 'a') do |file|
      file.puts
      file.puts("require 'example-engine'")
      file.puts("require 'example-engine/rails'") # ???
    end

    # unless rails_finds_generators_in_gems?
    #   FileUtils.cp_r(File.join(PROJECT_ROOT, 'generators'), File.join(RAILS_ROOT, 'lib'))
    # end
  end
end

When /^I configure my application to run in the "([^"]*)" environment$/ do |environment|
  @rails_environment = environment
end

When /^I check the configured gem version$/ do
  version = ENV['RAILS_VERSION']
  rails3  = version =~ /^3/

  if rails3
    command = 'rails runner'
  else
    command = 'script/runner'
  end

  @terminal.cd(RAILS_ROOT)
  @terminal.run(%Q{#{command} 'puts "Current version: #\{EngineAssets.version\}"'})
end

When /^I generate a new "([^"]*)" ([^\s]*)$/ do |name, generator|
  rails_generate("#{generator} #{name}")
end

When /^I save the following as "([^\"]*)"$/ do |path, string|
  FileUtils.mkdir_p(File.join(RAILS_ROOT, File.dirname(path)))
  File.open(File.join(RAILS_ROOT, path), 'w') { |file| file.write(string) }
end

When /^I perform a request to "([^\"]*)"$/ do |uri|
  perform_request(uri)
end

Then /^I should receive a response matching the following:$/ do |table|
  hash   = table.transpose.hashes.first
  result = JSON.parse(@terminal.result)

  if hash['200']
    result['status'].should == 200
    result['body']  .should =~ /#{hash['200']}/
  else
    raise "Don't know how to handle #{hash.inspect}"
  end
end

Then /^I should see "([^\"]*)"$/ do |expected_text|
  unless @terminal.output.include?(expected_text)
    raise("Got terminal output:\n#{@terminal.output}\n\nExpected output:\n#{expected_text}")
  end
end

Then /^the command should have run successfully$/ do
  @terminal.status.exitstatus.should == 0
end
