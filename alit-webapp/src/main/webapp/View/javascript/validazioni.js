function nullOrNumber( id )
{
  var elemento = document.getElementById( id );
  if( elemento == null )
    return true;

  var valore = elemento.value;
  if( valore == null || valore == "")
      return true;

  if( valore.toString().search(/^[0-9]+$/) == 0 )
    return true;

  return false;
}

function valida()
{
  var riepilogo = "";
  var isValid=true;


  var denominazione = document.getElementById('denominazione').value;
  var regione = document.getElementById('regione').value;
  var sigla = document.getElementById('sigla').value;
  var comune = document.getElementById('comune').value;
  var nome = document.getElementById('nome').value;
  var cognome = document.getElementById('cognome').value;
  var mail = document.getElementById('mail').value;
  var telefono = document.getElementById('telefono').value;
  var cellulare = document.getElementById('cellulare').value;
  var fax = document.getElementById('fax').value;
  var web = document.getElementById('web').value;
  var anno = document.getElementById('anno').value;
  var codicefiscale = document.getElementById('codicefiscale').value;
  var cap = document.getElementById('cap').value;
  var annofondazione = document.getElementById('annofondazione').value;

  if ( ! nullOrNumber( 'numcamere' ) )
  {
    riepilogo += "- il numero di camere deve essere un numero intero\n\n";
    isValid= false;
  }
  if ( ! nullOrNumber('numlettimin') )
  {
    riepilogo += "- il numero minimo di letti deve essere un numero intero\n\n";
    isValid= false;
  }
  if ( ! nullOrNumber('numlettimax') )
  {
    riepilogo += "- il numero massimo di letti deve essere un numero intero\n\n";
    isValid= false;
  }
  if ( ! nullOrNumber('numlettitot') )
  {
    riepilogo += "- il numero totale di letti deve essere un numero intero\n\n";
    isValid= false;
  }
  if ( ! nullOrNumber('appartamenti') )
  {
    riepilogo += "- il numero di appartamenti indipendenti deve essere un numero intero\n\n";
    isValid= false;
  }
  if ( !nullOrNumber('kmcapoluogo') || !nullOrNumber('kmcasello')
      || !nullOrNumber('kmaeroporto') || !nullOrNumber('kmstazione') )
  {
    riepilogo += "- i chilometri devono essere indicati con un numero intero\n\n";
    isValid= false;
  }
  if ( ! nullOrNumber('mtmezzipubblici') )
  {
    riepilogo += "- i metri devono essere indicati con un numero intero\n\n";
    isValid= false;
  }

//  if(document.insertdati.contratto[0].checked == false)
//  {
//    riepilogo += "è necessario accettare i termini del contratto per proseguire!\n\n";
//    isValid=false;
//  }

  if (denominazione == null || denominazione == "")
  {
    riepilogo += "- denominazione è un campo obbligatorio;\n\n";
    isValid=false;
  }

  if (regione == null
      || regione == "0"
      || regione == ""
      || regione == "null"
      || regione == "regione"
      || regione == "qualsiasi")
  {
    riepilogo += "- regione è un campo obbligatorio\n\n";
    isValid=false;
  }

  if (sigla == null
      || sigla == "0"
      || sigla == ""
      || sigla == "provincia"
      || sigla == "qualsiasi")
  {
    riepilogo += "- provincia è un campo obbligatorio\n\n";
    isValid=false;
  }

  if (comune == null
      || comune == "0"
      || comune == ""
      || comune == "comune"
      || comune == "qualsiasi")
  {
    riepilogo += "- comune è un campo obbligatorio\n\n";
    isValid=false;
  }

  if (nome == null || nome == "")
  {
    riepilogo += "- nome è un campo obbligatorio\n\n";
    isValid= false;
  }


  if (cognome == null || cognome == "")
  {
    riepilogo += "- cognome è un campo obbligatorio\n\n";
    isValid= false;
  }

  if (mail == null ||  mail == "")
  {
    riepilogo += "- email è un campo obbligatorio\n\n";
    isValid= false;
  }
  else if (mail != "" && (mail.indexOf("@")==-1 || mail.indexOf(".") == -1))
  {
    riepilogo += "- email non corretta, controlla spazi, punti e chiocciola\n\n";
    isValid= false;
  }


  if ( (telefono == null || telefono == "")
      && (cellulare == null || cellulare == "")
      && (fax == null || fax == "") )
  {
    riepilogo += "- devi inserire almeno un campo tra: telefono, cellulare, fax\n\n";
    isValid= false;
  }


  if(web != null)
  {
    if (  web != "" && web.indexOf(".") == -1) {
      riepilogo += "- indirizzo web non corretto\n\n";
        isValid= false;
    }
  }


  if (anno != null)
  {
    if( isNaN(anno) )
    {
      riepilogo += "- anno deve contenere 4 numeri, ad esempio: 1982\n\n";
      isValid= false;
    }
  }

  if ( codicefiscale == null || codicefiscale.length != 16 )
  {
    riepilogo += "- il codice fiscale inserito non è corretto\n\n";
    isValid= false;
  }

  if (cap != null
      && cap != ""
        && isNaN(cap)
            && cap.length != 5 )
  {
    riepilogo += "- cap può contenere solo dati di tipo numerico e deve essere di 5 cifre\n\n";
    isValid= false;
  }


  if (annofondazione != null && isNaN(annofondazione))
  {
    riepilogo += "- anno fondazione deve contenere 4 numeri, ad esempio: 1982;\n\n";
    isValid=false;
  }

  if( ! isValid)
    alert('RIEPILOGO DEI PROBLEMI:\n\n' + riepilogo);

  return isValid;
}

function validaTipologia(){

    numcamere = document.getElementById('numcamere').value;

    if (document.forms["insertdati"].tipologia[0].checked == true && numcamere > 6)
     alert("Gli Affittacamere sono strutture ricettive composte, salvo in alcune regioni, da non più di 6 camere, con una capacità ricettiva non superiore a 12 posti letto; I valori che avete indicato sono superiori: sebbene sia possibile comunque registrarsi, verificate l'effettiva appartenenza della vostra struttura a tale categoria \n\n");
    if (document.forms["insertdati"].tipologia[2].checked == true && numcamere > 3)
     alert("I bed and breakfast sono strutture ricettive composte, salvo in alcune regioni, da non più di 3 camere, con una capacità ricettiva non superiore a 6 posti letto; I valori che avete indicato sono superiori: sebbene sia possibile comunque registrarsi, verificate l'effettiva appartenenza della vostra struttura a tale categoria \n\n");

  }

function controllaValore(i, j){

  tabi = document.forms["insertdati"].tab[i].value;
  tabj = document.forms["insertdati"].tab[j].value;

  if(tabi != null && tabj != null){
      if(tabi <= tabj)
        alert("inserire l`importo complessivo per sette notti");
  }

}


