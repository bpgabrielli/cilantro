$(document).ready(function(){
  $('.step-panel').click(function(){
    $(this).toggleClass('panel');
  });
  $('.ingredient-list > p').click(function(){
    $(this).css('text-decoration', 'line-through');
  });
})