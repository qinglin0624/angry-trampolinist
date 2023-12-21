class Coin 
{
  int X;
  int Y;
  boolean collided = false;
  boolean invisible = false;
  int CoinW = 25;
  int CoinH = 25;
  int Xmin = CoinW/2;
  int Xmax = width - Xmin;
  int Ymin = CoinH/2 + marginUpper;
  int Ymax = height - CoinH/2 - marginBottom;
  float CoinYVelocity = 1.8;
  
  public Coin () {
    //photoCoin.resize(CoinW, CoinH);
    
    X = int(random(Xmin, Xmax));
    Y = int(random(Ymin, Ymax));
    
  }
  
  void checkState(int ballXPos, int ballYPos, scoreboard board){
    float dis = dist(ballXPos, ballYPos, X, Y);
    if (dis<=20){
    collided = true;
    if (userMode==1){
      board.coin += 1;
    }
    soundCoin.play();
    }
    else{
      collided = false;
    }    
  }
  
  void display() {
    if (collided==false){
      checkState(ballXPos, ballYPos, board);
      image(photoCoin, X, Y);
    }
    else{
      image(photoCoin, X, Y);
      Y += CoinYVelocity;
      CoinYVelocity += planet.gravity;
      // detect collected
      if (userMode==2){
        if (Y<=39*a && Y>=35*a && abs(X-LuigiXPos)<=1.5*a){
          board.coin += 1;
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
