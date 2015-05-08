// function doubleSpace(){
//   var $singlesteps = $('.recipe-field #recipe_steps');
//   $singlesteps.replace(/(\r\n|\r|\n)+/g, '$1');
//   var $next = ($('#earthstagrams .active').next().length > 0) ? $('#earthstagrams .active').next() : $('#earthstagrams img:first');
//   $active.fadeOut(function(){
//     $active.removeClass('active');
//     $next.fadeIn().addClass('active');
//   });
// }

// $(document)
//     .one('focus.textarea', '.autoExpand', function(){
//       var savedValue = this.value;
//       this.value = '';
//       this.baseScrollHeight = this.scrollHeight;
//       this.value = savedValue;
//     })
//     .on('input.textarea', '.autoExpand', function(){
//       var minRows = 8,
//          rows;
//       this.rows = minRows;
//         console.log(this.scrollHeight , this.baseScrollHeight);
//       rows = Math.ceil((this.scrollHeight - this.baseScrollHeight) / 17);
//       this.rows = minRows + rows;
//     });