class OldGamesController < ApplicationController
  # GET /old_games
  # GET /old_games.json
  def index
    @old_games = OldGame.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @old_games }
    end
  end

  # GET /old_games/1
  # GET /old_games/1.json
  def show
    @old_game = OldGame.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @old_game }
    end
  end

  # GET /old_games/new
  # GET /old_games/new.json
  def new
    @old_game = OldGame.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @old_game }
    end
  end

  # GET /old_games/1/edit
  def edit
    @old_game = OldGame.find(params[:id])
  end

  # POST /old_games
  # POST /old_games.json
  def create
    @old_game = OldGame.new(params[:old_game])

    respond_to do |format|
      if @old_game.save
        format.html { redirect_to @old_game, notice: 'Old game was successfully created.' }
        format.json { render json: @old_game, status: :created, location: @old_game }
      else
        format.html { render action: "new" }
        format.json { render json: @old_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /old_games/1
  # PUT /old_games/1.json
  def update
    @old_game = OldGame.find(params[:id])

    respond_to do |format|
      if @old_game.update_attributes(params[:old_game])
        format.html { redirect_to @old_game, notice: 'Old game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @old_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /old_games/1
  # DELETE /old_games/1.json
  def destroy
    @old_game = OldGame.find(params[:id])
    @old_game.destroy

    respond_to do |format|
      format.html { redirect_to old_games_url }
      format.json { head :no_content }
    end
  end
end
