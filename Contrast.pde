class Contrast{
  float r,g,b;
  float[][]  martixSharpen = {{-1,-1,-1},
                        {-1,9,-1},
                        {-1,-1,-1}};
  float[][] martixBlur = {{1.0/9.0,1.0/9.0,1.0/9.0},
                          {1.0/9.0,1.0/9.0,1.0/9.0},
                          {1.0/9.0,1.0/9.0,1.0/9.0},};                
  float sharpenControl1;
  float sharpenControl2;
  float blurControl1;
  float blurControl2;
  //float newR , newG,newB;
  Contrast(){
    
    sharpenControl1 = 0;
    blurControl1 = 0;
    sharpenControl2 = 0;
    blurControl2 = 0;      
  }
 
  void display(){
    loadPixels();
    for (int x= 0; x < width-1; x++){
     for(int y = 0; y< height-1; y++){
       
      
       int loc1 = y*width +x;
       int loc2 = y* width + x-1;
       
       float r1 = red(pixels[loc1]);
       float r2 = red(pixels[loc2]);
       float g1 = green(pixels[loc1]);
       float g2 = green(pixels[loc2]);
       float b1 = blue(pixels[loc1]);
       float b2 = blue(pixels[loc2]);
       
       float difference = abs(r1-r2);
       
      }
    }
    updatePixels();
  }
    
  void sharpen(){
    image(picture,0,0);
    picture.loadPixels();
    
    PImage newImg = createImage(picture.width,picture.height,RGB);
    for(int x= 1; x <=picture.width-2; x++){
      for (int y = 1; y<=picture.height-2; y++){
        float newR =0;
        float newG =0;
        float newB =0;
        for (int kx = -1; kx<=1; kx++){
          for (int ky = -1; ky<=1 ; ky++){
            int loc=(y+ky)*picture.width +x+kx;          
            newR +=martixSharpen[kx+1][ky+1]*red(picture.pixels[loc]);
            newG += martixSharpen[kx+1][ky+1]*green(picture.pixels[loc]);
            newB += martixSharpen[kx+1][ky+1]*blue(picture.pixels[loc]);
            
      
          }
        }
        
        int pos = y*picture.width+x;
        picture.pixels[pos]= color(newR,newG,newB);
      }
    }
    picture.updatePixels();
    image(picture,0,0);
  }
  
  void blur(){
    image(picture,0,0);

    picture.loadPixels();    
    PImage newImg = createImage(picture.width,picture.height,RGB);
    for(int x= 1; x <=picture.width-2; x++){
      for (int y = 1; y<=picture.height-2; y++){
        float newR =0;
        float newG =0;
        float newB =0;
        for (int kx = -1; kx<=1; kx++){
          for (int ky = -1; ky<=1 ; ky++){
            int loc=(y+ky)*picture.width +x+kx;          
            newR +=martixBlur[kx+1][ky+1]*red(picture.pixels[loc]);
            newG += martixBlur[kx+1][ky+1]*green(picture.pixels[loc]);
            newB += martixBlur[kx+1][ky+1]*blue(picture.pixels[loc]);
            
      
          }
        }
        
        int pos = y*picture.width+x;
        picture.pixels[pos]= color(newR,newG,newB);
      }
    }
    picture.updatePixels();
    image(picture,0,0);
    println("blur");
    
  }

}