class EngineAssets::AssetsController < ApplicationController
  unloadable

  layout        nil
  before_filter :expire, :set_headers
  after_filter  :cache

  def show
    render File.join('engine_assets', controller_name, params[:path])
  end


  private

  def expire
    # TODO
    # expire_page :controller => self, :action => "all"
  end

  def cache
    cache_page
  end

  def set_headers
    # optionally override
  end
end
