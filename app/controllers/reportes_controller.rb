class ReportesController < ApplicationController
  def show
    @actoresDestrezas = params[:actorsDestrezas]
    @actoresGeneros = params[:actorsGenders]
    @actoresEstados = params[:actorsStates]
    @actoresNombre = params[:actorsName]
    
    @obrasClasificaciones = params[:playsClasificacionId]
    @obrasGeneros = params[:playsGeneros]
    @obrasEstado = params[:playsState]
    @obrasRadio = params[:playsRadio]
    @obrasDuracion = params[:playsDuracion]
    @obrasNombre = params[:playNombre]
    
    @teatroCapacidad = params[:theatersCapacity]
    @teatroEstado = params[:theatersState]
    @teatroNombre = params[:theaterNombre]
    
    
    @orderBy = params[:orderBy] #if
  end
  
  def consult
    @Obras = Play.all
    @Actores = Actor.all
    @Clasificaciones = Clasificacion.all
    @Destrezas = Destreza.all
    @Funciones = Funcion.all
    @Generos = Genero.all
    @Teatros = Theater.all
    @Tickets = TipoTicket.all
    @Reservaciones = TicketReservation.all
  end
end
