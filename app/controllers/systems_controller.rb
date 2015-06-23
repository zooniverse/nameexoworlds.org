class SystemsController < ApplicationController
  before_action :authenticate_club!,  except: [:show]

  caches_page :index


  protect_from_forgery :except => [:add_club_vote, :remove_club_vote]

  def add_club_vote
    if @system = System.find(params[:id]) and (current_club )
      @system.vote_from_club(current_club)
      render :json => {new_vote_count: @system.system_vote_count}.to_json
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def add_public_vote
    @user   = current
    @system = System.find(params[:id])
    @name   = @system.propsed_names(params[:proposed_name_id])

    if @user and @system and @name
      @name.add_vote_from_user(@user)
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def remove_public_vote
    @user   = current
    @system = System.find(params[:id])
    @name   = @system.propsed_names(params[:proposed_name_id])

    if @user and @system and @name
      @name.remove_vote_from_user(@user)
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def remove_club_vote
    if @system = System.find(params[:id]) and (current_club )
      @system.remove_vote_from_club(current_club )
      render :json => {new_vote_count: @system.system_vote_count}.to_json
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def index
    redirect_to '/the_exoworlds'
  end

  def show
    @club = current_club
    @system = System.find(params[:id])
  end

  def remove_club_suggestion
    club = current_club
    if @system = System.find(params[:id]) and club
      @system.remove_club_suggestion(club)
      render :json => @system.to_json
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def create_club_suggestion

    club = current_club

    if @system = System.find(params[:id]) and club and club.can_suggest

      @system.proposed_names.create({
          name: params[:system_name],
          description: params[:system_description],
          club:club
      })

      @system.remarks.create({
          club: club,
          body: params[:remarks]
      })

      params[:planets].each do |planet_id, details|
        Planet.find(planet_id).proposed_names.create({
          name: details[:name],
          description: params[:description],
          club: club
        })
      end

      render :json => @system.to_json
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def add_club_name
    if @system = System.find(params[:id]) and (current_club)
      @system.proposed_names.create(name: params[:name], club: (current_club))
      redirect_to @system
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def remove_club_name
    if @system = System.find(params[:id]) and current_club
      @system.proposed_names.find_by_club_id(current_club.id).destroy
      redirect_to @system
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

end
