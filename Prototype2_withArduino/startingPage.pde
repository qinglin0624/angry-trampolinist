
void startingPage() {
  background(bg);
  rectMode(CENTER);
  
  photoLuigi.resize(55, 68);
  
  // Title: rectangle with the game's name
  fill(titleColor);
  stroke(titleColor);
  strokeWeight(0);
  rect(20*a, 8*a, 40*a, 8*a, 0, 0, 0, 0);
  fill(textColor);
  //textFont(lobster);
  textSize(50);
  text("ANGRY TRAMPOLINIST", 7*a, 8.5*a);
  
  
  // Text "Read the story!"
  textSize(20);
  fill(color(readStoryColor));
  text("Hover here to read the story!", 25*a, 14*a);
  
  //rect(32*a, 13.5*a, 14*a, 1*a);
  if(mouseX>25*a && mouseX<39*a && mouseY>13*a && mouseY<14*a){
    readStoryColor = color(63,85,132);
    
    // Text of the game's background story
    stroke(255);
    strokeWeight(2);
    fill(storyBackgroundColor);
    rect(20*a, (storyY+3.5)*a, 34*a, 7*a, 20, 20, 20, 20);
    textSize(18);
    fill(color(0));
    text("You, Mario, is a talented trampolinist and an enthusiastic coin seeker. ", 3.5*a, (storyY+1.5)*a);
    text("You can either jump to collect coins (one-user mode) or hit the coins to the", 3.5*a, (storyY+2.5)*a);
    text("ground, which will be collected by your brother Luigi (two-user mode). All", 3.5*a, (storyY+3.5)*a);
    text("the behaviors follow the physics rules in different planets. Now, start", 3.5*a, (storyY+4.5)*a);
    text("relaxing in the world of jumping and collisions!", 3.5*a, (storyY+5.5)*a);
    
  } else {
    readStoryColor = color(255);
  }
  
  
  // two buttons
  // check if mouse hovers over LEFT Button
  if (mouseX>6*a && mouseX<16*a && mouseY>20*a && mouseY<36*a) {
    // LEFT Button hover mode
    noStroke();
    fill(buttonColorNew);
    rect(11*a, 33*a, 10*a, 6*a, 10, 10, 10, 10);
    textSize(25);
    fill(buttonTextColorNew);
    text("one user", 8.5*a, 33*a);
    
    // draws mario
    imageMode(CENTER);
    image(photoMario, 11*a, 28*a);
    
    if (mousePress){
      //println("s to i1");
      mousePress = false;
      soundButton.play();
      page='o';
      userMode = 1;
    }

  } else {
    // LEFT Button default mode
    noFill();
    strokeWeight(0);
    rect(11*a, 33*a, 10*a, 6*a, 10, 10, 10, 10);
    textSize(25);
    fill(buttonTextColorOld);
    text("one user", 8.5*a, 33*a);
  }

  // check if mouse hovers over RIGHT Button
  if (mouseX>24*a && mouseX<34*a && mouseY>30*a && mouseY<36*a) {
    // RIGHT Button hover mode
    noStroke();
    fill(buttonColorNew);
    rect(29*a, 33*a, 10*a, 6*a, 10, 10, 10, 10);
    textSize(25);
    fill(buttonTextColorNew);
    text("two users", 26*a, 33*a);
    
    // draws mario and luigi
    imageMode(CENTER);
    image(photoMario, 28*a, 28*a);
    image(photoLuigi, 30*a, 28*a);
    
    if (mousePress){
      mousePress = false;
      soundButton.play();
      //println("s to i2");
      page='t';
      userMode = 2;
    }
    
  } else {
    // RIGHT Button default mode
    noFill();
    strokeWeight(0);
    rect(29*a, 33*a, 10*a, 6*a, 10, 10, 10, 10);
    textSize(25);
    fill(buttonTextColorOld);
    text("two users", 26*a, 33*a);
  }
}
