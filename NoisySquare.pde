float noiseScale;
float newScale;
float xstart;
float ystart;
float noiseTime;
float noiseCall;
float ellipseSize;
float dotColorR, dotColorG, dotColorB;
float yMapper;
float xMapper;

void setup() {
  size(800, 800, P3D);
  background(150);
  stroke(255, 250);
  fill(0, 250);
  //rectMode(CENTER);
  noiseScale=0;
  xstart=random(10);
  ystart=random(10);
  noiseScale=0;   //temporary noisescale assignment
  noiseTime=0;
  ellipseSize=0;
  frameRate(12);
}

void draw() {
 // ellipseSize=map(mouseY,0,height,0,10);
  background(0, 255);
//camera(mouseY*2, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  //noiseScale+=.001*(mouseX/10); //the mouseX controls the rate of change, to put this back, just erase mousex/10
  //noiseTime+=.001;
  yMapper= map(mouseY,0,height,-0.001,0.001);
  xMapper=map(mouseX,0,height,-0.04,0.04);
  xstart+=xMapper;
  ystart+=xMapper;
  noiseScale+= yMapper;
  //noiseScale=.03;   
  noiseTime=noiseScale;

  float ynoise=ystart;
  for (float y=- (height/10); y<=(height/10); y+=2) {
    ynoise +=noiseTime;
    float xnoise=xstart;
    for (float x=- (width/10); x<=(width/10); x+=2) {
      xnoise+=noiseTime;
      noiseCall=noise(xnoise, ynoise);
     //  println(noiseTime);
     // println(noiseScale);
      //if(noiseScale!=newScale){
      drawPoint(x, y, noiseCall);
      //}
      //else
      ;
    }
  }
  //delay (500);
  //noiseScale=.5*(noiseScale+newScale);
  newScale=noiseScale;
}
void drawPoint(float x, float y, float noiseFactor) {
  dotColorR=map(noiseFactor,0,1,0,255);
  dotColorG=map(noiseFactor,0,1,255,0);
  pushMatrix();
  translate(x*noiseFactor*4, y*noiseFactor*4, -y);
  float edgeSize=3*noiseFactor+ellipseSize;
  stroke(dotColorR,dotColorG,255);
  fill(dotColorR,dotColorG,255);
  //println(dotColor);
  ellipse(width/2, height/2, edgeSize, edgeSize);
  popMatrix();
}

void mouseReleased(){
noiseScale=0;
  xstart=random(10);
  ystart=random(10);
}

