class Planet 
{
  String planetName;
  PImage planetImg;
  float gravity;
  float gravityShow;
  color planetColor;
  
  public Planet (String name) {
    if (name=="Earth"){
    planetName = name;
    planetImg = photoEarth;
    gravity = 0.1;
    gravityShow = 9.8;
    planetColor = color(126, 202, 226);
    }
    else if (name=="Jupiter"){
      planetName = name;
      planetImg = photoJupiter;
      gravity = 0.25;
      gravityShow = 24.8;
      planetColor = color(239, 91, 41);
    }
    else if (name=="Mars"){
      planetName = name;
      planetImg = photoMars;
      gravity = 0.05;
      gravityShow = 3.7;
      planetColor = color(126, 202, 226);
    }
    else if (name=="Moon"){
      planetName = name;
      planetImg = photoMoon;
      gravity = 0.02;
      gravityShow = 1.6;
      planetColor = color(255, 234, 145);
    }
    else {
      planetName = name;
      planetImg = photoMercury;
      gravity = 0.05;
      gravityShow = 3.7;
      planetColor = color(152, 161, 186);
    } 
  }
}
