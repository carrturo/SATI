class PlaysController < ApplicationController
  before_action :set_play, only: [:show, :edit, :update, :destroy]

  # GET /plays
  # GET /plays.json
  def index
    @plays = Play.all
  end

  # GET /plays/1
  # GET /plays/1.json
  def show
  end

  # GET /plays/new
  def new
    @play = Play.new
    # PONER SOLAMENTE LOS ACTIVOS
    @actors = Actor.where(state: "Activo")
    @generos= Genero.all
    @funcions= Funcion.all
    @clasificacions= Clasificacion.all
  end

  # GET /plays/1/edit
  def edit
     @actors = Actor.where(state: "Activo")
    @generos= Genero.all
    @funcions= Funcion.all
    @clasificacions= Clasificacion.all
  end

  # POST /plays
  # POST /plays.json
  def create
    @play = Play.new(play_params)
    params[:actors].each do |actor|
      @play.actors << Actor.find_by_id(actor[0])
      
    end 
      params[:generos].each do |genero|
        @play.generos << Genero.find_by_id(genero[0])
      end
      params[:funcions].each do |funcion|
        @play.funcions << Funcion.find_by_id(funcion[0])
      end 
      params[:clasificacions].each do |clasificacion|
        @play.clasificacions << Clasificacion.find_by_id(clasificacion[0])  
      end

    respond_to do |format|
      if @play.save
        format.html { redirect_to @play, notice: 'Play was successfully created.' }
        format.json { render :show, status: :created, location: @play }
      else
        format.html { render :new }
        format.json { render json: @play.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plays/1
  # PATCH/PUT /plays/1.json
  def update
     params[:actors].each do |actor|
      @play.actors << Actor.find_by_id(actor[0])
      
    end 
      params[:generos].each do |genero|
        @play.generos << Genero.find_by_id(genero[0])
      end
      params[:funcions].each do |funcion|
        @play.funcions << Funcion.find_by_id(funcion[0])
      end 
      params[:clasificacions].each do |clasificacion|
        @play.clasificacions << Clasificacion.find_by_id(clasificacion[0])  
      end
    respond_to do |format|
      if @play.update(play_params)
        format.html { redirect_to @play, notice: 'Play was successfully updated.' }
        format.json { render :show, status: :ok, location: @play }
      else
        format.html { render :edit }
        format.json { render json: @play.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plays/1
  # DELETE /plays/1.json
  def destroy
    @play.destroy
    respond_to do |format|
      format.html { redirect_to plays_url, notice: 'Play was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_play
      @play = Play.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def play_params
      params.require(:play).permit(:title, :summary, :promotional_video, :duration, :end_date, :state)
    end
end



