class TeamsController < ApplicationController
  # GET /teams
  def index
    @teams = Team.all
    @team = Team.new

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /teams/1
  def show
    @team = Team.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @team }
    end
  end

  # GET /teams/new
  def new
    @team = Team.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /teams/1/edit
  def edit
    @team = Team.find(params[:id])
  end

  # POST /teams
  def create
    @team = Team.new(params[:team])

    respond_to do |format|
      if @team.save
        format.html { redirect_to(@team, :notice => 'Team was successfully created.') }
        format.js
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /teams/1
  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to(@team, :notice => 'Team was successfully updated.') }
        format.json  { render :nothing => true, :head => :created}
      else
        format.html { render :action => "edit" }
        format.json  { render :nothing => true, :head => :bad_request }
      end
    end
  end

  # DELETE /teams/1
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to(teams_url) }
    end
  end
end
