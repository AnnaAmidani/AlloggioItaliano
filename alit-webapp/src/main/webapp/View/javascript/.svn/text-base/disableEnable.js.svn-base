
  function disable(){
    if(document.getElementById('descrizione').value.indexOf("descrizione della") != -1 ){
      document.getElementById('descrizione').disabled=true;
    }
  }

  function clean(){
    if
    (document.getElementById('descrizione').value.indexOf("descrizione della") != -1 )
      document.getElementById('descrizione').value = ' ';
  }

  function enable(){
      document.getElementById('descrizione').disabled=false;
  }

  function disableAll(){
      document.getElementById('parcheggio').disabled=true;
      document.getElementById('numcamere').disabled=true;
      document.getElementById('numlettimin').disabled=true;
      document.getElementById('numlettimax').disabled=true;
      document.getElementById('tv').disabled=true;
      document.getElementById('internet').disabled=true;
      document.getElementById('bagno').disabled=true;
      document.getElementById('con vasca').disabled=true;
      document.getElementById('colazione').disabled=true;
      document.getElementById('menu').disabled=true;
      document.getElementById('noleggio').disabled=true;
      document.getElementById('kmaeroporto').disabled=true;
      document.getElementById('kmstazione').disabled=true;
      document.getElementById('kmcasello').disabled=true;
      document.getElementById('mtmezzipubblici').disabled=true;
  }

  function abilita(quanti){

    var testo = "";

    if(quanti == 'uno'){
      testo = "il&nbsp;<input type=\"text\" class=\"smusso\" name=\"dal\" id=\"dal\" size=\"9\"/><input type=\"reset\" class=\"cal\" value=\" ... \"\n";
            testo += "onclick=\"return showCalendar('dal', '%Y-%m-%d');\"/>\n";

    }

    if(quanti == 'due'){
      testo = "dal&nbsp;<input type=\"text\" class=\"smusso\" name=\"dal\" id=\"dal\" size=\"9\"/><input type=\"reset\" class=\"cal\" value=\" ... \"\n";
            testo += "onclick=\"return showCalendar('dal', '%Y-%m-%d');\"/>\n";
            testo += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>al&nbsp;&nbsp;\n";
            testo += "<input type=\"text\" class=\"smusso\" name=\"al\" id=\"al\" size=\"9\"/><input type=\"reset\"  class=\"cal\" value=\" ... \"\n";
            testo += "onclick=\"return showCalendar('al', '%Y-%m-%d');\"/>\n";
    }

    document.getElementById('a').innerHTML = testo;
  }

  function validTime()
  {
    var ins_date = document.getElementById('dal').value;

    if(ins_date == null || ins_date == "")
    {
      document.segnala.secondaction.value='segnala'; document.segnala.submit();
      return true;
    }

    var idate = ins_date.split('-');
    var inserted = new Date();
    inserted.setFullYear( idate[0] ); //anno
    inserted.setMonth( idate[1] ); // mese
    inserted.setDate( idate[2] ); // giorno

    var now = new Date(); // oggi

    var interval = inserted.getTime() - now.getTime(); // in millisecondi

    if( interval > 0 && interval <= 15552000000)
    {
      document.segnala.secondaction.value='segnala'; document.segnala.submit();
      return true;
    }
    else
    {
      alert("non è consentito inserire eventi che si terranno tra più di sei mesi");
      return false;
    }
  }

