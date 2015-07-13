
$(document).ready(function(){

  cartCount();
  $('.rated').raty({ path: '/assets', 
  readOnly: true,
  score: function() {
    return $(this).attr('data-score');
  }
  });
  $("[data-toggle=tooltip]").tooltip();
  $(".rating").raty({ path: '/assets',scoreName: 'comment[rating]'}); 
  image();
  $("#image_url").on("change",function(){
    image();

  });
});
  function cartCount(){
    $.get("/cart/count", function(data, status){
        $('#cart-count').text('('+data+')')
    });
  }
  function image(){
    $(".image").html("<img class='img-thumbnail' src='"+$("#image_url").val()+"' alt='image not found'>");
  }