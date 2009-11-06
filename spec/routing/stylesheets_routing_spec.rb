require 'spec_helper'

describe EngineAssets::StylesheetsController do
  describe "routing" do
    it "recognizes valid paths" do
      { :get => "/stylesheets/asset.css" }.should be_routable
    end
    
    it "generates valid paths" do
      stylesheets_path(:asset, :format => :css).should == '/stylesheets/asset.css'
    end
  end
end
