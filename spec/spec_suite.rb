class SpecSuite
  def files
    Dir["#{dir}/../spec/**/*_spec.rb"]
  end

  def run
    $LOAD_PATH.unshift(File.join(dir, '..'))
    $LOAD_PATH.unshift(File.join(dir, '..', 'lib'))

    ARGV.concat ["--options", "#{dir}/spec.opts"]

    files.each do |file|
      require file
    end
    result = ::Spec::Runner::CommandLine.run
    exit result
  end

  def dir
    @dir ||= File.dirname(__FILE__)
  end
end

if $0 == __FILE__
  SpecSuite.new.run
end
