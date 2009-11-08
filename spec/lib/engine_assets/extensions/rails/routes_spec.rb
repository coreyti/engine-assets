require 'spec_helper'

describe ActionController::Routing::RouteSet do
  describe "#load_routes!" do
    class TestRouteSet < ActionController::Routing::RouteSet
      attr_reader :configuration_files

      def initialize
        @configuration_files = []
      end

      def add_configuration_file(routes)
        configuration_files << routes
      end
    end

    attr_reader :routeset

    before do
      @routeset = TestRouteSet.new
    end

    it "adds the engine-assets routes configuration" do
      routeset.load_routes!
      routeset.configuration_files[0].should =~ /engine-assets.*\/config\/routes\.rb/
    end
  end
end
