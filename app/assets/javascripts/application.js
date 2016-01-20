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

  $('#notice').fadeOut(5000);

  $(".content").css("display", "none");
  $(".content").fadeIn(800);
  $(".portfolioBox").css({ opacity: .9 });
  $(".portfolioBox").mouseenter(function(){
    $(this).css({ opacity: 1 });
  });
  $(".portfolioBox").mouseleave(function(){
    $(this).css({ opacity: 0.9 });
  });

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

   $("#new_comment div.emojis img").click(function(){
    var text = $(this).attr('alt');
     $('#comment_body').val($('#comment_body').val()+text);
  });

    $('a.poplight[href^=#]').click(function() {
    var popID = $(this).attr('rel'); //получаем имя окна, важно не забывать, при добавлении новых, менять имя в атрибуте rel ссылки
    var popURL = $(this).attr('href'); //получаем размер из href атрибута ссылки
 
    //запрос и переменные из href url
    var query= popURL.split('?');
    var dim= query[1].split('&');
    var popWidth = dim[0].split('=')[1]; //первое значение строки запроса
 
    //Добавляем к окну кнопку закрытия
    $('#' + popID).fadeIn().css({ 'width': Number( popWidth ) }).prepend('<a href="#" title="Закрыть" class="close"></a>');
 
        //Определяем маржу(запас) для выравнивания по центру (по вертикали и горизонтали) - мы добавляем 80 к высоте / ширине с учетом отступов + ширина рамки определённые в css
    var popMargTop = ($('#' + popID).height() + 80) / 2;
    var popMargLeft = ($('#' + popID).width() + 80) / 2;
 
    //Устанавливаем величину отступа
    $('#' + popID).css({ 
      'margin-top' : -popMargTop,
      'margin-left' : -popMargLeft
    });
 
    //Добавляем полупрозрачный фон затемнения
    $('body').append('<div id="fade"></div>'); //div контейнер будет прописан перед тегом </body>.
    $('#fade').css({'filter' : 'alpha(opacity=80)'}).fadeIn(); //полупрозрачность слоя, фильтр для тупого IE
 
    return false;
  });
 
  //Закрываем окно и фон затемнения
  $(document).on('click', 'a.close, #fade', function() { //закрытие по клику вне окна, т.е. по фону...
    $('#fade , .popup_block').fadeOut(function() {
        $('#fade, a.close').remove();  //плавно исчезают 
    });
    return false;
   });

   $('body > div.panel > ul > li:nth-child(1)').click(function(){
    $('body > div.panel > ul > div').toggle('slow');
  });


  $('.scrollingtext').bind('marquee', function () {
    var ob = $(this);
    var tw = ob.width();
    var ww = ob.parent().width();
    ob.css({
        right: -tw
      });
    ob.animate({
        right: ww
      }, 30000, 'linear', function () {
        ob.trigger('marquee');
    });
    ob.mouseover(function() {
      $(this).stop();
      });
    ob.mouseleave(function() {
    ob.animate({
        right: ww
      }, 30000, 'linear', function () {
        ob.trigger('marquee');
      });
    });
  }).trigger('marquee');

  $('#primaryContent div div.reserved').click(function(data){
    location = '/torre_travels/'+ $(this).attr("value");
  });

  $('.fotorama__nav.fotorama__nav--dots').remove();
});
