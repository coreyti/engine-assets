class EngineAssets::StylesheetsController < EngineAssets::AssetsController
  unloadable # deprecated?

  private

  def set_headers
    headers['Content-Type'] = 'text/css; charset=utf-8'
  end
end
