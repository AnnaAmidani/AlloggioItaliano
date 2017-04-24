
function check(){

    camera = document.insertdati.camera[14].checked;

    if (camera == false){
      document.getElementById('x1').style.visibility='hidden';
      document.getElementById('x2').style.visibility='hidden';
      document.getElementById('x3').style.visibility='hidden';
    }
    else if(camera == true){
      document.getElementById('x1').style.visibility='visible';
      document.getElementById('x2').style.visibility='visible';
      document.getElementById('x3').style.visibility='visible';
    }
    else{alert(camera);}

  }

function check2(){

  camera = document.insertdati.camera[18].checked;

  if (camera == false){
    document.getElementById('x4').style.visibility='hidden';
    document.getElementById('x5').style.visibility='hidden';
    document.getElementById('x6').style.visibility='hidden';
    document.getElementById('x7').style.visibility='hidden';
    document.getElementById('x8').style.visibility='hidden';
  }
  else if(camera == true){
    document.getElementById('x4').style.visibility='visible';
    document.getElementById('x5').style.visibility='visible';
    document.getElementById('x6').style.visibility='visible';
    document.getElementById('x7').style.visibility='visible';
    document.getElementById('x8').style.visibility='visible';
  }
  else{alert(camera);}

}

function check3(){

  struttura = document.insertdati.struttura[1].checked;

  if (struttura == false){
    document.getElementById('x9').style.visibility='hidden';
    document.getElementById('x11').style.visibility='hidden';
    document.getElementById('xGa').style.visibility='hidden';

  }
  else if(struttura == true){
    document.getElementById('x9').style.visibility='visible';
    document.getElementById('x11').style.visibility='visible';
    document.getElementById('xGa').style.visibility='visible';

  }
  else{alert(struttura);}

}

function check4(){

  struttura = document.insertdati.struttura[14].checked;

  if (struttura == false){
    document.getElementById('x12').style.visibility='hidden';
    document.getElementById('x13').style.visibility='hidden';
    document.getElementById('x14').style.visibility='hidden';
  }
  else if(struttura == true){
    document.getElementById('x12').style.visibility='visible';
    document.getElementById('x13').style.visibility='visible';
    document.getElementById('x14').style.visibility='visible';
  }
  else{alert(struttura);}

}
