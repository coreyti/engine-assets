require 'spec_helper'

describe EngineAssets::JavascriptsController do
  before do
    @format = 'js'
  end

  it_should_behave_like "A controller acting as an AssetsController"

  it "serves the correct mime type" do
    get :show, :path => 'solo', :format => format
    response.headers['Content-Type'].should =~ /text\/javascript/
  end
end
