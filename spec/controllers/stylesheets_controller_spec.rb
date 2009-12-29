require 'spec_helper'

describe EngineAssets::StylesheetsController do
  before do
    @format = 'css'
  end

  it_should_behave_like "A controller acting as an AssetsController"

  it "serves the correct mime type" do
    get :show, :path => 'solo', :format => format
    response.headers['Content-Type'].should =~ /text\/css/
  end
end
