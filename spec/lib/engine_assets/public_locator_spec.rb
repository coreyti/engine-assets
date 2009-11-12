require 'spec/spec_helper'

describe EngineAssets::PublicLocator do
  attr_reader :base_path, :full_path, :find_path, :miss_path

  before do
    @base_path = File.join('fixtures', 'public')
    @full_path = File.join(basedir, 'spec', 'support', base_path)
    @find_path = '/javascripts/dual.js'
    @miss_path = '/javascripts/miss.js'

    EngineAssets::PublicLocator.paths << base_path
  end

  describe "#locate" do
    context "when the requested sub-path is located" do
      it "returns the full path to the file" do
        EngineAssets::PublicLocator.locate(find_path).should =~ /#{File.join(base_path, find_path)}/
      end
    end

    context "when the requested sub-path is not located" do
      it "returns nil" do
        EngineAssets::PublicLocator.locate(miss_path).should be_nil
      end
    end
  end
end
