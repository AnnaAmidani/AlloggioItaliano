
  var imagesVector = new Array();
  var imagesLength = 0;
  var currentIndex = 0;
  var imagesPresent = 0;

  function intilizeImagesVector()
  {
    var images = new Array();
    var index = -1;

    if(document.slide.image0 != null)
    {
      images[++index] = document.slide.image0.value;
    }
    if(document.slide.image1 != null)
    {
	  images[++index] = document.slide.image1.value;
    }
    if(document.slide.image2 != null)
    {
	  images[++index] = document.slide.image2.value;
    }
    if(document.slide.image3 != null)
    {
	  images[++index] = document.slide.image3.value;
    }
    if(document.slide.image4 != null)
    {
	  images[++index] = document.slide.image4.value;
    }
    if(document.slide.image5 != null)
    {
	  images[++index] = document.slide.image5.value;
    }
    if(document.slide.image6 != null)
    {
	  images[++index] = document.slide.image6.value;
    }
    if(document.slide.image7 != null)
    {
	  images[++index] = document.slide.image7.value;
    }
    if(document.slide.image8 != null)
    {
	  images[++index] = document.slide.image8.value;
    }
    if(document.slide.image9 != null)
    {
	  images[++index] = document.slide.image9.value;
    }

    imagesPresent = images.length;
    //alert(imagesPresent);

    /*
    var index = 0;
    for(i=0; i<10; i++) {
      if(images[i] != null)
      {
    	imagesPresent = index;
    	alert("immagini presenti"+imagesPresent);
        //imagesVector[index] = folder + '/' + images[i];
        index++;
      }
    }
    imagesLength = index;
    */
  }

  function changeSlide(direction, userId, context)
  {
	intilizeImagesVector();
    var num = 0;

    num = document.getElementById("num").value;

    if(direction == 'forward')
    {
      if(num < imagesPresent)
        ++num;
      else
        num = 1;
    }

    if(direction == 'back')
    {
      if(num > 1)
        --num;
      else
        num = imagesPresent;
    }

    if(num != 10)
      num = "0" + num;

    document.getElementById("num").value = num;
    document.slide.q0.src = context + "/View/image.jsp?image=" + num + "&id_azienda=" + userId + "";
  }

  function forward(n) {
    if(imagesLength == 0)
      return 0;

    n++;
    if(n == imagesLength)
      n = 0;
    return n;
  }

  function back(n) {
    if(imagesLength == 0)
      return 0;

    n--;
    if(n == -1)
      n = imagesLength-1;
    return n;
  }

  oW = 310;
  oH = 220;
  zW = 60;
  zH = 50;


  function zoom(dim1, dim2) {
    if(dim1){
      if(document.getElementById("examplemap").width < oW){
        document.getElementById("examplemap").width   = oW;
        document.getElementById("examplemap").height  = oH;
      } else {
        document.getElementById("examplemap").width  += dim1;
        document.getElementById("examplemap").height += dim2;
      }
      if(dim1 < 0){
        if(document.getElementById("examplemap").width < oW){
          document.getElementById("examplemap").width   = oW;
          document.getElementById("examplemap").height  = oH;
        }
      }
    } else {
      document.getElementById("examplemap").width   = oW;
      document.getElementById("examplemap").height  = oH;
    }
}

