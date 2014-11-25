class HomeController < ApplicationController

  def index

  end

  def debug_session
    respond_to do |format|
      format.json {render :json => session.to_json}
    end
  end
end
