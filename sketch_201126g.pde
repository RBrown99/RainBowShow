float xoff=0.0,yoff=0.0,zoff=0.0;
float xoffr,yoffr,xoffg,yoffg,xoffb,yoffb;
int sizes=20;
int count=9;
void setup(){
  size(1280,720);
  background(0);
  
}

void draw(){
  if(count>0)
  {
    count--;
  }
  float[][] points;
  points = new float[width/sizes][height/sizes];
  float[][] r;
float[][] g;
float[][] b;
int[][] h;
r = new float[width/sizes][height/sizes];
g =new float[width/sizes][height/sizes];
b= new float[width/sizes][height/sizes];
h= new int[width/sizes][height/sizes];
clear();

strokeWeight(1.5);
  xoff=0.0;
  xoffr=0.0;
  xoffg=0.0;
  xoffb=0.0;
  for(int xp = 0;xp<width/sizes;xp++)
  {
    yoff=0.0;
    yoffr=0.0;
    yoffg=0.0;
    yoffb=0.0;
    for(int yp = 0;yp<height/sizes;yp++)
    {
    float ant = map(noise(xoff,yoff,zoff),0,1,-PI/2,PI/2);
   // r[xp][yp]=map(noise(xoffr,yoffr,zoff),0,1,0,255);
   // b[xp][yp]=map(noise(xoffg,yoffg,zoff),0,1,0,255);
   // g[xp][yp]=map(noise(xoffb,yoffb,zoff),0,1,0,255);
    h[xp][yp]=(int)map(noise(xoffb,yoffb,zoff/10),0,1,-180,540);
   float dy=(mouseY-yp*sizes);
   float dx=(mouseX-xp*sizes);
   if(dx==0)
   {
     dx=0.0001;
   }
   
   
   float an = (float)Math.atan(dy/dx) + ant;
   if(mouseX-xp*sizes<=0) an = an+PI;
   //h[xp][yp]=(int)(an*180.0/PI);
    points[xp][yp]=an;
    if(mousePressed) points[xp][yp]=an+PI;
    yoff+=0.05;
    yoffr+=0.15;
    yoffg+=0.1;
    yoffb+=0.05;
    }
    xoff+=0.05;
    xoffr+=0.15;
    xoffg+=0.10;
    xoffb+=0.05;
  }
  for(int xp = 0;xp<width/sizes;xp++)
  {
    
    for(int yp = 0;yp<height/sizes;yp++)
    {
      colorMode(HSB,360,100,100);
   
       
    stroke(h[xp][yp],99,99);
    //c[xp][yp]
    line(xp*sizes,yp*sizes,xp*sizes + float(sizes)*(float)Math.cos(points[xp][yp]),yp*sizes + float(sizes)*(float)Math.sin(points[xp][yp]));
     
     
   
    }
    
  }
  zoff+=random(1000)*0.00001;
}
