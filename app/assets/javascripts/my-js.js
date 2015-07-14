
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
  $(".removeFromCart").on("click",function(){
  var item = $(this).data("product");
    $.ajax({
     type: "DELETE",
     contentType: "application/json; charset=utf-8",
     url: "/cart/remove/" + item,
     
     dataType: "json",
     success: function (result) {
       $("#removeFromCart_"+result.id).remove();
       cartCount();
       cartTotal();
     },
     error: function (){
        window.alert("something wrong!");
     }
    });
  });
});
  function cartCount(){
    $.get("/cart/count", function(data, status){
        $('#cart-count').text('('+data+')');
    });
  }
  function cartTotal(){
    $.get("/cart/total", function(data, status){
        $('#cartTotal').text(data.toFixed(2)+ " \u20ac");
    });
  }
  function image(){
    $(".image").html("<img class='img-thumbnail' src='"+$("#image_url").val()+"' alt='image not found'>");
  }