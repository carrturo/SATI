class ReportesController < ApplicationController
  
  def show

    @filtroPor = ""

    @obrasClauses = "true = true"
    @tituloReporte = "Filtros usados: "
    @actoresClauses = "true = true"
    @teatroClauses = "true = true"

    @Actores =Actor.all
    @Obras =Play.all
    @Teatros =Theater.all

    if params[:playNombre].present? && !(params[:playNombre].empty?)
      @obrasClauses << " AND title = '" << params[:playNombre] << "'"
      @tituloReporte << "Nombre de Obra:"<< params[:playNombre] << ","
    end

    if params[:playsState].present? && params[:playsState] != '0'
      @obrasClauses << " AND state = '" << params[:playsState] << "'"
      @tituloReporte << "Estado de Obra:"<< params[:playsState] << ","
    end



    if params[:playsRadio].present? && params[:playsDuracion].present?
      if !(params[:playsDuracion].empty?)
        if params[:playsRadio] == "up"
          @obrasClauses << " AND duration > '" << params[:playsDuracion] << "'"
          @tituloReporte << "Duración de Obra (Mayor que):"<< params[:playsDuracion] << ","
        end
        if params[:playsRadio] == "equals"
          @obrasClauses << " AND duration = '" << params[:playsDuracion] << "'"
          @tituloReporte << "Duración de Obra (Igual a):"<< params[:playsDuracion] << ","

        end
        if params[:playsRadio] == "down"
          @obrasClauses << " AND duration < '" << params[:playsDuracion] << "'"
          @tituloReporte << "Duración de Obra (Menor que):"<< params[:playsDuracion] << ","

        end
      end
    end

    if params[:playsClasificacion].present? && params[:playsClasificacion] != '0'
      @clasificacion = Clasificacion.find_by_id(params[:playsClasificacion].to_s)
      @obrasClauses << " AND clasificacion_id = '" << params[:playsClasificacion] << "'"
      @tituloReporte << "Clasificación de Obra:"<<"#{@clasificacion.nombre}"<<","
    end

    if params[:actorsName].present? && !(params[:actorsName].empty?)
      @actoresClauses << " AND name = '" << params[:actorsName] << "'"
      @tituloReporte << "Nombre de actor:" << params[:actorsName] << ","
    end

    if params[:actorsGenders].present? && params[:actorsGenders] != '0'
      @actoresClauses << " AND gender = '" << params[:actorsGenders] << "'"
      @tituloReporte << "Genero de Actor:" << params[:actorsGenders] << ","
    end

    if params[:actorsStates].present? && params[:actorsStates] != '0'
      @actoresClauses << " AND state = '" << params[:actorsStates] << "'"
      @tituloReporte << "Estado de actor:"<< params[:actorsStates]<< ","
    end

    if params[:theaterNombre].present? && !(params[:theaterNombre].empty?)
      @teatroClauses << " AND name = '" << params[:theaterNombre] << "'"
      @tituloReporte << "Nombre de teatro:"<< params[:theaterNombre] << ","
    end

    if params[:theaterRadio].present? && params[:theatersCapacity].present?
      if !(params[:theatersCapacity].empty?)
        if params[:theaterRadio] == "up"
          @teatroClauses << " AND capacity > '" << params[:theatersCapacity] << "'"
          @tituloReporte << "Capacidad de teatro (Mayor que):"<< params[:theatersCapacity] << ","
        end
        if params[:theaterRadio] == "equals"
          @teatroClauses << " AND capacity = '" << params[:theatersCapacity] << "'"
          @tituloReporte << "Capacidad de teatro (Igual a):"<< params[:theatersCapacity] << ","
        end
        if params[:theaterRadio] == "down"
          @teatroClauses << " AND capacity < '" << params[:theatersCapacity] << "'"
          @tituloReporte << "Capacidad de teatro (Menor que):"<< params[:theatersCapacity] << ","
        end
      end
    end

    if params[:theatersState].present? && params[:theatersState] != '0'
      @teatroClauses << " AND state = '" << params[:theatersState] << "'"
      @tituloReporte << "Estado de teatro:"<< params[:theatersState] << ","
    end

    if params[:playsGeneros].present? && params[:playsGeneros] != '0'
      @genero = Genero.find_by_id(params[:playsGeneros].to_s)
      @tituloReporte << "Genero de obra:" << "#{@genero.nombre}" << ","
    end

    if params[:actorsDestrezas].present? && params[:actorsDestrezas] != '0'
      @destreza = Destreza.find_by_id(params[:actorsDestrezas].to_s)
      @tituloReporte << "Destreza de actor:"<<"#{@destreza.nombre}"<<","
    end

    @actoresFiltro = Actor.where(@actoresClauses)
    @obrasFiltro = Play.where(@obrasClauses)
    @teatrosFiltro = Theater.where(@teatroClauses)

    #un teatro puede exhibir varias obras, pero cada obra solo se exhibe en un teatro


    @actoresFinal = Array.new
    @teatrosFinal = Array.new    
    @obrasFinal = Array.new

    if params[:orderBy].present?
      if params[:orderBy].to_s == "ByActors"

        # @tituloReporte =

        @filtroPor = "actores"

        @ObrasPorTeatro = Array.new
        @ActoresPorObras = Array.new
        @ObrasIntermedias = Array.new 
        @ActoresIntermedios = Array.new 

        if @genero.nil?

          @ObrasIntermedias = @obrasFiltro

        else

          @obrasFiltro.each do |intermedias|
            intermedias.generos.each do |obrasGeneros|
              if obrasGeneros.id == @genero.id
                @ObrasIntermedias << intermedias
              end
            end
          end

        end

        if @destreza.nil?

          @ActoresIntermedios = @actoresFiltro

        else

          @actoresFiltro.each do |intermedias|
            intermedias.destrezas.each do |actoresDestrezas|
              if actoresDestrezas.id == @destreza.id
                @ActoresIntermedios << intermedias
              end
            end
          end

        end

        @teatrosFiltro.each do |teatro|
          @ObrasIntermedias.each do |obras|
            if obras.theater_id == teatro.id
              @ObrasPorTeatro << obras
            end
          end
        end

        @ObrasPorTeatro.each do |obrasTeatro|
          obrasTeatro.actors.each do |obrasActores|
            @ActoresPorObras << obrasActores
          end
        end

        @ActoresIntermedios.each do |actoresFiltro|
          @ActoresPorObras.each do |actoresObras|                     
            if actoresFiltro.id == actoresObras.id
              @actoresFinal << actoresFiltro
            end
          end
        end
        @actoresFinal = @actoresFinal.uniq
      end

      if params[:orderBy].to_s == "ByPlay"
        @filtroPor = "obras"

        @ObrasPorTeatro = Array.new
        @ObrasPorActores = Array.new       
        @ObrasIntermedias = Array.new   
        @ActoresIntermedios = Array.new         

        if @genero.nil?

          @ObrasIntermedias = @obrasFiltro

        else

          @obrasFiltro.each do |intermedias|
            intermedias.generos.each do |obrasGeneros|
              if obrasGeneros.id == @genero.id
                @ObrasIntermedias << intermedias
              end
            end
          end

        end    

        if @destreza.nil?

          @ActoresIntermedios = @actoresFiltro

        else

          @actoresFiltro.each do |intermedias|
            intermedias.destrezas.each do |actoresDestrezas|
              if actoresDestrezas.id == @destreza.id
                @ActoresIntermedios << intermedias
              end
            end
          end

        end

        @teatrosFiltro.each do |teatro|
          @ObrasIntermedias.each do |obras|
            if obras.theater_id == teatro.id
              @ObrasPorTeatro << obras
            end
          end
        end

        @ActoresIntermedios.each do |actores|
          actores.plays.each do |actoresObras|
            @ObrasPorActores << actoresObras
          end
        end

        @ObrasPorActores.each do |actoresObras|
          @ObrasPorTeatro.each do |obrasTeatro|
            if actoresObras.id == obrasTeatro.id
              @obrasFinal << actoresObras
            end
          end
        end
        @obrasFinal = @obrasFinal.uniq
      end
      if params[:orderBy].to_s == "ByTheater" 
        @filtroPor = "teatros"

        @ObrasPorActores = Array.new 
        @ObrasFiltradas = Array.new
        @ObrasIntermedias = Array.new   
        @ActoresIntermedios = Array.new         

        if @genero.nil?

          @ObrasIntermedias = @obrasFiltro

        else

          @obrasFiltro.each do |intermedias|
            intermedias.generos.each do |obrasGeneros|
              if obrasGeneros.id == @genero.id
                @ObrasIntermedias << intermedias
              end
            end
          end

        end  

        if @destreza.nil?

          @ActoresIntermedios = @actoresFiltro

        else

          @actoresFiltro.each do |intermedias|
            intermedias.destrezas.each do |actoresDestrezas|
              if actoresDestrezas.id == @destreza.id
                @ActoresIntermedios << intermedias
              end
            end
          end

        end

        @ActoresIntermedios.each do |actores|
          actores.plays.each do |actoresObras|
            @ObrasPorActores << actoresObras
          end
        end
        @ObrasPorActores.each do |actoresObras|
          @ObrasIntermedias.each do |obras|
            if obras.id == actoresObras.id
              @ObrasFiltradas << obras
            end
          end
        end
        @teatrosFiltro.each do |teatro|
          @ObrasFiltradas.each do |obrasFilter|
            if obrasFilter.theater_id == teatro.id
              @teatrosFinal << teatro
            end
          end
        end
        @teatrosFinal = @teatrosFinal.uniq
      end
    end
    @radioFilter = " Filtrado por: #{@filtroPor}"
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
