
  $( "#uvjet" ).autocomplete({
    source: putanja + "serviser/traziServiser",
    minLength: 1,
    focus: function(event,ui){
      event.preventDefault();
    },
    select:function(event,ui){
      $("#serviser").val(ui.item.sifra);
      $("#imeserviser").html(ui.item.naziv);
    }
  }).data("ui-autocomplete")._renderItem=function(ul,objekt){
      return $("<li>" + objekt.naziv + " " + objekt.adresa + "</li>").appendTo(ul);
  };


  












