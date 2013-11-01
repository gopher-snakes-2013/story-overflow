$(document).ready(function() {
  $('#new_story').click(function(event){
    event.preventDefault();
    $('#new-story-form').toggleClass('hidden')
  }); // upon clicking 'Create a Story', removes the 'hidden' class from the form

  $('.submit-button input').on('click', function(e){
    e.preventDefault();
    var $form = $('form');
    console.log($form)
    $.ajax({
      url: $form.prop('action'),  //  #=> /stories | ex: <form action="/stories">
      type: $form.prop('method'), //  #=> "post"   | ex: <form method="post">
      data: $form.serialize()     // {:story => {:title => ____, :description => ____}} *gets passed to params
    }).done(function(new_story){
      $('.story-list').append(new_story) // receives a string [Look @ stories_controller.rb, create method WHOA!]
    })
  })

  // $('#story-container').on('ajax:success', '.delete_button', function(x) {
  //   console.log(x)

  //  Note in reference to commented out code directly above: Via event delegation, we were able to attach a listener onto the 'story-container' div which made it listen to all children that have a class of 'delete_button'. [Look @ _story.html.erb] Since the link_to "DELETE THIS SHIT" has remote: true, the href will run its route to the controller... the on('ajax:success')  means that the interaction with the controller #action was successful (the story got deleted), and then WE have to do JQuery to make the necessary visual changes on the client side which shows the story was actually deleted :)
});