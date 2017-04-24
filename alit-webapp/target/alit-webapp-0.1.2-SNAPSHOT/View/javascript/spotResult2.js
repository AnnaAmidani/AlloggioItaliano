
var source2 = ''; 
var slo2 = '';

  
function getSecondImage() {
    
    htmlCode = '';

    source2 = document.getElementById('secondImage').src;
    slo2 = document.getElementById('slogan2').value;

      htmlCode += '<img src="' + source2 + '" class="spot"/><div style="position: absolute; top: 10px; left: 20px; text-align:center;">' + slo2;
      
      return htmlCode;
    }
    
    function getSecondAction() { 
      
      document.getElementById('divb').innerHTML=getSecondImage(); 
      
      alert(slo2);
      
    }