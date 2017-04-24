  function selall(){

    for(i=0; i<20; i++){
      document.forms["mailorcount"].regione[i].checked = true;
    }
    for(i=0; i<5; i++){
      document.forms["mailorcount"].tipologia[i].checked = true;
    }
    for(i=0; i<12; i++){
      document.forms["mailorcount"].periodo[i].checked = true;
    }
    for(i=0; i<2; i++){
      document.forms["mailorcount"].posizione[i].checked = true;
    }
  }

  function pulisci(){
    for(i=0; i<20; i++){
      document.forms["mailorcount"].regione[i].checked = false;
    }
    for(i=0; i<5; i++){
      document.forms["mailorcount"].tipologia[i].checked = false;
    }
    for(i=0; i<12; i++){
      document.forms["mailorcount"].periodo[i].checked = false;
    }
    for(i=0; i<2; i++){
      document.forms["mailorcount"].posizione[i].checked = false;
    }

  }

  function avvisa(){

    var r = document.forms["mailorcount"].regione;
    var t = document.forms["mailorcount"].tipologia;
    var m = document.forms["mailorcount"].periodo;
    var p = document.forms["mailorcount"].posizione;
    var local = false;
    var sunto = '';
    var isValid = true;
    
    for(i=0; i<20; i++){
      if(r[i].checked) {
        local = true;
        break;
      }
    }
    if(!local) {
      sunto += "selezionare almeno una regione\n";
      isValid = false;
    }

    local = false;
    for(i=0; i<5; i++){
      if(t[i].checked) {
        local = true;
        break;
      }
    }
    if(!local) {
      sunto += "selezionare almeno una tipologia\n";
        isValid = false;
    }
    
    local = false;
    for(i=0; i<12; i++){
      if(m[i].checked){
        local = true;
        break;
      }
    }
    if(!local) {
      sunto += "selezionare almeno un mese\n";
        isValid = false;
    }
    
    local = false;
    for(i=0; i<2; i++){
      if(p[i].checked){
        local = true;
        break;
      }
    }
    if(!local) {
      sunto += "selezionare almeno una posizione\n";
        isValid = false;
    }

    if(! isValid)
      alert(sunto);

      return isValid;
  }
  
  