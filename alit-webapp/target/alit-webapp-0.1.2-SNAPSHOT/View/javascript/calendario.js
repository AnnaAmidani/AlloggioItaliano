function setImgValues(imgPath, img_id) {

  var strumento = document.getElementById('selezionato').value;
  var source = '';
  var value = 0;
  if(strumento == '0') { // blank
      document.getElementById(img_id).src = imgPath + 'cal0.gif'; // blank
  }
  else if(strumento == '1') { // blue
    document.getElementById(img_id).src= imgPath + 'cal1.gif'; // blue

  }
  else if(strumento == '2') { // orange
    document.getElementById(img_id).src= imgPath + 'cal2.gif'; // orange
  }
  else if(strumento == '3') { // gray
    document.getElementById(img_id).src = imgPath + 'cal3.gif'; // gray
  }
  else if(strumento == '4') { // slash
    source = document.getElementById(img_id).src;
    value = getValue(source);
    // slash + blue = 4;  slash + orange = 5;
    if(value == 1 || value == 2 )
      document.getElementById(img_id).src= imgPath + getSource(value+3);
    else if(value == 6 || value == 7 )
      document.getElementById(img_id).src= imgPath + getSource(value-2);
  }
  else if(strumento == '5') {  // cross
    source = document.getElementById(img_id).src;
    value = getValue(source);
    // cross + blue = 6;  cross + orange = 7;
    if(value == 1 || value == 2 )
      document.getElementById(img_id).src= imgPath + getSource(value+5);
    else if(value == 4 || value == 5 )
      document.getElementById(img_id).src= imgPath + getSource(value+2);
  }
}

function getValue(imgSource) {
  if(imgSource == '')
    return 0;
  else if( imgSource.match('cal1.gif') != null)
    return 1;
  else if( imgSource.match('cal2.gif') != null)
    return 2;
  else if( imgSource.match('cal3.gif') != null)
    return 3;
  else if( imgSource.match('cal4.gif') != null)
    return 4;
  else if( imgSource.match('cal5.gif') != null)
    return 5;
  else if( imgSource.match('cal6.gif') != null)
    return 6;
  else if( imgSource.match('cal7.gif') != null)
    return 7;
  else
    return 0;
}

function getSource(imgValue) {
  
  switch(imgValue) {
    case 1 : return 'cal1.gif';
    case 2 : return 'cal2.gif';
    case 3 : return 'cal3.gif';
    case 4 : return 'cal4.gif';
    case 5 : return 'cal5.gif';
    case 6 : return 'cal6.gif';
    case 7 : return 'cal7.gif';
    default: return 0;
  }
}

function getMonthValues(month, day) {

  var i=0
  values = '{' + getValue( document.getElementById(month + '0img').src );
  for(i=1; i < day; i++) {
    values += ',' + getValue( document.getElementById(month + i + 'img').src );
  }
  values += '}';
  
  var htmlValues = '<input type="hidden" name="' + month + '" id="' + month + '" value="' + values + '"/> ';
  
  return htmlValues;
}

function write_divmesi() { 
  
  var htmlCode = '';
  
  htmlCode += getMonthValues('gennaio', 31);
  htmlCode += getMonthValues('febbraio', 29);
  htmlCode += getMonthValues('marzo', 31);
  htmlCode += getMonthValues('aprile', 30);
  htmlCode += getMonthValues('maggio', 31);
  htmlCode += getMonthValues('giugno', 30);
  htmlCode += getMonthValues('luglio', 31);
  htmlCode += getMonthValues('agosto', 31);
  htmlCode += getMonthValues('settembre', 30);
  htmlCode += getMonthValues('ottobre', 31);
  htmlCode += getMonthValues('novembre', 30);
  htmlCode += getMonthValues('dicembre', 31);
  
  document.getElementById('divmesi').innerHTML= htmlCode;
  
  return true;
}
