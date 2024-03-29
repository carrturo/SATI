class TicketReservationsController < ApplicationController
  before_action :admin_signed_in, except: [:show,:new,:create, :ticket_surrender, :ticket_surrender_rev, :ticket_no_found, :ticket_found, :ticketcstate]
  before_action :taquillero_signed_in, only: [:ticket_surrender, :ticket_surrender_rev, :ticket_no_found, :ticket_found, :ticketcstate]
  before_action :set_ticket_reservation, only: [:show, :edit, :update, :destroy]

  # GET /ticket_reservations
  # GET /ticket_reservations.json
  def index
    @ticket_reservations = TicketReservation.all
    
  end

  # GET /ticket_reservations/1
  # GET /ticket_reservations/1.json
  def show
    @play = Play.find_by_id(@ticket_reservation.play_id)
  end
  
  def find_data
    @play_token = Play.find_by_id(@ticket.play_id)
    @funcion_token = Funcion.find_by_id(@ticket.funcion_id)
    
  end
  
  def ticket_surrender
     
     @ticket_reservations = TicketReservation.all       
  end
  
  def ticket_surrender_rev
    @ticket=TicketReservation.where(token:params[:token]).first
     if @ticket.nil?
       redirect_to ticket_no_found_path
     else
       redirect_to ticket_found_path(@ticket)
     end
  end
    
    def ticket_no_found
    
    end
    
    def ticket_found
      @ticket = TicketReservation.find_by_id(params[:id])
      @play= Play.where(params[TicketReservation.find_by_id(params[:id]).play_id])
         
    end
  
  def ticketcstate
    @ticket= TicketReservation.find_by_id(params[:id])
    @ticket.state = "Entregado"
    @ticket.save
  end
  # GET /ticket_reservations/new
  def new
    @ticket_reservation = TicketReservation.new
    @play = Play.find_by_id(params['play_id'])
    @funcions=Play.find_by_id(params['play_id']).funcions
    @tipo_tickets=TipoTicket.where(state: "Activo")
  end

  # GET /ticket_reservations/1/edit
  def edit
  end

  # POST /ticket_reservations
  # POST /ticket_reservations.json
  def create
    @ticket_reservation = TicketReservation.new
    @play = Play.find_by_id(params['play_id'])
    @funcions=Play.find_by_id(params['play_id']).funcions
    @tipo_tickets=TipoTicket.where(state: "Activo")
   
    #VIENEN DE FORMULARIO
    @tipo_ticket = TipoTicket.all
    @play = Play.find_by_id(params['play_id'])
    @ticket_reservation = TicketReservation.new(ticket_reservation_params)
    @funcions=Play.find_by_id(params['play_id']).funcions
    
    
    cant_total=0
    precio_total=0.00
    
    @tipo_ticket.each do |tipo_ticket|
       cant_total+=params[tipo_ticket.tipo.to_sym].to_i
     end
    
    @tipo_ticket.each do |tipo_ticket|
      precio_total+= tipo_ticket.precio*params[tipo_ticket.tipo.to_sym].to_i 
     end
   
    @ticket_reservation.total_price=precio_total
    @ticket_reservation.total_tickets=cant_total
    @funcion= Funcion.find_by_id(params[:ticket_reservation][:date])
    @hora= @funcion.hora
    @ticket_reservation.date=@hora
    @funcion.cant_disponible=@funcion.cant_disponible - cant_total
    @funcion.save
    @ticket_reservation.play_id=params['play_id']
    respond_to do |format|
      if @ticket_reservation.save
        format.html { redirect_to @ticket_reservation, notice: 'Ticket reservation was successfully created.' }
        format.json { render :show, status: :created, location: @ticket_reservation }
      else
        format.html { render :new }
        format.json { render json: @ticket_reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ticket_reservations/1
  # PATCH/PUT /ticket_reservations/1.json
  def update
    respond_to do |format|
      if @ticket_reservation.update(ticket_reservation_params)
        format.html { redirect_to @ticket_reservation, notice: 'Ticket reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket_reservation }
      else
        format.html { render :edit }
        format.json { render json: @ticket_reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ticket_reservations/1
  # DELETE /ticket_reservations/1.json
  def destroy
    @ticket_reservation.destroy
    respond_to do |format|
      format.html { redirect_to ticket_reservations_url, notice: 'Ticket reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket_reservation
      @ticket_reservation = TicketReservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_reservation_params
      params.require(:ticket_reservation).permit(:name, :identity, :email, :play_id, :funcion_id, :tipo_ticket_id,:state)
    end
end
