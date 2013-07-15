/*$(document).ready(function(){
        $('.solved').click(function(){ 
            $('form').submit();
            return false;
        });
})*/
$(document).on('click', 'a[data-cambiar-estado]', function() {
  alert("hola");
  $('#ticket_status').val($(this).data('cambiar-estado'));
  $('form').submit();
});

