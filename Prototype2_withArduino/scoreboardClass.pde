class scoreboard 
{
  int life = 3;
  int coin = 0;
    
  public scoreboard () {
  }
  
  void display() {
    image(planet.planetImg, 40, 40);
    
    fill(planet.planetColor);
    //textFont(Calibri);
    textSize(18);
    text(planet.planetName, 75, 35);
    text(nf(planet.gravityShow, 0, 2), 75, 55);
    
    fill(elasityColor);
    //textFont(Calibri);
    textSize(18);
    text("Elasticity", 170, 35);
    textSize(18);
    text(nf(Ytransition, 0, 2), 170, 55);
    
    for (int i=0; i<life; i++){
      image(photoLife, 270+i*35, 40);
    }
    
    image(photoCoinBox, width-80, 40);
    fill(coinColor);
    //textFont(ArialBlack);
    textSize(22);
    strokeWeight(20);
    text(coin, width-40, 40);
  }
}
