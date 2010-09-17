Feature: Install this Gem in a Rails application

  Background:
    Given I have built and installed the "engine-assets" gem

  Scenario: Use the gem un-vendored in a Rails application
    When I generate a new Rails application
    And  I configure my application to require the "engine-assets" gem
    And  I check the configured gem version
    Then I should see "Current version: 0.5.0"

  Scenario: Send a request to be handled by the gem
    When I generate a new Rails application
    And  I configure my application to require the "engine-assets" gem
    And  I save the following as "app/views/engine_assets/javascripts/test.js.erb"
      """
      // test.js <%= "dynamic content" -%>
      """
    And  I perform a request to "http://example.com:1234/javascripts/test.js"
    Then I should receive the following response:
      | 200 | // test.js dynamic content |
