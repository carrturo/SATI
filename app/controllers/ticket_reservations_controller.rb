class TicketReservationsController < ApplicationController
  before_action :set_ticket_reservation, only: [:show, :edit, :update, :destroy]

  # GET /ticket_reservations
  # GET /ticket_reservations.json
  def index
    @ticket_reservations = TicketReservation.all
  end

  # GET /ticket_reservations/1
  # GET /ticket_reservations/1.json
  def show
  end

  # GET /ticket_reservations/new
  def new
    @ticket_reservation = TicketReservation.new
    @play = Play.find_by_id(params['play_id'])
  end

  # GET /ticket_reservations/1/edit
  def edit
  end

  # POST /ticket_reservations
  # POST /ticket_reservations.json
  def create
    @ticket_reservation = TicketReservation.new(ticket_reservation_params)

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
      params.require(:ticket_reservation).permit(:name, :identity, :email)
    end
end
