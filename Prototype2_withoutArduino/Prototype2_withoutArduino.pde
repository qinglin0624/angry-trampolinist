// INFOSCI 201 - INTERACTION & PHYSICAL COMPUTING
// Xuchen Gong (xg54)

/*
I control which page is active by updating the page vriable:
's': starting page
'o': instruction page (one-user mode)
't': instruction page (two-user mode)
'p': playing page (one-user mode)
'c': playing page (two-user collaboration mode)
'f': feedback page
*/

import processing.sound.*;
SoundFile soundVortex;
SoundFile soundBomb;
SoundFile soundLife;
SoundFile soundCoin;
SoundFile soundDrop;
SoundFile soundWin;
SoundFile soundLose;
SoundFile soundStart;
SoundFile soundPlay;
SoundFile soundButton;

char page = 's';

int a = 20;
boolean mousePress = false;
int userMode;

// variables for playing
int ballR = 20;

int ballXPos, ballYPos;
int ballXmin, ballYmin, ballXmax, ballYmax;
int paddleXPre, paddleYPre;
int paddleXmin, paddleYmin, paddleXmax, paddleYmax;
int Ydis;

float ballXVelocity;
float ballYVelocity;
float gravity;
float gravityShow;
float Xfriction;
float Yfriction;
float Xtransition;
float Ytransition;

int paddleW = 100;
int paddleH = 20;

int marginUpper = 100;
int marginBottom = 200;

int frameCount = 0;
PFont gameOver;
PFont Calibri;
PFont Arial;
PFont ArialBlack;
color themeColor = color(241, 196, 15);
color elasityColor = color(173, 155, 243);
color coinColor = color(165, 76, 20);
color boundaryColor = color(50, 50, 50);
color planetColor;

PImage photoEarth;
PImage photoMoon;
PImage photoMercury;
PImage photoMars;
PImage photoJupiter;
PImage photoEarthL;
PImage photoMoonL;
PImage photoMercuryL;
PImage photoMarsL;
PImage photoJupiterL;
PImage photoLife;
PImage photoCoin;
PImage photoCoinBox;
PImage photoPlanet;
PImage photoBomb;
PImage photoVortex;
PImage photoVortexEG;
PImage photoExplosion;

ArrayList coins;
ArrayList lives;
ArrayList bombs;
ArrayList vortexes;
ArrayList photoLuigis;
int numLives = 3;
int numCoins = 10;
int numBombs = 4;
int numVortexes = 3;
int targetCoin = 10;
int explodeCount;
Planet planet;
scoreboard board;

// variables for user 2
color basketColor = color(241, 196, 15);
int imageNum=0;
int LuigiXPos;
int LuigiYPos;
int LuigiSpeed=20;
int LuigiLeftBound;
int LuigiRightBound;

// variables for instruction
color planetTextColor = color(52, 152, 219);
color pitfallColor = color(250, 157, 0);
color lifeColor = color(251, 106, 119);
color elasticityColor = color(176, 156, 255);

color buttonColorOld = color(255);
color buttonColorNew = color(241, 196, 15);
color buttonTextColorOld = color(255);
color buttonTextColorNew = color(0);
color buttonPMOld = color(241, 196, 15);
color buttonPMNew = color(255, 234, 145);


// variables for feedback page
PImage photoFloatingCoin;
PImage photoFloatingCoinBox;
float theta;
int frames = 60;

// variables for starting page
color pickedColor = color(15, 14, 19);
color readStoryColor = color(255);
color backgroundColor = color(0);
color titleColor = color(241, 196, 15);
color textColor = color(0);
color storyBackgroundColor = color(211, 217, 179);
PImage bg;
PImage photoMario;
PImage photoMarioCircle;
PImage photoLuigi;
PImage photoLuigi0;
PImage photoLuigi1;
PImage photoLuigiRun;
PFont lobster;
int storyY = 16;


