require 'spec/spec_helper'

describe EngineAssets::StylesheetsController do
  before do
    @prefix = 'stylesheets'
    @format = 'css'
  end

  it_should_behave_like "A controller routed as an AssetsController"
end
