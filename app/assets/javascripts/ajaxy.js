$(document).ready(function() {
  $('#new_story').click(function(event){
    event.preventDefault();
    $('.hidden').removeClass('hidden')
  });
  $('.submit-button input').on('click', function(e){
    e.preventDefault();
    var $form = $('form');
    console.log($form)
    $.ajax({
      url: $form.prop('action'),
      type: $form.prop('method'),
      data: $form.serialize()
    }).done(function(new_story){
      $('.story-list').append(new_story)
    })
  })
});
