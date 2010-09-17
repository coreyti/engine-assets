Feature: Install this Gem in a Rails application

  Background:
    Given I have built and installed the "engine-assets" gem

  Scenario: Use the gem un-vendored in a Rails application
    When I generate a new Rails application
    And  I configure my application to require the "engine-assets" gem
    And  I check the configured gem version
    Then I should see "Current version: 0.5.0"
