class BuildingsController < ApplicationController
  def index
    @game = Game.find(params[:game_id])
    @building = @game.buildings
  end

  def show
    @game = Game.find(params[:game_id])
    @building = @game.buildings.find(params[:id])
  end

  def new
    @game = Game.find(params[:game_id])
    @building = @game.buildings.build
  end
  
  def create
    @game = Game.find(params[:game_id])
    @building = @game.buildings.build(params[:building])
    if @building.save
      redirect_to game_buildings_url(@game)
    else
      render :action => "edit"
    end
  end

  def edit
    @game = Game.find(params[:game_id])
    @building = @game.buildings.find(params[:id])
  end
  
  def update
    @game = Game.find(params[:game_id])
    @building = Building.find(params[:id])
    if @building.update_attributes(params[:building])
      redirect_to game_building_url(@game, @building)
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @game = Game.find(params[:game_id])
    @building = Building.find(params[:id])
    @building.destroy
    
    respond_to do |format|
      format.html { redirect_to game_buildings_path(@game) }
      format.xml  { head :ok}
    end
  end

end
