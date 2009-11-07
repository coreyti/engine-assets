require 'spec_helper'

describe EngineAssets::StylesheetsController do
  before do
    @format = 'css'
  end

  it_should_behave_like "A controller acting as an AssetsController"
end
