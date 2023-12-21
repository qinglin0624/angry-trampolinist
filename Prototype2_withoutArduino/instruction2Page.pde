void instruction2Page() {
  background(0);
  rectMode(CENTER);
  imageMode(CENTER);
  translate(width/2, height/2);
 
  // Title: rectangle with the game's name
  strokeWeight(0);
  fill(255);
  textSize(35);
  text("Two-user Mode", -8*a, -16*a);
  
  // Instructions
  strokeWeight(0);
  fill(255);
  textSize(20);
  text("Instructions:", -18*a, -13*a);
  textSize(18);
  //text(" - User 1: move mouse to control the trampoline, which bounces Mario to", -17*a, -11*a);
  //text("   \"hit\" the coins", -17*a, -10*a);
  //text("   User 2: press \"A\" (left) and \"S\" (right) to control Luigi, who", -17*a, -9*a);
  text(" - Select the target number of coins. You win the game once they are", -17*a, -7*a);
  text("   successfully collected:", -17*a, -6*a);
  
  text(" - User 1: move mouse to control the", -17*a, -11*a);
  text("   trampoline, which bounces Mario", -17*a, -10*a);
  text("   to \"hit\" the coins", -17*a, -9*a);
  text(" User 2: press \"A\" (left) and \"S\" (right)", 1.5*a, -11*a);
  text(" to control Luigi, who \"collects\"", 1.5*a, -10*a);
  text(" the falling coins", 1.5*a, -9*a);
  
  text(" - Choose a planet:", -17*a, -2*a);
  
  // coins
  image(photoCoin, -1.5*a, -4.25*a);
  
  // + - buttons
  // + button
  if (mouseX>22*a && mouseX<23*a && mouseY>15.25*a && mouseY<16.25*a){
    fill(buttonPMNew);
    if (mousePress){
      mousePress = false;
      soundButton.play();
      targetCoin++;
    }
  }
  else{
    fill(buttonPMOld);
  }
  rect(2.5*a, -4.25*a, a, a, 5, 5, 5, 5);
  // - button
  if (mouseX>23.5*a && mouseX<24.5*a && mouseY>15.25*a && mouseY<16.25*a){
    fill(buttonPMNew);
    if (mousePress){
      mousePress = false;
      soundButton.play();
      targetCoin--;
    }
  }
  else{
    fill(buttonPMOld);
  }
  rect(4*a, -4.25*a, a, a, 5, 5, 5, 5);
  // +- icons
  fill(0);
  text("+", 2.25*a, -4*a);
  text("-", 3.75*a, -4*a);
  fill(titleColor);
  text(targetCoin, 0*a, -4*a);
   
 
  // planet
  //fill(planetTextColor);
  //text("Planet", -15*a, 1*a);
  
  textSize(16);
  fill(255);
  text("jupiter 24.8", -11*a, 2*a);
  if (mouseX>10*a && mouseX<12*a && mouseY>19*a && mouseY<21*a){
    image(photoJupiterL, -9*a, 0*a);
    if (mousePress){
      mousePress = false;
      soundButton.play();
      planet = new Planet("Jupiter");
    }
  }
  else{
    if (planet.planetName == "Jupiter"){
      image(photoJupiterL, -9*a, 0*a);
    }
    else{
    image(photoJupiter, -9*a, 0*a);
    }
  }

  text("earth 9.8", -5.5*a, 2*a);  
  if (mouseX>15*a && mouseX<17*a && mouseY>19*a && mouseY<21*a){
    image(photoEarthL, -4*a, 0*a);
    if (mousePress){
      mousePress = false;
      soundButton.play();
      planet = new Planet("Earth");
    }
  }
  else{
    if (planet.planetName == "Earth"){
      image(photoEarthL, -4*a, 0*a);
    }
    else{
    image(photoEarth, -4*a, 0*a);
    }
  }
  
  text("mercury 3.7", -1*a, 2*a);
  if (mouseX>20*a && mouseX<22*a && mouseY>19*a && mouseY<21*a){
    image(photoMercuryL, 1*a, 0*a);
    if (mousePress){
      mousePress = false;
      soundButton.play();
      planet = new Planet("Mercury");
    }
  }
  else{
    if (planet.planetName == "Mercury"){
      image(photoMercuryL, 1*a, 0*a);
    }
    else{
    image(photoMercury, 1*a, 0*a);
    }
  }
  
  text("moon 1.6", 4.5*a, 2*a);
  if (mouseX>25*a && mouseX<27*a && mouseY>19*a && mouseY<21*a){
    image(photoMoonL, 6*a, 0*a);
    if (mousePress){
      mousePress = false;
      soundButton.play();
      planet = new Planet("Moon");
    }
  }
  else{
    if (planet.planetName == "Moon"){
      image(photoMoonL, 6*a, 0*a);
    }
    else{
    image(photoMoon, 6*a, 0*a);
    }
  }
  
  
  
  // pitfalls
  textSize(18);
  fill(255);
  text("Avoid bomb", -15*a, 5.5*a);
  image(photoBomb, -8*a, 5*a);
  text(", whose explosion stains the screen; Avoid vortex", -7*a, 5.5*a);
  image(photoVortexEG, 16*a, 5*a);
  
  // life
  fill(lifeColor);
  text("# of lives:", -15*a, 8.5*a);
  image(photoLife, -9*a, 8*a);
  image(photoLife, -7*a, 8*a);
  image(photoLife, -5*a, 8*a);
  
  // elasticity
  fill(elasticityColor);
  text("Elasticity of trampoline: 0.50", -15*a, 11*a);
  //text("0.260", -10.5*a, 11*a);

  // Two buttons
  // Check if mouse hovers over LEFT Button
  if (mouseX>5*a && mouseX<13*a && mouseY>32*a && mouseY<36*a) {
    // LEFT Button hover mode
    noStroke();
    fill(buttonColorNew);
    rect(-11*a, 14*a, 8*a, 4*a, 10, 10, 10, 10);
    textSize(25);
    fill(buttonTextColorNew);
    text("Back", -12*a, 14.5*a);
    
    if (mousePress){
      mousePress = false;
      soundButton.play();
      //println("i2 to s");
      page='s';
    }
    
  } else {
    // LEFT Button default mode
    noFill();
    strokeWeight(0);
    rect(-11*a, 14*a, 8*a, 4*a, 10, 10, 10, 10);
    textSize(25);
    fill(buttonTextColorOld);
    text("Back", -12*a, 14.5*a);
  }

  // Check if mouse hovers over RIGHT Button
  if (mouseX>27*a && mouseX<35*a && mouseY>32*a && mouseY<36*a) {
    // RIGHT Button hover mode
    noStroke();
    fill(buttonColorNew);
    rect(11*a, 14*a, 8*a, 4*a, 10, 10, 10, 10);
    textSize(25);
    fill(buttonTextColorNew);
    text("Start!", 9*a, 14.5*a);
    
    if (mousePress){
      mousePress = false;
      soundButton.play();
      soundStart.stop();
      soundPlay.play();
      soundPlay.loop();
      //println("i2 to collaboration");
      page='c';
    }
    
  } else {
    // RIGHT Button default mode
    noFill();
    strokeWeight(0);
    rect(11*a, 14*a, 8*a, 4*a, 10, 10, 10, 10);
    textSize(25);
    fill(buttonTextColorOld);
    text("Start!", 9*a, 14.5*a);
  }
}
