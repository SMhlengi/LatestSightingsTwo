// JavaScript Document
$(document).ready(function(){
  
  var pop_container = $('#popup_container'),
      pop_body = $('.popup_ex'),
      overlay = $('#over_lay'),
      close = $('#close_button');
  
  $(close).click(function(){
  $(overlay).fadeOut(1000);
  $(pop_body).slideUp(1000);  
  });
  
   $(overlay).click(function(){
  $(overlay).fadeOut(1000);
  $(pop_body).slideUp(1000);  
  });
  
  


});