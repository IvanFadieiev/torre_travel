// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= turbolinks
//= require fotorama

$(document).ready(function(){
  $('.message').click(function(){
    $(this).animate({top: -$(this).outerHeight()}, 500);
  });
});

$(document).ready(function(){
  $('#notice').fadeOut(5000);
});

$(document).ready(function() {
  $(".content").css("display", "none");
  $(".content").fadeIn(800);
  $("#primaryContent div").css({ opacity: .9 });
  $("#primaryContent div").mouseenter(function(){
    $(this).css({ opacity: 1 });
  });
  $("#primaryContent div").mouseleave(function(){
    $(this).css({ opacity: 0.9 });
  });

});

$(document).ready(function(){
  $("select#torre_travel_housing ").click(function(){
    var value = $(this).val();
  if (value == "flat"){
    $("div#distance").slideUp();
    $("div#line").slideDown();
  }
  else{
    $("div#distance").slideDown();
    $("div#line").slideUp();;
  }
  });
});

