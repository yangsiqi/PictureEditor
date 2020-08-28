class Filter{
  //data
  float r,g,b;
  
  //construction
  Filter(){
  
  }
  
  
  //display
  
  void greyFilter(){
    image(picture,0,0);
    picture.loadPixels();
    for (int i= 0 ; i< picture.width*picture.height; i++){
      color thePixelsColor = picture.pixels[i];
      r= red(thePixelsColor);
      g= green(thePixelsColor);
      b= blue(thePixelsColor);
      
      float greyfilter = (r+g+b)/5;
      color greyColor = color(greyfilter,greyfilter,greyfilter);
      
      picture.pixels[i] = color(greyColor);

  
    }
   picture.updatePixels();
  }
  
  void clarendon(){
    image(picture,0,0);
    picture.loadPixels();
    for (int i= 0 ; i< picture.width*picture.height; i++){
      color thePixelsColor = picture.pixels[i];
      r= red(thePixelsColor);
      g= green(thePixelsColor);
      b= blue(thePixelsColor);
      
      color clarColor = color(r*1.5,g*1.5,b*1.5);
      
      picture.pixels[i] = color(clarColor);

  
    }
   picture.updatePixels();
  }
  
  void hudson(){
    image(picture,0,0);
    picture.loadPixels();
    for (int i= 0 ; i< picture.width*picture.height; i++){
      color thePixelsColor = picture.pixels[i];
      r= red(thePixelsColor);
      g= green(thePixelsColor);
      b= blue(thePixelsColor);
      
      color hudsonColor = color(r*1.1,g*1.2,b*1.5);
      
      picture.pixels[i] = color(hudsonColor);

  
    }
   picture.updatePixels();
  }
  void rise(){
    image(picture,0,0);
    picture.loadPixels();
    for (int i= 0 ; i< picture.width*picture.height; i++){
      color thePixelsColor = picture.pixels[i];
      r= red(thePixelsColor);
      g= green(thePixelsColor);
      b= blue(thePixelsColor);
      
      color riseColor = color(r*1.5,g*1.3,b);
      
      picture.pixels[i] = color(riseColor);

  
    }
   picture.updatePixels();
  }
  void xProII(){
    image(picture,0,0);
    picture.loadPixels();
    for (int y = 0; y<picture.height; y++){
      for (int x= 0 ; x< picture.width; x++){
        color thePixelsColor = picture.pixels[picture.width*y+x];
        r= red(thePixelsColor);
        g= green(thePixelsColor);
        b= blue(thePixelsColor);
        
        float  d = dist(x,y,picture.width/2,picture.height/2);
        
        int theloc = y*picture.width+x;
        r = r-d/10;
        g = g-d/10;
        b = b-d/10;
        color theColor = color(r,g,b);
        
        picture.pixels[theloc] = color(theColor);

      }
    }
   picture.updatePixels();
  }
  
 
}