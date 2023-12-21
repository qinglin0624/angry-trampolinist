class Life 
{
  int X;
  int Y;
  boolean collided = false;
  boolean invisible = false;
  int LifeW = 25; // R=12
  int LifeH = 25;
  int Xmin = LifeW/2;
  int Xmax = width - Xmin;
  int Ymin = LifeH/2 + marginUpper;
  int Ymax = height - LifeH/2 - marginBottom;
  float LifeYVelocity = 1.8;

  public Life () {
    //photoLife.resize(LifeW, LifeH);
    
    X = int(random(Xmin, Xmax));
    Y = int(random(Ymin, Ymax));
    
  }
  
  void checkState(int ballXPos, int ballYPos, scoreboard board){
    float dis = dist(ballXPos, ballYPos, X, Y);
    if (dis<=20){
    collided = true;
    if (userMode==1){
      board.life += 1;
    }
    soundLife.play();
    }
    else{
      collided = false;
    }    
  }
  
  void display() {
    if (collided==false){
      checkState(ballXPos, ballYPos, board);
      image(photoLife, X, Y);
    }
    else{
      image(photoLife, X, Y);
      Y += LifeYVelocity;
      LifeYVelocity += planet.gravity;
      // detect collected
      if (userMode==2){
        if (Y<=39*a && Y>=35*a && abs(X-LuigiXPos)<=1.5*a){
          board.life += 1;
          Y = height+30;
          invisible = true;
        }
      }
      if (Y>height){
        invisible = true;
      }
    }
  }
}
