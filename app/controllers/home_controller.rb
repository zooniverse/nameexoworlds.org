class HomeController < ApplicationController
  respond_to :json, :html
  caches_page :the_exoworlds


  def index

  end

  def debug_session
    respond_to do |format|
      format.json {render :json => session.to_json}
    end
  end

  def the_process
  end

  def rules

  end


  def the_exoworlds
    @systems = System.all
  end

end
