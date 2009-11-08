require 'spec_helper'

describe Rails::Plugin::Loader do
  attr_reader :loader, :plugin, :directory

  before do
    @loader = Rails::Plugin::Loader.new(OpenStruct.new({ :loaded_plugins => [] }))
  end

  describe "#register_plugin_as_loaded" do
    before do
      paths = []
      stub(EngineAssets::PublicLocator).paths { paths }
    end

    context "given a plugin which is an engine and contains a 'public' directory" do
      before do
        @directory = File.join(basedir, 'spec', 'support', 'fixtures')
        @plugin    = OpenStruct.new({ :engine? => true, :directory => directory })
      end

      it "registers the plugin with the EngineAssets::PublicLocator" do
        loader.send(:register_plugin_as_loaded, plugin)
        EngineAssets::PublicLocator.paths.should == [ "#{directory}/public" ]
      end
    end

    context "given a plugin which is an engine and does NOT contain a 'public' directory" do
      before do
        @directory = basedir
        @plugin    = OpenStruct.new({ :engine? => true, :directory => directory })
      end

      it "does not register the plugin with the EngineAssets::PublicLocator" do
        loader.send(:register_plugin_as_loaded, plugin)
        EngineAssets::PublicLocator.paths.should == []
      end
    end

    context "given a plugin which is NOT an engine" do
      before do
        @directory = File.join(basedir, 'spec', 'support', 'fixtures')
        @plugin    = OpenStruct.new({ :engine? => false, :directory => directory })
      end

      it "does not register the plugin with the EngineAssets::PublicLocator" do
        loader.send(:register_plugin_as_loaded, plugin)
        EngineAssets::PublicLocator.paths.should == []
      end
    end
  end
end
