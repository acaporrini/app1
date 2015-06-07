
$(document).ready(function(){
  // $(".toggleDesc").on("click",function(event){
  //   event.preventDefault();
  //   $(this).closest("section").find(".description").slideToggle();
  // })

   
  image();
  $("#image_url").on("change",function(){
    image();

  });

});

  function image(){
    $(".image").html("<img class='img-thumbnail' src='"+$("#image_url").val()+"' alt='image not found'>");
  }