$(document).ready(function() {
  $('#new_story').click(function(event){
    event.preventDefault();
    $('.hidden').removeClass('hidden')
    console.log("INSIDE the href");
  });
});