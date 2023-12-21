void playing1Page() {
  frameCount += 1;
  background(0);

  // draw mode
  fill(255);
  noStroke();
  rectMode(CENTER);
  imageMode(CENTER);
  
  stroke(boundaryColor);
  strokeWeight(6);
  line(0, height-marginBottom, width, height-marginBottom);
  
  noStroke();
  strokeWeight(0);
  
  
  for (int i=0; i<numVortexes; i++){
    Vortex v = (Vortex) vortexes.get(i);
    v.display();
  }
  
  for (int i=0; i<numLives; i++){
    Life l = (Life) lives.get(i);
    l.display();
    if (l.invisible){
      lives.set(i, new Life());
    }
  }
  
  for (int i=0; i<numCoins; i++){
    Coin c = (Coin) coins.get(i);
    c.display();
    if (c.invisible){
      coins.set(i, new Coin());
    }
  }
  
  for (int i=0; i<numBombs; i++){
    Bomb b = (Bomb) bombs.get(i);
    b.display();
    if (b.invisible){
      bombs.set(i, new Bomb());
    }
  }
  
  
  board.display();


  // restrict the paddle to move only within the bounds of the screen
  if (mouseX<paddleXmin) {
    mouseX = paddleXmin;
  }
  if (mouseX>paddleXmax) {
    mouseX = paddleXmax;
  }
  if (mouseY<paddleYmin) {
    mouseY = paddleYmin;
  }
  if (mouseY>paddleYmax) {
    mouseY = paddleYmax;
  }
  
  fill(planet.planetColor);
  rect(mouseX, mouseY, paddleW, paddleH);

  // pong
  // ball motion
  ballXPos += ballXVelocity;
  ballYPos += ballYVelocity;
  ballYVelocity += planet.gravity;

  // screen edge detection
  if (ballXPos<=ballXmin) {
    ballXVelocity = ballXVelocity * -Xfriction;
    ballXPos = ballXmin + 1;
  }
  
  if (ballXPos>=ballXmax) {
    ballXVelocity = ballXVelocity * -Xfriction;
    ballXPos = ballXmax - 1;
  }

  if (ballYPos<=ballYmin) {
    ballYVelocity = ballYVelocity * -Yfriction;
    ballYPos = ballYmin + 1;
  }

  // paddle detection
  //float distant = dist(ballXPos, ballYPos, ballXPos, ballYPos);
  float distant = mouseY - ballYPos;
  if (distant>0 && distant <= Ydis && ballXPos>=mouseX-paddleW/2 && ballXPos<=mouseX+paddleW/2) {
    // paddle velocity
    float paddleXVelocity = mouseX - paddleXPre;
    float paddleYVelocity = mouseY - paddleYPre;
    
    ballYVelocity = ballYVelocity * -Yfriction + paddleYVelocity * Ytransition;
    ballXVelocity = ballXVelocity + paddleXVelocity * Xtransition;
  }
  
  if (frameCount == 3){
    paddleXPre = mouseX;
    paddleYPre = mouseY;
    frameCount = 0;
  }

  // draw pong
  //fill(themeColor);
  //ellipse(ballXPos, ballYPos, ballR*2, ballR*2);
  
  image(photoMarioCircle, ballXPos, ballYPos);
  
  
  // detect explosion
  if (explodeCount > 0){
    image(photoExplosion, width/2, height/2);
    explodeCount -= 1;
  }
  
  // detect Mario's falling
  if (ballYPos>ballYmax) {
    board.life -= 1;
    // originate ball
    ballXPos = width/2;
    ballYPos = marginUpper;
    ballXVelocity = 2;
    ballYVelocity = 1.2;
  }
  
  if (board.life==0){
    page = 'f';
    soundPlay.stop();
    soundLose.play();
  }
  if (board.coin==targetCoin){
    page = 'f';
    soundPlay.stop();
    soundWin.play();
  }
}
