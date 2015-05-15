class TipoTicketsController < ApplicationController
  before_action :set_tipo_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tipo_tickets
  # GET /tipo_tickets.json
  def index
    @tipo_tickets = TipoTicket.all
  end

  # GET /tipo_tickets/1
  # GET /tipo_tickets/1.json
  def show
  end

  # GET /tipo_tickets/new
  def new
    @tipo_ticket = TipoTicket.new
  end

  # GET /tipo_tickets/1/edit
  def edit
  end

  # POST /tipo_tickets
  # POST /tipo_tickets.json
  def create
    @tipo_ticket = TipoTicket.new(tipo_ticket_params)

    respond_to do |format|
      if @tipo_ticket.save
        format.html { redirect_to tipo_tickets_path, notice: 'Tipo ticket was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_ticket }
      else
        format.html { render :new }
        format.json { render json: @tipo_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_tickets/1
  # PATCH/PUT /tipo_tickets/1.json
  def update
    respond_to do |format|
      if @tipo_ticket.update(tipo_ticket_params)
        format.html { redirect_to tipo_tickets_path, notice: 'Tipo ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_ticket }
      else
        format.html { render :edit }
        format.json { render json: @tipo_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_tickets/1
  # DELETE /tipo_tickets/1.json
  def destroy
    @tipo_ticket.destroy
    respond_to do |format|
      format.html { redirect_to tipo_tickets_url, notice: 'Tipo ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_ticket
      @tipo_ticket = TipoTicket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_ticket_params
      params.require(:tipo_ticket).permit(:tipo, :precio, :comentario, :state)
    end
end
