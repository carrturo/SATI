class ClasificacionsController < ApplicationController
  before_action :set_clasificacion, only: [:show, :edit, :update, :destroy]

  # GET /clasificacions
  # GET /clasificacions.json
  def index
    @clasificacions = Clasificacion.all
  end

  # GET /clasificacions/1
  # GET /clasificacions/1.json
  def show
  end

  # GET /clasificacions/new
  def new
    @clasificacion = Clasificacion.new
  end

  # GET /clasificacions/1/edit
  def edit
  end

  # POST /clasificacions
  # POST /clasificacions.json
  def create
    @clasificacion = Clasificacion.new(clasificacion_params)

    respond_to do |format|
      if @clasificacion.save
        format.html { redirect_to clasificacions_path, notice: 'Clasificacion was successfully created.' }
        format.json { render :show, status: :created, location: @clasificacion }
      else
        format.html { render :new }
        format.json { render json: @clasificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clasificacions/1
  # PATCH/PUT /clasificacions/1.json
  def update
    respond_to do |format|
      if @clasificacion.update(clasificacion_params)
        format.html { redirect_to clasificacions_path, notice: 'Clasificacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @clasificacion }
      else
        format.html { render :edit }
        format.json { render json: @clasificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clasificacions/1
  # DELETE /clasificacions/1.json
  def destroy
    @clasificacion.destroy
    respond_to do |format|
      format.html { redirect_to clasificacions_url, notice: 'Clasificacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clasificacion
      @clasificacion = Clasificacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clasificacion_params
      params.require(:clasificacion).permit(:nombre, :edadMin, :edadMax, :comentario)
    end
end
