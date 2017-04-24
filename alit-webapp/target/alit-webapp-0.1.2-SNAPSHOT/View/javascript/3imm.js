
  /* array delle immagini per la check-box a tre valori (indiff.png, si.png, no.png) */
  var imagesVector = new Array();

  /* path della cartella contenente le immagini per la check-box a tre valori (indiff.png, si.png, no.png) */
  var folder = "";

  /* stringa contenente tutti i valori delle check-box a tre valori (0 - 1 - 2) */
  var valore = "";

  /* array contenente tutti i valori delle 59 check-box a tre valori */
  var ricercaParam = new Array(59);

  /*
   * inizzializza l'array delle immagini per la check-box a tre valori:
   *   # 0 == indiff.png
   *  # 1 == si.png
   *  # 2 == no.png
   */
  function initializeImageVector(){
    imagesVector[0] = folder + 'indiff.png';
    imagesVector[1] = folder + 'si.png';
    imagesVector[2] = folder + 'no.png';
  }

  /*
   * Inizializza l'array ricercaParam a 0 quando viene importato questo file js
   */
  for(i=0; i<59; i++)
    ricercaParam[i]= 0;

  /*
   * ritorna l'immagine successiva per la check-box a tre valori (0 - 1 - 2)
   */
  function clicktest( numero ) {
    folder = document.findalloggio.folder.value;
    initializeImageVector();
    ricercaParam[numero] = successore(ricercaParam[numero])
    switch(numero) {
      case 0 : document.findalloggio.q0.src = imagesVector[ ricercaParam[numero] ]; break;
      case 1 : document.findalloggio.q1.src = imagesVector[ ricercaParam[numero] ]; break;
      case 2 : document.findalloggio.q2.src = imagesVector[ ricercaParam[numero] ];
        if(document.findalloggio.q2.src.indexOf("si.png") != -1)
          document.getElementById('parcheggio').disabled=false;
        else
          document.getElementById('parcheggio').disabled=true;          break;
      case 3 : document.findalloggio.q3.src = imagesVector[ ricercaParam[numero] ]; break;
      case 4 : document.findalloggio.q4.src = imagesVector[ ricercaParam[numero] ]; break;
      case 5 : document.findalloggio.q5.src = imagesVector[ ricercaParam[numero] ]; break;
      case 6 : document.findalloggio.q6.src = imagesVector[ ricercaParam[numero] ];
        if(document.findalloggio.q6.src.indexOf("si.png") != -1)
          document.getElementById('numcamere').disabled=false;
        else
          document.getElementById('parcheggio').disabled=true;          break;
      case 7 : document.findalloggio.q7.src = imagesVector[ ricercaParam[numero] ];
        if( document.findalloggio.q7.src.indexOf("si.png") != -1 ){
            document.getElementById('numlettimin').disabled=false;
            document.getElementById('numlettimax').disabled=false;
        }
        else {
            document.getElementById('numlettimin').disabled=true;
             document.getElementById('numlettimax').disabled=true;
        }                                      break;
      case 8 : document.findalloggio.q8.src = imagesVector[ ricercaParam[numero] ]; break;
      case 9 : document.findalloggio.q9.src = imagesVector[ ricercaParam[numero] ]; break;
      case 10 : document.findalloggio.q10.src = imagesVector[ ricercaParam[numero] ]; break;
      case 11 : document.findalloggio.q11.src = imagesVector[ ricercaParam[numero] ]; break;
      case 12 : document.findalloggio.q12.src = imagesVector[ ricercaParam[numero] ]; break;
      case 13 : document.findalloggio.q13.src = imagesVector[ ricercaParam[numero] ]; break;
      case 14 : document.findalloggio.q14.src = imagesVector[ ricercaParam[numero] ]; break;
      case 15 : document.findalloggio.q15.src = imagesVector[ ricercaParam[numero] ]; break;
      case 16 : document.findalloggio.q16.src = imagesVector[ ricercaParam[numero] ];
        if( document.findalloggio.q16.src.indexOf("si.png") != -1 )
          document.getElementById('tv').disabled=false;
        else
          document.getElementById('tv').disabled=true;              break;
      case 17 : document.findalloggio.q17.src = imagesVector[ ricercaParam[numero] ];
        if( document.findalloggio.q17.src.indexOf("si.png") != -1 )
        document.getElementById('internet').disabled=false;
        else
          document.getElementById('internet').disabled=true;            break;
      case 18 : document.findalloggio.q18.src = imagesVector[ ricercaParam[numero] ]; break;
      case 19 : document.findalloggio.q19.src = imagesVector[ ricercaParam[numero] ]; break;
      case 20 : document.findalloggio.q20.src = imagesVector[ ricercaParam[numero] ];
        if( document.findalloggio.q20.src.indexOf("si.png") != -1 )
          document.getElementById('bagno').disabled=false;
          else
            document.getElementById('bagno').disabled=true;            break;
      case 21 : document.findalloggio.q21.src = imagesVector[ ricercaParam[numero] ]; break;
      case 22 : document.findalloggio.q22.src = imagesVector[ ricercaParam[numero] ];
        if( document.findalloggio.q22.src.indexOf("si.png") != -1 )
          document.getElementById('con vasca').disabled=false;
          else
            document.getElementById('con vasca').disabled=true;          break;
      case 23 : document.findalloggio.q23.src = imagesVector[ ricercaParam[numero] ]; break;
      case 24 : document.findalloggio.q24.src = imagesVector[ ricercaParam[numero] ]; break;
      case 25 : document.findalloggio.q25.src = imagesVector[ ricercaParam[numero] ]; break;
      case 26 : document.findalloggio.q26.src = imagesVector[ ricercaParam[numero] ]; break;
      case 27 : document.findalloggio.q27.src = imagesVector[ ricercaParam[numero] ];
        if( document.findalloggio.q27.src.indexOf("si.png") != -1 )
          document.getElementById('colazione').disabled=false;
          else
            document.getElementById('colazione').disabled=true;          break;
      case 28 : document.findalloggio.q28.src = imagesVector[ ricercaParam[numero] ];
        if( document.findalloggio.q28.src.indexOf("si.png") != -1 )
          document.getElementById('menu').disabled=false;
          else
            document.getElementById('menu').disabled=true;            break;
      case 29 : document.findalloggio.q29.src = imagesVector[ ricercaParam[numero] ]; break;
      case 30 : document.findalloggio.q30.src = imagesVector[ ricercaParam[numero] ]; break;
      case 31 : document.findalloggio.q31.src = imagesVector[ ricercaParam[numero] ]; break;
      case 32 : document.findalloggio.q32.src = imagesVector[ ricercaParam[numero] ]; break;
      case 33 : document.findalloggio.q33.src = imagesVector[ ricercaParam[numero] ]; break;
      case 34 : document.findalloggio.q34.src = imagesVector[ ricercaParam[numero] ]; break;
      case 35 : document.findalloggio.q35.src = imagesVector[ ricercaParam[numero] ]; break;
      case 36 : document.findalloggio.q36.src = imagesVector[ ricercaParam[numero] ]; break;
      case 37 : document.findalloggio.q37.src = imagesVector[ ricercaParam[numero] ]; break;
      case 38 : document.findalloggio.q38.src = imagesVector[ ricercaParam[numero] ]; break;
      case 39 : document.findalloggio.q39.src = imagesVector[ ricercaParam[numero] ]; break;
      case 40 : document.findalloggio.q40.src = imagesVector[ ricercaParam[numero] ]; break;
      case 41 : document.findalloggio.q41.src = imagesVector[ ricercaParam[numero] ]; break;
      case 42 : document.findalloggio.q42.src = imagesVector[ ricercaParam[numero] ]; break;
      case 43 : document.findalloggio.q43.src = imagesVector[ ricercaParam[numero] ]; break;
      case 44 : document.findalloggio.q44.src = imagesVector[ ricercaParam[numero] ]; break;
      case 45 : document.findalloggio.q45.src = imagesVector[ ricercaParam[numero] ]; break;
      case 46 : document.findalloggio.q46.src = imagesVector[ ricercaParam[numero] ]; break;
      case 47 : document.findalloggio.q47.src = imagesVector[ ricercaParam[numero] ];
        if( document.findalloggio.q47.src.indexOf("si.png") != -1 )
          document.getElementById('noleggio').disabled=false;
          else
            document.getElementById('noleggio').disabled=true;          break;
      case 48 : document.findalloggio.q48.src = imagesVector[ ricercaParam[numero] ]; break;
      case 49 : document.findalloggio.q49.src = imagesVector[ ricercaParam[numero] ]; break;
      case 50 : document.findalloggio.q50.src = imagesVector[ ricercaParam[numero] ]; break;
      case 51 : document.findalloggio.q51.src = imagesVector[ ricercaParam[numero] ]; break;
      case 52 : document.findalloggio.q52.src = imagesVector[ ricercaParam[numero] ]; break;
      case 53 : document.findalloggio.q53.src = imagesVector[ ricercaParam[numero] ]; break;
      case 54 : document.findalloggio.q54.src = imagesVector[ ricercaParam[numero] ];
        if( document.findalloggio.q54.src.indexOf("si.png") != -1 )
          document.getElementById('kmaeroporto').disabled=false;
          else
            document.getElementById('kmaeroporto').disabled=true;        break;
      case 55 : document.findalloggio.q55.src = imagesVector[ ricercaParam[numero] ];
        if( document.findalloggio.q55.src.indexOf("si.png") != -1 )
          document.getElementById('kmstazione').disabled=false;
          else
            document.getElementById('kmstazione').disabled=true;        break;
      case 56 : document.findalloggio.q56.src = imagesVector[ ricercaParam[numero] ];
        if( document.findalloggio.q56.src.indexOf("si.png") != -1 )
          document.getElementById('kmcasello').disabled=false;
          else
            document.getElementById('kmcasello').disabled=true;          break;
      case 57 : document.findalloggio.q57.src = imagesVector[ ricercaParam[numero] ];
        if( document.findalloggio.q57.src.indexOf("si.png") != -1 )
          document.getElementById('mtmezzipubblici').disabled=false;
          else
            document.getElementById('mtmezzipubblici').disabled=true;      break;
      case 58 : document.findalloggio.q58.src = imagesVector[ ricercaParam[numero] ]; break;
    }

  }

  /*
   * ritorna il valore successivo per la check-box a tre valori (0 - 1 - 2)
   */
  function successore(n) {
    n++;
    if(n == 3)
      n = 0;

    return n;
  }


  function formatFourArray() {

    htmlCode = '';

    for(i in ricercaParam) {
      valore +=(ricercaParam[i]+'');
    }

    htmlCode += '<input type="hidden" name="fourArray" id="fourArray" value="' + valore + '"/> \n';

    return htmlCode;
  }

  /*
   * Funzione chiamata al submit della 2° form di CercaAlloggio.js (effettua ricerca):
   *  (1) la funzione ottiene i valori dei campi all'interno della 1° form
   *  (2) scrive tali valori nel <div id='jsDrop'> posto all'interno della 2° form
   *  (3) scrive inoltre nel campo string fourArray tutti i valori indifferente/richiesto/indesiderato
   */
  function writeDrop(){

    var drop = '';

    var regione = document.getElementById('regione').value;
    var sigla = document.getElementById('sigla').value;
    var comune = document.getElementById('comune').value;
    var distretto = document.getElementById('distretto').value;
    var denominazione = document.getElementById('denominazione').value;
    var tipologia = document.getElementById('tipologia').value;
    var prezzomedioDa = document.getElementById('prezzomedioDa').value;
    var prezzomedioA = document.getElementById('prezzomedioA').value;
    var include = document.getElementById('include').value;
    var posizione = document.getElementById('posizione').value;
    var prenotazione = document.getElementById('prenotazione').value;
    var pagamento = document.getElementById('pagamento').value;
    var lingue = document.getElementById('lingue').value;
    var annofondazione = document.getElementById('annofondazione').value;

    drop = '<input type="hidden" name="regione" id="regione" value="' + regione + '" /> \n';
    drop += '<input type="hidden" name="sigla" id="sigla" value="' + sigla + '" /> \n';
    drop += '<input type="hidden" name="comune" id="comune" value="' + comune + '" /> \n';
    drop += '<input type="hidden" name="distretto" id="distretto" value="' + distretto + '" /> \n';
    drop += '<input type="hidden" name="denominazione" id="denominazione" value="' + denominazione + '" /> \n';
    drop += '<input type="hidden" name="tipologia" id="tipologia" value="' + tipologia + '" /> \n';
    drop += '<input type="hidden" name="prezzomedioDa" id="prezzomedioDa" value="' + prezzomedioDa + '" /> \n';
    drop += '<input type="hidden" name="prezzomedioA" id="prezzomedioA" value="' + prezzomedioA + '" /> \n';
    drop += '<input type="hidden" name="include" id="include" value="' + include + '" /> \n';
    drop += '<input type="hidden" name="posizione" id="posizione" value="' + posizione + '" /> \n';
    drop += '<input type="hidden" name="prenotazione" id="prenotazione" value="' + prenotazione + '" /> \n';
    drop += '<input type="hidden" name="pagamento" id="pagamento" value="' + pagamento + '" /> \n';
    drop += '<input type="hidden" name="lingue" id="lingue" value="' + lingue + '" /> \n';
    drop += '<input type="hidden" name="annofondazione" id="annofondazione" value="' + annofondazione + '" /> \n';
    drop += formatFourArray();

    document.getElementById('jsDrop').innerHTML = drop;

  }