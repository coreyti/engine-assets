require 'spec_helper'

describe EngineAssets::JavascriptsController do
  describe "routing" do
    it "recognizes valid paths" do
      { :get => "/javascripts/asset.js" }.should be_routable
    end
    
    it "generates valid paths" do
      javascripts_path(:asset, :format => :js).should == '/javascripts/asset.js'
    end
  end
end
