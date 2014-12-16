class ClubsController < ApplicationController
  before_action :authenticate_club!

  def current
    respond_to do |format|
      format.json {render :json => current_club.to_json}
    end
  end

  def show
    @club = Club.find(params[:id])
    if @club !=current_club
      redirect_to '/'
    end
  end
end
