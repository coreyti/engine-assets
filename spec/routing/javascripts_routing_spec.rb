require 'spec_helper'

describe EngineAssets::JavascriptsController do
  describe "routing" do
    attr_reader :path, :route

    context "given a simple path" do
      before do
        @path  = '/javascripts/asset.js'
        @route = { :controller => 'engine_assets/javascripts', :action => 'show', :path => 'asset', :format => 'js' }
      end

      it "recognizes the path" do
        params_from(:get, path).should == route
      end

      it "generates the path from a URL helper" do
        javascripts_path(:asset, :format => :js).should == path
      end
    end

    context "given a complex path of nested directories" do
      before do
        @path = '/javascripts/path/to/asset.js'
        @route = { :controller => 'engine_assets/javascripts', :action => 'show', :path => 'path/to/asset', :format => 'js' }
      end

      it "recognizes the path" do
        params_from(:get, path).should == route
      end

      it "generates the path from a URL helper" do
        CGI.unescape(javascripts_path('path/to/asset', :format => :js)).should == CGI.unescape(path)
      end
    end

    context "given a complex path of dotted components" do
      before do
        @path = '/javascripts/path.to/asset.one.js'
        @route = { :controller => 'engine_assets/javascripts', :action => 'show', :path => 'path.to/asset.one', :format => 'js' }
      end

      it "recognizes the path" do
        params_from(:get, path).should == route
      end

      it "generates the path from a URL helper" do
        CGI.unescape(javascripts_path('path.to/asset.one', :format => :js)).should == CGI.unescape(path)
      end
    end
  end
end
