class ActorsController < ApplicationController
  before_action :admin_signed_in, except: [:actorhistory, :show]
  before_action :set_actor, only: [:show, :edit, :update, :destroy]

  # GET /actors
  # GET /actors.json
  def index
    @actors = Actor.all
  end
  
def actorhistory
    @actors = Actor.all
  end
  # GET /actors/1
  # GET /actors/1.json
  def show
  end

  # GET /actors/new
  def new
    @actor = Actor.new
    @destrezas= Destreza.where(state: "Activo")
  end

  # GET /actors/1/edit
  def edit
    @destrezas= Destreza.where(state: "Activo")
    
    if params[:picture].present?
        preloaded = Cloudinary::PreloadedFile.new(params[:picture])
        logger.debug("VALIDOOOOOOOOO #{preloaded.valid?}")
        @project.picture = preloaded.identifier.to_s
    end
    
  end

  # POST /actors
  # POST /actors.json
  def create
    @actor = Actor.new(actor_params)
    @destrezas= Destreza.where(state: "Activo")
    
    if params[:picture].present?
        preloaded = Cloudinary::PreloadedFile.new(params[:picture])
        logger.debug("VALIDOOOOOOOOO #{preloaded.valid?}")
        @project.picture = preloaded.identifier.to_s
    end
    
    params[:destrezas].each do |destreza|
      @actor.destrezas << Destreza.find_by_id(destreza[0])
    end 
    
    respond_to do |format|
      if @actor.save
        format.html { redirect_to @actor, notice: 'Actor was successfully created.' }
        format.json { render :show, status: :created, location: @actor }
      else
        format.html { render :new }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actors/1
  # PATCH/PUT /actors/1.json
  def update
     @destrezas= Destreza.where(state: "Activo")
     
    @destrezas.each do |destreza|
      @actor.destrezas.delete(destreza)
      end 
    
     params[:destrezas].each do |destreza|
      @actor.destrezas << Destreza.find_by_id(destreza[0])
    end 
    respond_to do |format|
      if @actor.update(actor_params)
        format.html { redirect_to @actor, notice: 'Actor was successfully updated.' }
        format.json { render :show, status: :ok, location: @actor }
      else
        format.html { render :edit }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actors/1
  # DELETE /actors/1.json
  def destroy
    @actor.destroy
    respond_to do |format|
      format.html { redirect_to actors_url, notice: 'Actor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor
      @actor = Actor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actor_params
      params.require(:actor).permit(:name, :gender, :identity, :email, :facebook_profile, :biography, :state,:picture)
    end
end
