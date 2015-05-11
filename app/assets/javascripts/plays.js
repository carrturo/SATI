var initialize = function() {
  /*if ($('.actores_obra:checked').length === 0 || $('.generos_obra:checked').length === 0 || $('.funciones_obra:checked').length === 0){
    $("#boton_enviar").prop( "disabled", true );
  }else{
    $("#boton_enviar").prop( "disabled", false );
  }*/
  
  $("#boton_enviar").prop( "disabled", true );
  
  var deshabilitar = function(){
    $("#boton_enviar").prop( "disabled", true );
  }
  
  var habilitar = function(){
    $("#boton_enviar").prop( "disabled", false );
  }
  
  $('.actores_obra').change(function() {
      if ($('.actores_obra:checked').length === 0 || $('.generos_obra:checked').length === 0 || $('.funciones_obra:checked').length === 0){
        deshabilitar();
      }else{
        habilitar();
      }
  });
  
  $('.generos_obra').change(function() {
      if ($('.actores_obra:checked').length === 0 || $('.generos_obra:checked').length === 0 || $('.funciones_obra:checked').length === 0){
        deshabilitar();
      }else{
        habilitar();
      }
  });
  
  $('.funciones_obra').change(function() {
      if ($('.actores_obra:checked').length === 0 || $('.generos_obra:checked').length === 0 || $('.funciones_obra:checked').length === 0){
        deshabilitar();
      }else{
        habilitar();
      }
  });
  
};

$(document).ready(initialize);
$(document).on('page:load', initialize);