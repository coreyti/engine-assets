Feature: Install this Gem in a Rails application

  Background:
    Given I have built and installed the "engine-assets" gem

  Scenario: Use the gem without vendoring the gem in a Rails application
    When I generate a new Rails application
    And  I configure my application to require the "engine-assets" gem
    Then the command should have run successfully
