class EngineAssets::JavascriptsController < EngineAssets::AssetsController

  private

  def set_headers
    headers['Content-Type'] = 'text/javascript; charset=utf-8'
  end
end
