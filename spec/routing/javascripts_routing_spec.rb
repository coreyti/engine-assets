require 'spec/spec_helper'

describe EngineAssets::JavascriptsController do
  before do
    @prefix = 'javascripts'
    @format = 'js'
  end

  it_should_behave_like "A controller routed as an AssetsController"
end
