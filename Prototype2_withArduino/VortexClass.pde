class Vortex
{
  int X;
  int Y;
  int scale = 0;
  int hungry_time = 0;
  boolean collided = false;
  int VortexW = 40; // R=20
  int VortexH = 40;
  int Xmin = VortexW/2;
  int Xmax = width - Xmin;
  int Ymin = VortexH/2 + marginUpper;
  int Ymax = height - VortexH/2 - marginBottom;
  float VortexYVelocity = 1.8;
  PImage photoVortex_ori = loadImage("data/vortex3.png");
  PImage photoVortex;
  
  public Vortex () {
    photoVortex = loadImage("data/vortex3.png");
    photoVortex.resize(VortexW, VortexH);
    
    X = int(random(Xmin, Xmax));
    Y = int(random(Ymin, Ymax));
  }
  
  void checkState(int ballXPos, int ballYPos, scoreboard board){
    // detect collision
    float dis = dist(ballXPos, ballYPos, X, Y);
    if (dis <= 20 + scale * 15){
    collided = true;
    hungry_time = 0;
    board.life -= 1;
    soundVortex.play();
    }
    else{
      collided = false;
      hungry_time += 1;
    }
    
    // detect place change
    if (hungry_time == 1800){
      X = int(random(Xmin, Xmax));
      Y = int(random(Ymin, Ymax));
      if (scale>0){
        scale -= 1;
        VortexH = 40 + scale * 30;
        VortexW = 40 + scale * 30;
        photoVortex.resize(VortexW, VortexH); // make it 1 scale smaller
      }
    }
  }
  
  void display() {
    checkState(ballXPos, ballYPos, board);
    if (collided==true){
      scale += 1;
      // originate ball
      ballXPos = width/2;
      ballYPos = marginUpper;
      ballXVelocity = 2;
      ballYVelocity = 1.2;
    }
    // make vortex larger
    if (VortexW < 40 + scale * 30){
      VortexW += 5;
      VortexH += 5;
      photoVortex = photoVortex_ori.copy();
      photoVortex.resize(VortexW, VortexH);
    }
    image(photoVortex, X, Y);
    //println(scale);
  }
}
