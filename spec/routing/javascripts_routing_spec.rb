require 'spec_helper'

describe EngineAssets::JavascriptsController do
  describe "routing" do
    attr_reader :path

    context "given a simple path" do
      before do
        @path = '/javascripts/asset.js'
      end

      it "is able to recognize the path" do
        pending "my ability to overcome the challenges of spec'ing this working behavior"
        { :get => path }.should be_routable
      end

      it "is able to generate the path" do
        javascripts_path(:asset, :format => :js).should == path
      end
    end

    context "given a complex path" do
      before do
        @path = '/javascripts/path/to/asset.js'
      end

      it "is able to recognize the path" do
        pending "my ability to overcome the challenges of spec'ing this working behavior"
        { :get => path }.should be_routable
      end

      it "is able to generate the path" do
        pending "my ability to overcome the challenges of spec'ing this working behavior"
        javascripts_path('path/to/asset', :format => :js).should == path
      end
    end
  end
end
