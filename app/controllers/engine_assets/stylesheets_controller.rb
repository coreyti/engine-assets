class EngineAssets::StylesheetsController < EngineAssets::AssetsController

  private

  def set_headers
    headers['Content-Type'] = 'text/javascript; charset=utf-8'
  end
end
