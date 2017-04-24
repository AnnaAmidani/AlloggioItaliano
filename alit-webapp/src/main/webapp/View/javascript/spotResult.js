
function getFirstImage()
{
  var htmlCode = '';

  var source = document.getElementById('firstImage').src;
  var slo = document.getElementById('slogan1').value;

  htmlCode += '<img src="' + source + '" class="spot"/>  <div class="text_preview">' + slo + '</div>';

  return htmlCode;
}

function getSecondImage()
{
  var htmlCode = '';

  var source2 = document.getElementById('secondImage').src;
  var slo2 = document.getElementById('slogan2').value;

  htmlCode += '<img src="' + source2 + '" class="spot"/> <div class="text_preview">' + slo2 + '</div>';
  return htmlCode;
}

function getFirstAction()
{
  document.getElementById('diva').innerHTML=getFirstImage();
}

function getSecondAction()
{
  document.getElementById('divb').innerHTML=getSecondImage();
}
