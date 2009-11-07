require 'spec_helper'

describe EngineAssets::JavascriptsController do
  before do
    @format = 'js'
  end

  it_should_behave_like "A controller acting as an AssetsController"
end
