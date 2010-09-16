require 'fileutils'

Before do
  @terminal = Terminal.new
end

class Terminal
  attr_reader :output, :status, :result
  attr_accessor :environment_variables

  def initialize
    @cwd = FileUtils.pwd
    @output = ""
    @result = ""
    @status = 0
    @logger = Logger.new(File.join(TEMP_DIR, 'terminal.log'))

    @environment_variables = {
      "GEM_HOME" => LOCAL_GEM_ROOT,
      "GEM_PATH" => "#{LOCAL_GEM_ROOT}:#{BUILT_GEM_ROOT}",
      "PATH"     => "#{gem_bin_path}:#{ENV['PATH']}"
    }
  end

  def cd(directory)
    @cwd = directory
  end

  def run(command)
    output << "#{command}\n"

    FileUtils.cd(@cwd) do
      cmdline = "#{environment_settings} #{command} 2>&1"
      logger.debug(cmdline)
      result = `#{cmdline}`
      logger.debug(result)
      output << result
      @result = clean(result)
    end

    @status = $?
  end

  def clean(content)
    content.split("\n").reject { |line| line.match('deprecated') }.join("\n")
  end

  def echo(string)
    logger.debug(string)
  end

  def build_and_install(gemspec)
    pkg_dir = File.join(TEMP_DIR, 'pkg')
    FileUtils.mkdir_p(pkg_dir)

    output = `gem build #{gemspec} 2>&1`
    gem_file = Dir.glob("*.gem").first
    unless gem_file
      raise "Gem didn't build:\n#{output}"
    end

    target = File.join(pkg_dir, gem_file)
    FileUtils.mv(gem_file, target)
    install_to(BUILT_GEM_ROOT, target)
  end

  private

  def install_to(root, gem)
    `gem install -i #{root} --no-ri --no-rdoc #{gem}`
  end

  def environment_settings
    @environment_variables.map { |key, value| "#{key}=#{value}" }.join(' ')
  end

  def gem_bin_path
    File.join(LOCAL_GEM_ROOT, "bin")
  end

  attr_reader :logger
end
