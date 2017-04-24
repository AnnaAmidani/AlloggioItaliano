
function browser_alert()
{
  if (document.layers)              // Netscape 4.x
    alert("Netscape 4.x");
  else if((OPER>-1))                // Opera
    alert("Opera");
  else if (document.all)            // Explorer
    alert("Explorer");
  else if (document.getElementById) //Netscape 6.x
    alert("Netscape 6.x");
}

function screen_alert()
{
  var screen_res = screen.width + 'x' + screen.height;
  alert('risoluzione schermo: ' + screen_res);
}


function random_alert()
{
  var randomNumber = Math.floor(Math.random() * 2001); /* numero random da 0 a 2000 */
  alert('numero random generato: ' + randomNumber);
}