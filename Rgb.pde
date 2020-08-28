class Rgb{
  //data
  float r,g,b;
  int posOfR,posOfG,posOfB;
  int size;
  //construction
  Rgb(){
    size = 15;
    posOfR= 1090;
    posOfG = 1090;
    posOfB = 1090;
    
  }
  
  //behavior
  void display(){
    line(1000,740,1180,740);
    line(1000,760,1180,760);
    line(1000,780,1180,780);
    
    ellipseMode(CENTER);
    
    fill(100);
    ellipse(posOfR,740,size,size);
    ellipse(posOfG,760,size,size);
    ellipse(posOfB,780,size,size);
    
    text("R", 930,745);
    text("G", 930,765);
    text("B", 930,785);
    
    movingRgb();
  }
  void movingRgb(){
    if (mouseX>=990 && mouseX <=1190 && mouseY>+ 740-size && mouseY<=780+size){

      if (mouseX>= posOfR-size && mouseX <= posOfR + size && mouseY >= 740-size && mouseY <= 740+size){      
        posOfR = mouseX;
      }
      else if (mouseX>= posOfG-size && mouseX <= posOfG + size && mouseY >= 760-size && mouseY <= 760+size){
        posOfG = mouseX;
      }
      else if (mouseX>= posOfB-size && mouseX <= posOfB + size && mouseY >= 780-size && mouseY <= 780+size){
        posOfB = mouseX;
      }
      
      picture.loadPixels();
        for (int i= 0 ; i< picture.width*picture.height; i++){
          color thePixelsColor = picture.pixels[i];
          r= red(thePixelsColor);
          g= green(thePixelsColor);
          b= blue(thePixelsColor);
          
          if (pmouseX<= mouseX){
            r = r+(posOfR-1090)*180/255/5;
            g = g+(posOfG-1090)*180/255/5;
            b = b+(posOfB-1090)*180/255/5;
          }
          else if (pmouseX >= mouseX){
            r = r-(posOfR-1090)*180/255/5;
            g = g-(posOfG-1090)*180/255/5;
            b = b-(posOfB-1090)*180/255/5;
          }
          
          
          r = constrain(r,0,255);
          g = constrain(g,0,255);
          b = constrain(b,0,255);
          
          color rgb = color(r,g,b);
          
          picture.pixels[i] = color(rgb);
    
      
        }
       picture.updatePixels();
     }
  }
  
}