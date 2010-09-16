require 'uri'

module RailsHelpers
  def rails_root_exists?
    File.exists?(environment_path)
  end

  def rails3?
    rails_version =~ /^3/
  end

  def rails_uses_rack?
    rails3? || rails_version =~ /^2\.3/
  end

  def rails_version
    @rails_version ||= begin
      if bundler_manages_gems?
        rails_version = open(gemfile_path).read.match(/gem.*rails["'].*["'](.+)["']/)[1]
      else
        environment_file = File.join(RAILS_ROOT, 'config', 'environment.rb')
        rails_version = `grep RAILS_GEM_VERSION #{environment_file}`.match(/[\d.]+/)[0]
      end
    end
  end

  def bundler_manages_gems?
    File.exists?(gemfile_path)
  end

  def gemfile_path
    gemfile = File.join(RAILS_ROOT, 'Gemfile')
  end

  def rails_manages_gems?
    rails_version =~ /^2\.[123]/
  end

  def environment_path
    File.join(RAILS_ROOT, 'config', 'environment.rb')
  end

  def bundle_gem(gem_name)
    File.open(gemfile_path, 'a') do |file|
      file.puts("gem '#{gem_name}'")
    end
  end

  def config_gem(gem_name)
    run = "Rails::Initializer.run do |config|"
    insert = "  config.gem '#{gem_name}'"
    content = File.read(environment_path)
    if content.sub!(run, "#{run}\n#{insert}")
      File.open(environment_path, 'wb') { |file| file.write(content) }
    else
      raise "Couldn't find #{run.inspect} in #{environment_path}"
    end
  end

  def perform_request(uri, environment = 'production')
    # NOTE (CTI):
    # modified from thoughtbot's original to return headers and status.
    if rails3?
      request_script = <<-SCRIPT
        require 'config/environment'

        env = Rack::MockRequest.env_for(#{uri.inspect})
        status, headers, body = RailsRoot::Application.call(env)

        response = {
          :body    => body.is_a?(Array) ? body.join : body.body,
          :headers => headers,
          :status  => status
        }

        puts response.to_json
      SCRIPT
      File.open(File.join(RAILS_ROOT, 'request.rb'), 'w') { |file| file.write(request_script) }
      @terminal.cd(RAILS_ROOT)
      @terminal.run("./script/rails runner -e #{environment} request.rb")
    elsif rails_uses_rack?
      request_script = <<-SCRIPT
        require 'config/environment'

        env = Rack::MockRequest.env_for(#{uri.inspect})
        app = Rack::Lint.new(ActionController::Dispatcher.new)

        status, headers, body = app.call(env)

        response = {
          :body    => "",
          :headers => headers,
          :status  => status
        }

        if body.respond_to?(:to_str)
          response[:body] << body
        else
          body.each { |part| response[:body] << part }
        end

        puts response.to_json
      SCRIPT
      File.open(File.join(RAILS_ROOT, 'request.rb'), 'w') { |file| file.write(request_script) }
      @terminal.cd(RAILS_ROOT)
      @terminal.run("./script/runner -e #{environment} request.rb")
    else
      raise "Rails versions earlier than 2.3 are not supported"
    end
  end
end

World(RailsHelpers)
