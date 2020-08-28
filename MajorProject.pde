//Major Project: making a photo editor
//By Shelly Yang
PImage picture;
float size;
float r,g,b;
Filter filter;
Rgb editRgb;
Contrast haveContrast;

void setup(){
  size(1300,800);
  picture = loadImage("picnotfilter.jpg");
  picture.resize(width-200,height-80);
  filter = new Filter();
  editRgb = new Rgb();
  haveContrast = new Contrast();
  image(picture,0,0);
  
}

void draw(){
  
  //background(255);
  image(picture,0,0);
  editRgb.display();
  drawButton(); 
  editBrightness();
  editRgb.movingRgb();
  saveImage();
  cancel();
  contrast();
  //haveContrast.blur();
  //noLoop();
}


void drawButton(){
  for (int i = 0; i<5;i++){
    fill(255);
    rect(180*i,720,180,80,30);
  }
  fill(0);
  textSize(20);
  text("Grey",70,770);
  text("Clarendon",230,770);
  text("Hudson",410,770);
  text("Rise",600,770);
  text("X-Pro II",770,770);
  
  rect(picture.width,0,100,picture.height/8);
  fill(255);
  text("Sharpen",picture.width+15,40);
  rect(picture.width+100,0,100,picture.height/8);
  fill(0);
  text("Blur",picture.width+130,40);
  
  fill(255);
  rect(picture.width,picture.height/8*5,width-picture.width,picture.height/8);
  fill(0);
  text("Invert Color", picture.width*1.03,picture.height/8*5.6);
  
}

void chooseFilter(){
  if (mouseX>=0 && mouseX<=180){
    redraw();
    picture = loadImage("picnotfilter.jpg");
    picture.resize(width-200,height-80);
    image(picture,0,0);
    filter.greyFilter();
  }
  else if(mouseX>=180 && mouseX<=360) {
    redraw();
    picture = loadImage("picnotfilter.jpg");
    picture.resize(width-200,height-80);
    image(picture,0,0);
    
    filter.clarendon();
  }
  else if(mouseX>=360 && mouseX<=540) {
    redraw();
    picture = loadImage("picnotfilter.jpg");
    picture.resize(width-200,height-80);
    image(picture,0,0);
    filter.hudson();
  }
  else if(mouseX>=540 && mouseX<=720) {
    redraw();
    picture = loadImage("picnotfilter.jpg");
    picture.resize(width-200,height-80);
    image(picture,0,0);
    filter.rise();
  }
  else if(mouseX>=720 && mouseX<=900) {
    redraw();
    picture = loadImage("picnotfilter.jpg");
    picture.resize(width-200,height-80);
    image(picture,0,0);
    filter.xProII();
  }
}

void mouseClicked(){
  if (mouseY>=720 && mouseY <=height){
    chooseFilter();
  }
  else if (mouseY <=80 && mouseY>=0&& mouseX<=100 && mouseX >= 0){
    cancel();
  }
  else if (mouseY>=0 && mouseY<=picture.height/8 && mouseX>=picture.width){
    if ( mouseX <=picture.width+100){
      
      haveContrast.sharpen();
      println("sharpen");
      redraw();
    }
    else if (mouseX >= picture.width+100 && mouseX <=width){
      haveContrast.blur();
      redraw();
      
    }
  }
  
  else if (mouseX >=picture.width && mouseX <= width && mouseY >= picture.height/8*5 && mouseY<= picture.height/8*6){
    invert();
    redraw();
  }
  else {
    editRgb.movingRgb();
    redraw();
  }
  
  
}

void cancel(){
  fill(255);
  rect(picture.width,picture.height-picture.height/8,width-picture.width,picture.height/8);
  fill(0);
  text("Cancel",picture.width+picture.width/100*5,picture.height-picture.height/100*4.5);
  //picture = loadImage("picnotfilter.jpg");
  //picture.resize(width,height-80);
  image(picture,0,0);

  //println("cancel");
}

void saveImage(){
  fill(255);
  rect(picture.width, picture.height-picture.height/4, width-picture.width, picture.height/8);
  fill(0);
  text("Save Your Image", picture.width+picture.width/100*2,picture.height-picture.height/5.5);
}

void editBrightness(){
  int locx = picture.width+10;
  fill(255);
  rect(picture.width,picture.height/8,200,picture.height/8*2);
  fill(0);
  line(locx,220,locx+180,220);
  ellipseMode(CENTER);
  ellipse(picture.width+100,picture.height/8*2.46,15,15);
  textSize(20);
  text("Brightness",picture.width+30,picture.height/8*1.6);
  if (mousePressed && mouseX>=1000-15/2 && mouseX<= 1180+15/2&& mouseY>=720-15/2 && mouseY<= 720+15/2){
    locx = mouseX; 
  }
}

void contrast(){
  stroke(0);
  fill(255);
  rect(picture.width,picture.height/8*3,width-picture.width,picture.height/8*2);
  fill(0);
  text("Contrast",picture.width*1.05,picture.height/8*3.6);
  line(picture.width+20,picture.height/8*4.4,picture.width+180,picture.height/8*4.4);
  ellipseMode(CENTER);
  ellipse(picture.width+100,picture.height/8*4.4,15,15);

}

void invert(){
  picture.loadPixels();
  
  for (int i = 0; i<=picture.width*picture.height-1;i++){
    color thePixelsColor = picture.pixels[i];
    r= 255-red(thePixelsColor);
    g= 255-green(thePixelsColor);
    b= 255-blue(thePixelsColor);
    
    picture.pixels[i] = color(r,g,b);  
    
  }
  
  picture.updatePixels();
}