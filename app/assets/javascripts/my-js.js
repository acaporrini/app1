
$(document).ready(function(){
  $(".toggleDesc").on("click",function(event){
    event.preventDefault();
    $(this).closest("section").find(".description").slideToggle();
  })

});