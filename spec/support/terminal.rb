require 'fileutils'

module Support
  class Terminal
    attr_reader :output, :status, :result
    attr_accessor :environment_variables

    def initialize
      @cwd    = FileUtils.pwd
      @output = ""
      @result = ""
      @status = 0

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
        result  = `#{cmdline}`

        output << result
        @result = clean(result)
      end

      @status = $?
    end

    def clean(content)
      content.split("\n").reject { |line| line.match('deprecated') }.join("\n")
    end


    private

    def environment_settings
      @environment_variables.map { |key, value| "#{key}=#{value}" }.join(' ')
    end

    def gem_bin_path
      File.join(LOCAL_GEM_ROOT, "bin")
    end
  end
end
