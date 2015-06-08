class InfoGeneralsController < ApplicationController
  before_action :admin_signed_in, except: [:show]
  before_action :set_info_general, only: [:show, :edit, :update] #:destroy

  # GET /info_generals/1
  # GET /info_generals/1.json
  def show
  end

  # GET /info_generals/1/edit
  def edit
  end

  # PATCH/PUT /info_generals/1
  # PATCH/PUT /info_generals/1.json
  def update
    respond_to do |format|
      if @info_general.update(info_general_params)
        format.html { redirect_to @info_general, notice: 'Info general was successfully updated.' }
        format.json { render :show, status: :ok, location: @info_general }
      else
        format.html { render :edit }
        format.json { render json: @info_general.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_info_general
      @info_general = InfoGeneral.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def info_general_params
      params.require(:info_general).permit(:nombre, :direccion, :telefono, :email, :fb, :tw, :youtube, :ig)
    end
end
