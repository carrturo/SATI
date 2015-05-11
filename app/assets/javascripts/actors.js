var initialize = function() {
  /*if ($('.destrezas_actor:checked').length === 0){
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
  
  $('.destrezas_actor').change(function() {
    if ($('.destrezas_actor:checked').length === 0){
      deshabilitar();
    }else{
      habilitar();
    }
  });
};

$(document).ready(initialize);
$(document).on('page:load', initialize);