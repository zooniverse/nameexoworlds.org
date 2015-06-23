class PlanetsController < ApplicationController
  # before_action :authenticate_club!,  except: [:show]

  def add_club_name
    if @planet = Planet.find(params[:id]) and current_club
      @planet.proposed_names.create(name: params[:name], club: current_club)
      redirect_to @planet.system
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def add_public_vote
    @user   = current
    @planet = Planet.find(params[:id])
    @name   = @planet.propsed_names(params[:proposed_name_id])

    if @user and @planet and @name
      @name.add_vote_from_user(@user)
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def remove_public_vote
    @user   = current
    @planet = Planet.find(params[:id])
    @name   = @planet.propsed_names(params[:proposed_name_id])

    if @user and @planet and @name
      @name.remove_vote_from_user(@user)
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end


end
