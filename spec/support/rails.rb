module Support
  class Rails
    attr_reader :terminal, :version

    def initialize(version)
      @terminal   = Terminal.new
      @version    = version
    end

    def build
      # remove pre-existing
      FileUtils.rm_rf WEBAPP_ROOT

      create_command = rails3? ? 'new' : ''
      load_command   = "gem 'rails', '#{version}'; load Gem.bin_path('rails', 'rails', '#{version}')"

      terminal.cd(TEMP_DIR)
      terminal.run(%{ruby -rubygems -e "#{load_command}" #{create_command} rails_root})
    end

    def setup
      require File.join(WEBAPP_ROOT, 'config', 'environment')
    end


    private

    def rails3?
      version =~ /^3/
    end
  end
end
