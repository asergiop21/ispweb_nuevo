$(document).ready(function(){
  $('.remove_f').click(function(event){
  $(this).prev('input[type=hidden]').val('1')
  $(this).closest('fieldset').hide()
  event.preventDefault();
  });

  $('.add_fields').click(function(event){

    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')  
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault();
    
    
  })


});
