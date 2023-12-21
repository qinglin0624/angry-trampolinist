class Bomb 
{
  int X;
  int Y;
  boolean collided = false;
  boolean invisible = false;
  int BombW = 25;
  int BombH = 30;
  int Xmin = BombW/2;
  int Xmax = width - Xmin;
  int Ymin = BombH/2 + marginUpper;
  int Ymax = height - BombH/2 - marginBottom;
  float BombYVelocity = 1.8;
  
  public Bomb () {
    //photoBomb.resize(BombW, BombH);
    
    X = int(random(Xmin, Xmax));
    Y = int(random(Ymin, Ymax));
    
  }
  
  void checkState(int ballXPos, int ballYPos, scoreboard board){
    float dis = dist(ballXPos, ballYPos, X, Y);
    if (dis<=20){
    collided = true;
    if (userMode==1){
      board.life -= 1;
    }
    soundBomb.play();
    explodeCount += 250;
    }
    else{
      collided = false;
    }    
  }
  
  void display() {
    if (collided==false){
      checkState(ballXPos, ballYPos, board);
      image(photoBomb, X, Y);
    }
    else{
      image(photoBomb, X, Y);
      Y += BombYVelocity;
      BombYVelocity += planet.gravity;
      // detect collected
      if (userMode==2){
        if (Y<=39*a && Y>=35*a && abs(X-LuigiXPos)<=1.5*a){
          board.life -= 1;
          Y = height+30;
          invisible = true;
        }
      }
      // detect invisibility
      if (Y>height){
        invisible = true;
      }
    }
  }
}
