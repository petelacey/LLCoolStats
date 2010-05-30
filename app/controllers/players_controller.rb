class PlayersController < ApplicationController
  # GET /players
  def index
    team = Team.find(params[:team_id])
    @players = team.players.all

    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

  # GET /players/1
  def show
    @player = Player.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @player }
    end
  end

  # GET /players/new
  def new
    @player = Player.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
  end

  # POST /players
  def create
    @player = Player.new(params[:player])

    respond_to do |format|
      if @player.save
        format.html { redirect_to(@player, :notice => 'Player was successfully created.') }
        format.js
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /players/1
  def update
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.html { redirect_to(@player, :notice => 'Player was successfully updated.') }
        format.json  { render :nothing => true, :head => :created}
      else
        format.html { render :action => "edit" }
        format.json  { render :nothing => true, :head => :bad_request }
      end
    end
  end

  # DELETE /players/1
  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to(players_url) }
    end
  end
end
