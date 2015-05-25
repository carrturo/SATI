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
  
  def playhistory
  @plays =Play.all
  end  
  # GET /plays/new
  def new
    @play = Play.new
    # PONER SOLAMENTE LOS ACTIVOS
    @actors = Actor.where(state: "Activo")
    @generos= Genero.where(state: "Activo")
    @funcions= Funcion.where(state: "Activo")
  end

  # GET /plays/1/edit
  def edit
    @actors = Actor.where(state: "Activo")
    @generos= Genero.where(state: "Activo")
    @funcions= Funcion.where(state: "Activo")
   
    if params[:picture].present?
        preloaded = Cloudinary::PreloadedFile.new(params[:picture])
        logger.debug("VALIDOOOOOOOOO #{preloaded.valid?}")
        @project.picture = preloaded.identifier.to_s
    end
  end

  # POST /plays
  # POST /plays.json
  def create
    @play = Play.new(play_params)
    @actors = Actor.where(state: "Activo")
    @generos= Genero.where(state: "Activo")
    @funcions= Funcion.where(state: "Activo")
   
    if params[:picture].present?
        preloaded = Cloudinary::PreloadedFile.new(params[:picture])
        logger.debug("VALIDOOOOOOOOO #{preloaded.valid?}")
        @project.picture = preloaded.identifier.to_s
    end
    
    params[:actors].each do |actor|
      @play.actors << Actor.find_by_id(actor[0])
      
    end 
      params[:generos].each do |genero|
        @play.generos << Genero.find_by_id(genero[0])
      end
      params[:funcions].each do |funcion|
        funcion = Funcion.find_by_id(funcion[0])
        @teatro= Theater.find_by_id(params[:play][:theater_id])
        funcion.cant_disponible=@teatro.capacity
        funcion.save
        @play.funcions << funcion
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

  def cartelera
    @plays = Play.where(state: "Exhibicion")
  end  
  # PATCH/PUT /plays/1
  # PATCH/PUT /plays/1.json
  def update
     @actors = Actor.where(state: "Activo")
     @generos= Genero.where(state: "Activo")
     @funcions= Funcion.where(state: "Activo")
     
     @actors.each do |actor|
       @play.actors.delete(actor)
     end 
     
    @generos.each do |genero|
      @play.generos.delete(genero)
      end 
     @funcions.each do |funcion|
        @play.funcions.delete(funcion)
      end 
    
     params[:actors].each do |actor|
      @play.actors << Actor.find_by_id(actor[0])
      
    end 
      params[:generos].each do |genero|
        @play.generos << Genero.find_by_id(genero[0])
      end
      params[:funcions].each do |funcion|
        funcion = Funcion.find_by_id(funcion[0])
        @teatro= Theater.find_by_id(params[:play][:theater_id])
        funcion.cant_disponible=@teatro.capacity
        funcion.save
        @play.funcions << funcion
        
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
      params.require(:play).permit(:title, :summary, :promotional_video, :duration, :end_date, :state, :clasificacion_id, :picture_cache, :picture, :theater_id)
    end
end



