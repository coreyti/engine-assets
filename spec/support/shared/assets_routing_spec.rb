require 'spec_helper'

describe "A controller routed as an AssetsController", :shared => true do
  attr_reader :prefix, :format

  describe "routing" do
    attr_reader :path, :route

    context "given a simple path" do
      before do
        @path  = "/#{prefix}/asset.#{format}"
        @route = { :controller => "engine_assets/#{prefix}", :action => 'show', :path => 'asset', :format => format }
      end

      it "recognizes the path" do
        params_from(:get, path).should == route
      end

      it "generates the path from a URL helper" do
        send("#{prefix}_path", :asset, :format => format).should == path
      end
    end

    context "given a complex path of nested directories" do
      before do
        @path = "/#{prefix}/path/to/asset.#{format}"
        @route = { :controller => "engine_assets/#{prefix}", :action => 'show', :path => 'path/to/asset', :format => format }
      end

      it "recognizes the path" do
        params_from(:get, path).should == route
      end

      it "generates the path from a URL helper" do
        CGI.unescape(send("#{prefix}_path", 'path/to/asset', :format => format)).should == CGI.unescape(path)
      end
    end

    context "given a complex path of dotted components" do
      before do
        @path = "/#{prefix}/path.to/asset.one.#{format}"
        @route = { :controller => "engine_assets/#{prefix}", :action => 'show', :path => 'path.to/asset.one', :format => format }
      end

      it "recognizes the path" do
        params_from(:get, path).should == route
      end

      it "generates the path from a URL helper" do
        CGI.unescape(send("#{prefix}_path", 'path.to/asset.one', :format => format)).should == CGI.unescape(path)
      end
    end
  end
end
