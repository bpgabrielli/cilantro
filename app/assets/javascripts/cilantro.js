$(document).ready(function(){
  $('.step-panel').click(function(){
    $(this).toggleClass('panel');
  });
  $('.ingredient-list > p').click(function(){
    $(this).toggleClass('striked-thru');
  });
})
$(document).ready(function(){
    function split( val ) {
      return val.split( /,\s*/ );
    }
    function extractLast( term ) {
      return split( term ).pop();
    }
    $( "#recipe_all_tags" )
      // don't navigate away from the field on tab when selecting an item
      .bind( "keydown", function( event ) {
        if ( event.keyCode === $.ui.keyCode.TAB &&
            $( this ).autocomplete( "instance" ).menu.active ) {
          event.preventDefault();
        }
      })
      .autocomplete({
        source: function( request, response ) {
          $.getJSON( "/api/tags/autocompletions", {
            term: extractLast( request.term )
          }, response );
        },
        focus: function ( event, ui ) {
          var terms = split( this.value );
          // remove the current input
          terms.pop();
          // add the selected item
          terms.push( ui.item.value );
          this.value = terms.join( ", " );
          return false;
        },
        select: function ( event, ui ) {
          var terms = split( this.value );
          // remove the current input
          terms.pop();
          // add the selected item
          terms.push( ui.item.value );
          // add placeholder to get the comma-and-space at the end
          terms.push( "" );
          this.value = terms.join( ", " );
          return false;
        }
      });
  });