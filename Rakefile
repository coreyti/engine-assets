# encoding: utf-8
require 'rubygems'
require 'bundler'
require 'rake'


desc 'Default: run all specs and features'
task :default => ['spec:rails:all', 'cucumber:rails:all']


# shared
# ----------------------------------------------------------------------------
GEM_ROOT        = File.dirname(__FILE__).freeze
LOCAL_GEM_ROOT  = File.join(GEM_ROOT, 'tmp', 'local_gems').freeze
RAILS_VERSIONS  = IO.read('RAILS_VERSIONS').strip.split("\n")
RSPEC_1_VERSION = '1.3.0'
RSPEC_2_VERSION = '2.0.0.beta.22'
LOCAL_GEMS      = [
  ['builder',      nil],
  ['bundler',      nil],
  ['rake',         nil],
  ['rspec',        RSPEC_1_VERSION],
  ['rspec-rails',  '1.3.2'],
  ['rspec',        RSPEC_2_VERSION],
  ['rspec-rails',  RSPEC_2_VERSION],
  ['sqlite3-ruby', nil]
] + RAILS_VERSIONS.collect { |version| ['rails', version] }

def banner
  puts '-' * 80
  puts yield.gsub(/^[ ]+/, '')
  puts '-' * 80
end

def print_missing(pkg_name, gem_name)
  banner {
    <<-DOC
    #{pkg_name} (or a dependency) not available.
    Install it with one of:
    \t* bundle install
    \t* sudo gem install #{gem_name}
    DOC
  }
end

namespace :shared do
  task :vendor_dependencies do
    old_gem_path    = ENV['GEM_PATH']
    old_gem_home    = ENV['GEM_HOME']
    ENV['GEM_PATH'] = LOCAL_GEM_ROOT
    ENV['GEM_HOME'] = LOCAL_GEM_ROOT

    LOCAL_GEMS.each do |gem_name, version|
      gem_file_pattern = [gem_name, version || '*'].compact.join('-')
      version_option = version ? "-v #{version}" : ''
      pattern = File.join(LOCAL_GEM_ROOT, 'gems', "#{gem_file_pattern}")
      existing = Dir.glob(pattern).first

      unless existing
        command = "gem install -i #{LOCAL_GEM_ROOT} --no-ri --no-rdoc --backtrace #{version_option} #{gem_name}"
        puts "Vendoring #{gem_file_pattern}..."

        unless system("#{command} 2>&1")
          puts "Command failed: #{command}"
          exit(1)
        end
      end
    end

    ENV['GEM_PATH'] = old_gem_path
    ENV['GEM_HOME'] = old_gem_home
  end
end


# cucumber tasks
# ----------------------------------------------------------------------------
begin
  require 'term/ansicolor'
  require 'cucumber/rake/task'

  # Thanks thoughtbot...
  def define_cucumber_rails(options = '')
    namespace :rails do
      RAILS_VERSIONS.each do |version|
        desc "Run features for this gem with Rails #{version}"
        task version => [:gemspec, 'shared:vendor_dependencies'] do
          banner {
            "Testing Rails #{version}"
          }
          ENV['RAILS_VERSION'] = version
          puts "running cucumber"
          system("cucumber --format #{cucumber_format} #{options} features/rails.feature")
        end
      end

      desc "Run features for this gem with all Rails versions"
      task :all => RAILS_VERSIONS
    end
  end

  def cucumber_format
    ENV['CUCUMBER_FORMAT'] || 'progress'
  end

  namespace :cucumber do
    define_cucumber_rails

    namespace :wip do
      define_cucumber_rails('--tags @wip')
    end
  end
rescue LoadError
  print_missing('Cucumber', 'cucumber')
end


# jeweler tasks
# ----------------------------------------------------------------------------
begin
  require 'jeweler'

  Jeweler::Tasks.new do |gem|
    gem.name        = "engine-assets"
    gem.summary     = "Rails Engines with assets."
    gem.description = "A Rails Engine, which enables Rails Engines to " +
                      "provide assets (javascript, css and images)"
    gem.email       = "support@coolerator.net"
    gem.homepage    = "http://github.com/coreyti/engine-assets"
    gem.authors     = ["Corey Innis"]

    gem.add_bundler_dependencies
    gem.files << 'INSTALL'
    gem.files << 'LICENSE'
    gem.files << 'README'
    gem.files << 'VERSION'
    gem.files << 'init.rb'
    gem.files << 'install.rb'
    gem.files += Dir['app/**/*.rb']
    gem.files += Dir['config/**/*.rb']
    gem.files += Dir['lib/**/*.rb']
  end
rescue LoadError
  print_missing('Jeweler', 'jeweler')
end


# rdoc tasks
# ----------------------------------------------------------------------------
begin
  require 'rake/rdoctask'

  Rake::RDocTask.new do |rdoc|
    version = File.exist?('VERSION') ? File.read('VERSION') : ""

    rdoc.rdoc_dir = 'rdoc'
    rdoc.title = "example-engine #{version}"
    rdoc.rdoc_files.include('README*')
    rdoc.rdoc_files.include('lib/**/*.rb')
  end
rescue LoadError
  print_missing('RDoc', 'rdoc')
end


# rspec tasks
# ----------------------------------------------------------------------------
def define_spec_rails
  def spec_rails_2
    $:.unshift("#{LOCAL_GEM_ROOT}/gems/rspec-#{RSPEC_1_VERSION}/lib")

    require 'spec/rake/spectask'

    Spec::Rake::SpecTask.new(:spec) do |task|
      task.libs << 'lib' << 'spec'
      task.spec_files = FileList['spec/**/*_spec.rb']
    end
  end

  def spec_rails_3
    $:.unshift("#{LOCAL_GEM_ROOT}/gems/rspec-core-#{RSPEC_2_VERSION}/lib")

    require 'rspec/core/rake_task'

    RSpec::Core::RakeTask.new(:spec) do |task|
      task.pattern = "spec/**/*_spec.rb"
    end
  end

  namespace :rails do
    RAILS_VERSIONS.each do |version|
      desc "Run specs for this gem with Rails #{version}"
      task version => [:gemspec, 'shared:vendor_dependencies'] do
        banner {
          "Running specs against Rails #{version}"
        }

        major = version.split('.')[0]

        # Thanks acts-as-taggable-on
        gemfile = File.join(GEM_ROOT, 'spec', 'support', "Gemfile-#{version}")
        ENV['RAILS_VERSION']      = version
        ENV['BUNDLE_GEMFILE']     = gemfile
        ENV['RAILS_VERSION_SPEC'] = 'true'

        send("spec_rails_#{major}")

        Rake::Task['spec'].execute # NOTE: #invoke only runs once
      end
    end

    desc "Run specs for this gem with all Rails versions"
    task :all => RAILS_VERSIONS
  end
end

namespace :spec do
  define_spec_rails

  task :check_mode do
    unless ENV['RAILS_VERSION_SPEC']
      bullet = "\t* "
      valid  = Rake.application.tasks.select { |t| t.name =~ /spec:rails/ }

      banner {
        <<-DOC
        Please use one of the following Rails-versioned spec tasks:
        #{bullet}#{valid.join("\n" + bullet)}
        DOC
      }
      raise RuntimeError
    end
  end
end

task :spec => 'spec:check_mode'
