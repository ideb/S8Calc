class GamesController < ApplicationController
  access_control do
    allow :admin
    allow all, :to => [:index, :show, :suggest]
  end

  before_filter :require_user, :only => [:new, :edit, :destroy]
  
  def suggest
    @amount = params[:amount].to_i
    @userlevel = params[:user_level].to_i
    @user = params[:user]
    @steps = 0
    @game = Game.find(params[:id])
    @building = @game.buildings
    @roi = {}
    if current_user 
      @building.each do |building|
        if @userlevel >= building.level          
          @owned = building.ownerships.find_by_user_id(@user).count
          building.write_attribute(:current_cost, building.cost+building.cost*0.1*@owned)  
          building.write_attribute(:roi, building.income.to_f/building.current_cost.to_f)
          @roi[building.id] = building.income.to_f/building.current_cost.to_f
        end
      end
    else
      @building.each do |building|
        @owned = 0
        building.write_attribute(:current_cost, building.cost+building.cost*0.1*@owned)  
        @roi[building.id] = building.income.to_f/building.current_cost.to_f
      end
    end
     
    begin
      @next = @building[@roi.index(@roi.values.max)-1]      
      if @amount - @next.current_cost < 0
        break
      else
         @amount -= @next.current_cost
      end
      @next.increment(:suggested, 1)
      @next.write_attribute(:current_cost, @next.current_cost+0.1*@next.cost)  
      @roi[@next.id] = @next.income / @next.current_cost
      @steps += 1
    end while @steps < 500
    
    flash[:notice] =  'Items suggested: ' + @steps.to_s
    render :action => "show"
  end
  
  # GET /games
  # GET /games.xml
  def index
    @games = Game.all
    @user = @current_user

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @games }
    end
  end

  # GET /games/1
  # GET /games/1.xml
  def show
    @game = Game.find(params[:id])
    @building = @game.buildings
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @game }
    end
  end

  # GET /games/new
  # GET /games/new.xml
  def new
    @game = Game.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.xml
  def create
    @game = Game.new(params[:game])

    respond_to do |format|
      if @game.save
        flash[:notice] = 'Game was successfully created.'
        format.html { redirect_to(@game) }
        format.xml  { render :xml => @game, :status => :created, :location => @game }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.xml
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        flash[:notice] = 'Your progress is saved to your profile.'
        format.html { redirect_to(@game) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.xml
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to(games_url) }
      format.xml  { head :ok }
    end
  end
end
