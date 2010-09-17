Feature: Install this Gem in a Rails application

  Background:
    Given I have built and installed the "engine-assets" gem

  Scenario: Use the gem un-vendored in a Rails application
    When I generate a new Rails application
    And  I configure my application to require the "engine-assets" gem
    And  I check the configured gem version
    Then I should see "Current version: 0.5.0"

  Scenario: Send a request for an application-host dynamic asset
    When I generate a new Rails application
    And  I configure my application to require the "engine-assets" gem
    And  I save the following as "app/views/engine_assets/javascripts/example.js.erb"
      """
      // example.js (application - <%= "dynamic" -%>)
      """
    And  I perform a request to "http://example.com:1234/javascripts/example.js"
    Then I should receive a response matching the following:
      | 200 | // example.js (application - dynamic) |

  Scenario: Send a request for an engine-hosted static asset
    When I generate a new Rails application
    And  I configure my application to require the "engine-assets" gem
    And  I generate a new "example_plugin" plugin
    And  I save the following as "vendor/plugins/example_plugin/init.rb"
      """
      require 'engine-assets'
      EngineAssets::PublicLocator.register(File.join(File.dirname(__FILE__)))
      """
    And  I save the following as "vendor/plugins/example_plugin/public/javascripts/example.js"
      """
      // example.js (plugin - static)
      """
    And  I perform a request to "http://example.com:1234/javascripts/example.js"
    Then I should receive a response matching the following:
      | 200 | // example.js (plugin - static) |

  Scenario: Send a request for an engine-hosted dynamic asset
    When I generate a new Rails application
    And  I configure my application to require the "engine-assets" gem
    And  I generate a new "example_plugin" plugin
    And  I save the following as "vendor/plugins/example_plugin/init.rb"
      """
      require 'engine-assets'
      EngineAssets::PublicLocator.register(File.join(File.dirname(__FILE__)))
      """
    And  I save the following as "vendor/plugins/example_plugin/app/views/engine_assets/javascripts/example.js.erb"
      """
      // example.js (plugin - dynamic)
      """
    And  I perform a request to "http://example.com:1234/javascripts/example.js"
    Then I should receive a response matching the following:
      | 200 | // example.js (plugin - dynamic) |

  Scenario: Send a development request for an application webpage which references an engine-hosted asset
    When I generate a new Rails application
    And  I configure my application to require the "engine-assets" gem
    And  I configure my application to run in the "development" environment
    And  I save the following as "config/initializers/assets.rb"
      """
      ActionView::Helpers::AssetTagHelper.register_javascript_expansion :defaults => [
        'example.js'
      ]
      """
    And  I generate a new "example" scaffold
    And  I save the following as "app/views/layouts/examples.html.erb"
      """
      <html>
      <head>
        <%= javascript_include_tag :all, :cache => true, :recursive => true -%>
      </head>
      <body></body>
      </html>
      """
    And  I generate a new "example_plugin" plugin
    And  I save the following as "vendor/plugins/example_plugin/init.rb"
      """
      require 'engine-assets'
      EngineAssets::PublicLocator.register(File.join(File.dirname(__FILE__)))
      """
    And  I save the following as "vendor/plugins/example_plugin/public/javascripts/example.js"
      """
      // example.js content
      """
    And  I perform a request to "http://example.com:1234/examples"
    Then I should receive a response matching the following:
      | 200 | /javascripts/example.js |
