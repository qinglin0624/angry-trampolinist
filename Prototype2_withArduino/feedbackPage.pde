void feedbackPage() {
  background(0);
  rectMode(CENTER);
  imageMode(CENTER);
  translate(width/2, height/2);
  
  theta += TWO_PI/frames;
  
  // Floating coins
  image(photoFloatingCoinBox, -3*a, sin(theta)*10);
  fill(titleColor);
  textSize(50);
  text(board.coin, 1*a, sin(theta)*10+15);
  
  // Title: rectangle with the game's name
  fill(titleColor);
  stroke(titleColor);
  strokeWeight(0);
  rect(0, -12*a, 40*a, 8*a, 0, 0, 0, 0);
  fill(textColor);
  textSize(45);
  
  if (board.life==0){
    text("Ahh, you died...", -10*a, -11.5*a);
  }
  else{
    text("Wow, you won!", -8*a, -11.5*a);
  }
  

  // Two buttons
  // Check if mouse hovers over LEFT Button
  if (mouseX>4*a && mouseX<14*a && mouseY>30*a && mouseY<36*a) {
    // LEFT Button hover mode
    noStroke();
    fill(buttonColorNew);
    rect(-11*a, 13*a, 10*a, 6*a, 10, 10, 10, 10);
    textSize(25);
    fill(buttonTextColorNew);
    text("Play again", -14*a, 13.5*a);
    
    if (mousePress){
      mousePress = false;
      soundButton.play();
      page='s';
      initializeGame();
      soundStart.play();
      soundStart.loop();
    }
    
  } else {
    // LEFT Button default mode
    noFill();
    strokeWeight(0);
    rect(-11*a, 13*a, 10*a, 6*a, 10, 10, 10, 10);
    textSize(25);
    fill(buttonTextColorOld);
    text("Play again", -14*a, 13.5*a);
  }

  // Check if mouse hovers over RIGHT Button
  if (mouseX>26*a && mouseX<36*a && mouseY>30*a && mouseY<36*a) {
    // RIGHT Button hover mode
    noStroke();
    fill(buttonColorNew);
    rect(11*a, 13*a, 10*a, 6*a, 10, 10, 10, 10);
    textSize(25);
    fill(buttonTextColorNew);
    text("Exit", 10*a, 13.5*a);
    
    if (mousePress){
      exit();
    }
    
  } else {
    // RIGHT Button default mode
    noFill();
    strokeWeight(0);
    rect(11*a, 13*a, 10*a, 6*a, 10, 10, 10, 10);
    textSize(25);
    fill(buttonTextColorOld);
    text("Exit", 10*a, 13.5*a);
  }
}
