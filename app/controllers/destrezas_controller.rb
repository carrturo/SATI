class DestrezasController < ApplicationController
  before_action :set_destreza, only: [:show, :edit, :update, :destroy]

  # GET /destrezas
  # GET /destrezas.json
  def index
    @destrezas = Destreza.all
  end

  # GET /destrezas/1
  # GET /destrezas/1.json
  def show
  end

  # GET /destrezas/new
  def new
    @destreza = Destreza.new
  end

  # GET /destrezas/1/edit
  def edit
  end

  # POST /destrezas
  # POST /destrezas.json
  def create
    @destreza = Destreza.new(destreza_params)

    respond_to do |format|
      if @destreza.save
        format.html { redirect_to @destreza, notice: 'Destreza was successfully created.' }
        format.json { render :show, status: :created, location: @destreza }
      else
        format.html { render :new }
        format.json { render json: @destreza.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /destrezas/1
  # PATCH/PUT /destrezas/1.json
  def update
    respond_to do |format|
      if @destreza.update(destreza_params)
        format.html { redirect_to @destreza, notice: 'Destreza was successfully updated.' }
        format.json { render :show, status: :ok, location: @destreza }
      else
        format.html { render :edit }
        format.json { render json: @destreza.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /destrezas/1
  # DELETE /destrezas/1.json
  def destroy
    @destreza.destroy
    respond_to do |format|
      format.html { redirect_to destrezas_url, notice: 'Destreza was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_destreza
      @destreza = Destreza.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def destreza_params
      params.require(:destreza).permit(:nombre, :comentario)
    end
end
