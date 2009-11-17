# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{engine-assets}
  s.version = "0.3.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Corey Innis"]
  s.date = %q{2009-11-17}
  s.description = %q{A Rails Engine, which enables Rails Engines to provide assets (javascript, css and images)}
  s.email = %q{support@coolerator.net}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "TODO.md",
     "VERSION",
     "app/controllers/engine_assets/assets_controller.rb",
     "app/controllers/engine_assets/javascripts_controller.rb",
     "app/controllers/engine_assets/stylesheets_controller.rb",
     "config/routes.rb",
     "engine-assets.gemspec",
     "lib/engine-assets.rb",
     "lib/engine_assets/extensions/rails/assets.rb",
     "lib/engine_assets/extensions/rails/plugins.rb",
     "lib/engine_assets/extensions/rails/routes.rb",
     "lib/engine_assets/public_locator.rb",
     "rails/init.rb",
     "spec/controllers/javascripts_controller_spec.rb",
     "spec/controllers/stylesheets_controller_spec.rb",
     "spec/lib/engine_assets/extensions/rails/plugins_spec.rb",
     "spec/lib/engine_assets/extensions/rails/routes_spec.rb",
     "spec/lib/engine_assets/public_locator_spec.rb",
     "spec/routing/javascripts_routing_spec.rb",
     "spec/routing/stylesheets_routing_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/spec_suite.rb",
     "spec/support/fixtures/app/views/engine_assets/javascripts/dual.js.erb",
     "spec/support/fixtures/app/views/engine_assets/javascripts/solo.js.erb",
     "spec/support/fixtures/app/views/engine_assets/stylesheets/dual.css.erb",
     "spec/support/fixtures/app/views/engine_assets/stylesheets/solo.css.erb",
     "spec/support/fixtures/public/javascripts/dual.js",
     "spec/support/fixtures/public/stylesheets/dual.css",
     "spec/support/helpers/fixture_helper.rb",
     "spec/support/helpers/textmate_helper.rb",
     "spec/support/shared/assets_controller_spec.rb",
     "spec/support/shared/assets_routing_spec.rb"
  ]
  s.homepage = %q{http://github.com/coreyti/engine-assets}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Rails Engines with assets.}
  s.test_files = [
    "spec/controllers/javascripts_controller_spec.rb",
     "spec/controllers/stylesheets_controller_spec.rb",
     "spec/lib/engine_assets/extensions/rails/plugins_spec.rb",
     "spec/lib/engine_assets/extensions/rails/routes_spec.rb",
     "spec/lib/engine_assets/public_locator_spec.rb",
     "spec/routing/javascripts_routing_spec.rb",
     "spec/routing/stylesheets_routing_spec.rb",
     "spec/spec_helper.rb",
     "spec/spec_suite.rb",
     "spec/support/helpers/fixture_helper.rb",
     "spec/support/helpers/textmate_helper.rb",
     "spec/support/shared/assets_controller_spec.rb",
     "spec/support/shared/assets_routing_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.8"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.8"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.8"])
  end
end

