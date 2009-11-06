class SpecSuite
  def files
    dir = File.dirname(__FILE__)
    Dir["#{dir}/../spec/**/*_spec.rb"]
  end

  def run
    basedir = File.join(File.dirname(__FILE__), '..')
    libdir  = File.join(basedir, 'lib')
    specdir = File.join(basedir, 'spec')

    $LOAD_PATH.unshift(basedir)
    $LOAD_PATH.unshift(libdir)
    $LOAD_PATH.unshift(specdir)

    ARGV.concat ["--options", "#{specdir}/spec.opts"]

    files.each do |file|
      require file
    end
    result = ::Spec::Runner::CommandLine.run
    exit result
  end
end

if $0 == __FILE__
  SpecSuite.new.run
end
