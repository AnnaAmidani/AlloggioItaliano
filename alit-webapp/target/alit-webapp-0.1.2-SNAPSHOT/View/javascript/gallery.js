function getStyle( element, styleProperty)
{
  var style = null;

  if (element.currentStyle)
  {
    // IE only
    style = element.currentStyle[styleProperty];
  }
  else if (window.getComputedStyle)
  {
    // All browser except IE
    style = document.defaultView.getComputedStyle(element, null).getPropertyValue(styleProperty);
  }

  return style;
}

/**
 * Ridimensiona e centra le immagini associate ai seguenti id:
 *  image1 image2 image3 image4 image5 image6 image7 image8 image9 image10
 * Ogni immagine DEVE essere contenuta in un div di dimensione 103x103 px.
 * L'attributo width di ogni immagine DEVE essere fissata a 103px.
 */
function resizeImages()
{
  to_reload = false;

  if( window.getComputedStyle || !document.all)
  {
    // All browsers except Internet Explorer
    for( n = 1; n <= 10; n++ )
    {
      resizeImg( 'image' + n );
    }
  }
  else
  {
    // Only InternetExplorer
    for( n = 1; n <= 10; n++ )
    {
      resizeImg_ie( 'image' + n );
    }
  }
}

/**
 * Ridimensiona e centra l'immagine con id specificato.
 * L'immagine DEVE essere contenuta in un div di dimensione 103x103 px.
 * La width del'immagine DEVE essere fissata a 103px.
 *
 * @param image_id   identificatore dell'immagine da ridimensionare e/o centrare.
 */
function resizeImg( image_id )
{
  var image;
  var image_style;
  var image_width;
  var image_height;
  var image_top;
  var image_left;
  var temp;

  // get img element
  image = document.getElementById( image_id );

  if(image == null)
    return;

  // get img style
  image_style = window.getComputedStyle( image, '' );

  // get height of img
  image_height = parseInt( image_style.getPropertyValue( 'height' ) );

  if( image_height < 103 )
  {
    // get top of img
    temp = image_style.getPropertyValue( 'top' );
    // calculate correct top of image
    image_top = parseInt( (103 - image_height) / 2 );
    if( temp != image_top )
    {
      // set top of img
      image.style.top = image_top + 'px';
    }
  }
  else if( image_height > 103 )
  {
    // get width of img
    image_width = image_style.getPropertyValue( 'width' );
    image_width = parseFloat(image_width);

    // calculate new proportionated width
    image_width = (image_width * 103) / image_height;

    // set width of img
    image.style.width = image_width + 'px';
    // set height of img
    image.style.height = '103px';
  }
}

function resizeImg_ie( image_id )
{
  var image;
  var image_style;
  var image_width;
  var image_height;
  var image_top;
  var image_left;

  // get img element
  image = document.getElementById( image_id );

  if(image == null)
    return;

  // get height of img
  image_height = getStyle( image, 'height' );
//  image_height = parseFloat(image_height);

  if( image_id == 'image1')
    alert(' height = ' + image.currentStyle['height']
        + '\n width = ' + image.currentStyle['width']
        + '\n zoom = ' + image.currentStyle['zoom']
        + '\n left = ' + image.currentStyle['left']
        );


//  if( image_height < 103 )
//  {
//    image_top = (103 - image_height) / 2;
//
//    // set top of img
//    image.style.top = image_top + 'px';
//  }
//  else if( image_height > 103 )
//  {
//    // get width of img
//    image_width = image_style.getPropertyValue( 'width' );
//    image_width = parseFloat(image_width);
//
//    // calculate new proportionated width
//    image_width = (image_width * 103) / image_height;
//
//    // set width of img
//    image.style.width = image_width + 'px';
//    // set height of img
//    image.style.height = '103px';
//  }
}
