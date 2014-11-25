class ClubsController < ApplicationController

  def current
    respond_to do |format|
      format.json {render :json => current_club.to_json}
    end
  end
end
