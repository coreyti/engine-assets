class EngineAssets::AssetsController < ApplicationController
  unloadable

  layout        nil
  before_filter :expire, :set_headers
  after_filter  :cache

  def show
    flat_file = EngineAssets::PublicLocator.locate(File.join(controller_name, [params[:path], params[:format]].join('.')))
    if(flat_file)
      render(:file => flat_file)
    else
      render(:template => File.join('engine_assets', controller_name, params[:path]), :layout => false)
    end
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
