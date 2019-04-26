
  $( "#uvjet" ).autocomplete({
    source: putanja + "serviser/traziServiser",
    minLength: 1,
    focus: function(event,ui){
      event.preventDefault();
    },
    select:function(event,ui){
      spremi(ui.item);
    }
  }).data("ui-autocomplete")._renderItem=function(ul,objekt){
      return $("<li>" + objekt.naziv + " " + objekt.adresa + "</li>").appendTo(ul);
  };

  function spremi(serviser){

    $.ajax({
      type: "POST",
      url: putanja + "servis/dodajServisera",
      data: "servis=" + sifraServis +"&serviser=" + serviser.sifra,
      success: function(vratioServer){
        if(vratioServer==="OK"){
          $("#podaci").append(
            "<tr>" + 
              "<td>" + serviser.naziv + "</td>" +
              "<td><a class=\"obrisi\" id=\"p_" + serviser.sifra + "\" href=\"#\">Obriši</a></td>" +
           "</tr>");
           definirajBrisanje();
        }else{
          alert(vratioServer);
        }
      }
    });

  }

  function definirajBrisanje(){
    $(".obrisi").click(function(){
      let a = $(this);
      $.ajax({
        type: "POST",
        url: putanja + "servis/obrisiServisera",
        data: "servis=" + sifraServis +"&serviser=" + a.attr("id").split("_")[1],
        success: function(vratioServer){
          if(vratioServer==="OK"){
           a.parent().parent().remove();
          }else{
            alert(vratioServer);
          }
        }
      });
  
  
    });  
  }
  definirajBrisanje();

  












