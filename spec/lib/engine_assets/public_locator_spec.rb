require 'spec/spec_helper'

describe EngineAssets::PublicLocator do
  attr_reader :base_path, :full_path, :find_path, :miss_path

  before do
    @base_path = File.join('fixtures', 'public')
    @full_path = File.join(SPEC_DIR, 'support', 'fixtures')
    @find_path = '/javascripts/dual.js'
    @miss_path = '/javascripts/miss.js'

    EngineAssets::PublicLocator.send(:clear)
  end

  describe "#register" do
    before do
      EngineAssets::PublicLocator.register(full_path)
    end

    context "when the suggest path does not exist" do
      it "raises an exception" do
        lambda {
          EngineAssets::PublicLocator.register('bogus')
        }.should raise_error(Errno::ENOENT)
      end
    end

    context "when the suggest path does not contain a 'public' directory" do
      it "raises an exception" do
        lambda {
          EngineAssets::PublicLocator.register(File.dirname(__FILE__))
        }.should raise_error(Errno::ENOENT)
      end
    end

    context "when the suggest path is valid" do
      it "adds the path" do
        EngineAssets::PublicLocator.paths.should == ["#{full_path}/public"]
      end
    end
  end

  describe "#locate" do
    context "when the requested sub-path is located" do
      before do
        EngineAssets::PublicLocator.register(full_path)
      end

      it "returns the full path to the file" do
        EngineAssets::PublicLocator.locate(find_path).should =~ /#{File.join(base_path, find_path)}/
      end
    end

    context "when the requested sub-path is not located" do
      before do
        EngineAssets::PublicLocator.register(full_path)
      end

      it "returns nil" do
        EngineAssets::PublicLocator.locate(miss_path).should be_nil
      end
    end

    context "when no asset-providing engines have registered" do
      it "returns nil" do
        EngineAssets::PublicLocator.locate(miss_path).should be_nil
      end
    end
  end
end