void setup() {
  // setup for starting page
  size(800, 800);
  smooth(8);
  
  bg = loadImage("data/background.jpg");
  lobster = createFont("data/Lobster_1.3.otf", 128);
  gameOver = createFont("ERTHQAKE.TTF", 128);
  Arial = createFont("Arial", 36);
  ArialBlack = createFont("Arial Black", 36);
  Calibri = createFont("Calibri", 36);
  
  soundVortex = new SoundFile(this, "data/sound/vortex.wav", true);
  soundBomb = new SoundFile(this, "data/sound/bomb.wav", true);
  soundLife = new SoundFile(this, "data/sound/life.wav", true);
  soundCoin = new SoundFile(this, "data/sound/coin.wav", true);
  soundDrop = new SoundFile(this, "data/sound/drop.wav", true);
  soundWin = new SoundFile(this, "data/sound/win.wav", true);
  soundLose = new SoundFile(this, "data/sound/lose.wav", true);
  soundStart = new SoundFile(this, "data/sound/start.wav", true);
  soundPlay = new SoundFile(this, "data/sound/play.wav", true);
  soundButton = new SoundFile(this, "data/sound/button.wav", true);
  
  photoEarth = loadImage("data/earth.png");
  photoMoon = loadImage("data/moon.png");
  photoMercury = loadImage("data/mercury.png");
  photoMars = loadImage("data/mars.png");
  photoJupiter = loadImage("data/jupiter.png");
  photoEarthL = photoEarth.copy();
  photoMoonL = photoMoon.copy();
  photoMercuryL = photoMercury.copy();
  photoMarsL = photoMars.copy();
  photoJupiterL = photoJupiter.copy();
  photoLife = loadImage("data/life.png");
  photoCoin = loadImage("data/coin2.png");
  photoFloatingCoin = loadImage("data/coin.png");
  photoCoinBox = loadImage("data/coinbox.png");
  photoFloatingCoinBox = photoCoinBox.copy();
  photoBomb = loadImage("data/bomb.png");
  photoVortexEG = loadImage("data/vortex3.png");
  photoExplosion = loadImage("data/explosion.png");
  photoMario = loadImage("data/mario.png");
  photoMarioCircle = loadImage("data/mario_circle.png");
  photoLuigi = loadImage("data/luigi.png");
  
  //photoLuigis = new ArrayList(2);
  //for (int i=0; i<2; i++){
  //  photoLuigiRun = loadImage("data/luigi_"+i+".png");
  //  photoLuigiRun.resize(55, 68);
  //  photoLuigis.add(photoLuigiRun);
  //}
  photoLuigi0 = loadImage("data/luigi_0.png");
  photoLuigi1 = loadImage("data/luigi_1.png");
  photoLuigi0.resize(55, 68);
  photoLuigi1.resize(55, 68);
  photoLuigiRun = photoLuigi0;
  
  photoEarth.resize(40, 40);
  photoMoon.resize(40, 40);
  photoMercury.resize(40, 40);
  photoMars.resize(40, 40);
  photoJupiter.resize(40, 40);
  photoEarthL.resize(50, 50);
  photoMoonL.resize(50, 50);
  photoMercuryL.resize(50, 50);
  photoMarsL.resize(50, 50);
  photoJupiterL.resize(50, 50);
  photoCoin.resize(25, 25);
  photoLife.resize(25, 25);
  photoBomb.resize(30, 35); // not the same size as falling icons
  photoVortexEG.resize(40,40);
  photoCoinBox.resize(40,40);
  photoFloatingCoinBox.resize(100, 80);
  photoExplosion.resize(800,800);
  photoMarioCircle.resize(40, 40);
  
  planet = new Planet("Earth");
  
  // setup for playing page: initialize ball, paddle, and user 2
  initializeGame(); 
  soundStart.play();
  soundStart.loop();
}


void draw() {
  
  switch(page) {
  case 's': 
    startingPage();
    break;
  case 'o': 
    instruction1Page();
    break;
  case 't': 
    instruction2Page();
    break;
  case 'p': 
    playing1Page();
    break;
  case 'c': 
    playing2Page();
    break;
  case 'f':
    feedbackPage();
    break;
  }
}


public void mouseClicked() {
  mousePress = true;
}

public void initializeGame(){
  ballXPos = width/2;
  ballYPos = marginUpper;
  ballXmin = ballR;
  ballYmin = ballR;
  ballXmax = width - ballXmin;
  ballYmax = height - ballYmin;
  
  paddleXmin = paddleW/2;
  paddleYmin = paddleH/2;
  paddleXmax = width - paddleXmin;
  paddleYmax = height - paddleYmin;
  paddleXPre = width/2;
  paddleYPre = height/2;
  Ydis = ballR + paddleH/2;
  
  // X:Y = 5:3
  ballXVelocity = 2;
  ballYVelocity = 1.2;
  
  Xfriction = 0.7;
  Yfriction = 0.7;
  Xtransition = 0.02;
  Ytransition = 0.5;
  
  lives = new ArrayList(numLives);
  coins = new ArrayList(numCoins);
  bombs = new ArrayList(numBombs);
  vortexes = new ArrayList(numVortexes);
  explodeCount = 0;
  
  for (int i=0; i<numVortexes; i++){
    vortexes.add(new Vortex());
  }
  for (int i=0; i<numLives; i++){
    lives.add(new Life());
  }
  for (int i=0; i<numCoins; i++){
    coins.add(new Coin());
  }
  for (int i=0; i<numBombs; i++){
    bombs.add(new Bomb());
  }
  
  board = new scoreboard();
  
  // setup for user 2
  LuigiXPos = width/2;
  LuigiLeftBound = int(1.5*a);
  LuigiRightBound = int(width - 1.5*a);
}
