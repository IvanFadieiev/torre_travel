//= require_tree .
$(document).ready(function(){
  //для хаты дистанция, для квартиры линия
  $("#torre_travel_housing_field > div > div > input").blur(function(){
    var value = $(this).val();
  if (value == "flat"){
    $(".distance_m_field").slideUp();
    $(".distance_field").slideDown();
  }
  else{
    $(".distance_m_field").slideDown();
    $(".distance_field").slideUp();
    };
  });
});