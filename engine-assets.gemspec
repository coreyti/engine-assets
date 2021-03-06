# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{engine-assets}
  s.version = "0.6.0.pre1"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["Corey Innis"]
  s.date = %q{2010-11-03}
  s.description = %q{A Rails Engine, which enables Rails Engines to provide assets (javascript, css and images)}
  s.email = %q{support@coolerator.net}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.md"
  ]
  s.files = [
    ".document",
     ".gitignore",
     ".wiprc",
     "Gemfile",
     "Gemfile.lock",
     "LICENSE",
     "RAILS_VERSIONS",
     "README.md",
     "Rakefile",
     "VERSION",
     "app/controllers/engine_assets/assets_controller.rb",
     "app/controllers/engine_assets/javascripts_controller.rb",
     "app/controllers/engine_assets/stylesheets_controller.rb",
     "config/routes.rb",
     "engine-assets.gemspec",
     "features/rails.feature",
     "features/step_definitions/rails_steps.rb",
     "features/support/env.rb",
     "features/support/rails.rb",
     "features/support/terminal.rb",
     "init.rb",
     "lib/engine-assets.rb",
     "lib/engine_assets/engine.rb",
     "lib/engine_assets/extensions/action_view/helpers/asset_tag_helper.rb",
     "lib/engine_assets/public_locator.rb",
     "rails/init.rb",
     "spec/app/controllers/engine_assets/javascripts_controller_spec.rb",
     "spec/app/controllers/engine_assets/stylesheets_controller_spec.rb",
     "spec/lib/engine-assets_spec.rb",
     "spec/lib/engine_assets/public_locator_spec.rb",
     "spec/routing/javascripts_routing_spec.rb",
     "spec/routing/stylesheets_routing_spec.rb",
     "spec/shared/assets_controller_spec.rb",
     "spec/shared/assets_routing_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/support/Gemfile-2.3.5",
     "spec/support/Gemfile-2.3.5.lock",
     "spec/support/Gemfile-2.3.9",
     "spec/support/Gemfile-2.3.9.lock",
     "spec/support/Gemfile-3.0.0",
     "spec/support/Gemfile-3.0.0.lock",
     "spec/support/fixtures/app/views/engine_assets/javascripts/dual.js.erb",
     "spec/support/fixtures/app/views/engine_assets/javascripts/solo.js.erb",
     "spec/support/fixtures/app/views/engine_assets/stylesheets/dual.css.erb",
     "spec/support/fixtures/app/views/engine_assets/stylesheets/solo.css.erb",
     "spec/support/fixtures/public/javascripts/dual.js",
     "spec/support/fixtures/public/stylesheets/dual.css",
     "spec/support/helpers/fixture_helper.rb",
     "spec/support/helpers/textmate_helper.rb",
     "spec/support/rails.rb",
     "spec/support/terminal.rb"
  ]
  s.homepage = %q{http://github.com/coreyti/engine-assets}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Rails Engines with assets.}
  s.test_files = [
    "spec/app/controllers/engine_assets/javascripts_controller_spec.rb",
     "spec/app/controllers/engine_assets/stylesheets_controller_spec.rb",
     "spec/lib/engine-assets_spec.rb",
     "spec/lib/engine_assets/public_locator_spec.rb",
     "spec/routing/javascripts_routing_spec.rb",
     "spec/routing/stylesheets_routing_spec.rb",
     "spec/shared/assets_controller_spec.rb",
     "spec/shared/assets_routing_spec.rb",
     "spec/spec_helper.rb",
     "spec/support/helpers/fixture_helper.rb",
     "spec/support/helpers/textmate_helper.rb",
     "spec/support/rails.rb",
     "spec/support/terminal.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<cucumber>, ["~> 0.8.5"])
      s.add_development_dependency(%q<rake>, ["~> 0.8.7"])
      s.add_development_dependency(%q<rr>, ["~> 1.0.0"])
      s.add_development_dependency(%q<rspec>, ["~> 1.3.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.4.0"])
      s.add_development_dependency(%q<term-ansicolor>, ["~> 1.0.5"])
    else
      s.add_dependency(%q<cucumber>, ["~> 0.8.5"])
      s.add_dependency(%q<rake>, ["~> 0.8.7"])
      s.add_dependency(%q<rr>, ["~> 1.0.0"])
      s.add_dependency(%q<rspec>, ["~> 1.3.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.4.0"])
      s.add_dependency(%q<term-ansicolor>, ["~> 1.0.5"])
    end
  else
    s.add_dependency(%q<cucumber>, ["~> 0.8.5"])
    s.add_dependency(%q<rake>, ["~> 0.8.7"])
    s.add_dependency(%q<rr>, ["~> 1.0.0"])
    s.add_dependency(%q<rspec>, ["~> 1.3.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.4.0"])
    s.add_dependency(%q<term-ansicolor>, ["~> 1.0.5"])
  end
end

