//your variable declarations here
Star[] stars = new Star[500];
Spaceship johnathan = new Spaceship();
boolean wPressed, aPressed, dPressed, ePressed;
boolean dataLoaded = false ;
ArrayList <Asteroid> asteroids;
ArrayList <Bullet> shots = new ArrayList<Bullet>();
int gameScreen = 1;
StopWatch sw;
ColorFade fc;
import processing.sound.*;
import processing.core.PApplet;
SoundFile file1;
SoundFile file2;
float nowPlaying = 0;
float circleX = 800;
float circleY = 775;
float xSpeed = 5;
float ySpeed = 0;

public void setup() 
{
  thread("loadData");
  background(0);
  fc = new ColorFade( color(0, 0, 255), color(255, 0, 0), 4000, 1500);
  size (1750, 1300, P2D);
  frameRate(30);
  noStroke();
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  for (int i = 0; i < 0; i++) {
    shots.add(new Bullet(johnathan));
  }
}
public void setup2()
{
  float asteroidsize = random(30)+10;
  asteroids = new ArrayList <Asteroid>();
  for (int i = 0; i < asteroidsize; i++) {
    asteroids.add(new Asteroid());
  }
}
public void draw() 
{
  if (dataLoaded) {
    if (gameScreen == 1) {
      initScreen();
    } else if (gameScreen == 2) {
      gameScreen();
    } else if (gameScreen == 3) {
      gameOverScreen();
    }
    if (gameScreen == 4) {
      optionsScreen();
    }
    if (gameScreen == 5) {
      loadingScreen();
    }
  } else {
    background(0);
    fill(255);
    textSize(50);
    text("Loading...", 800, height/2);
    blendMode(ADD);
    float barheight = 0;
    for (float i = 0; i < 1; i += 1 / 16.0) {
    fill(#ff0000);
    barheight = inOutSin(tri(timeLoop(60, i * 60))) * 100;
    rect(600 + i * 640, 900 - barheight, 32, barheight);
    fill(#00ff00);
    barheight = inOutSin(tri(timeLoop(60, i * 60 + 20))) * 100;
    rect(600 + i * 640, 900 - barheight, 32, barheight);
    fill(#0000ff);
    barheight = inOutSin(tri(timeLoop(60, i * 60 + 40))) * 100;
    rect(600 + i * 640, 900 - barheight, 32, barheight);
    }
  }
}
float timeLoop(float totalframes, float offset) {
  return (frameCount + offset) % totalframes / totalframes;
}

float tri(float t) {
  return t < 0.5 ? t * 2 : 2 - (t * 2);
}

float inOutSin(float t) {
  return 0.5 - cos(PI * t) / 2;
}
void loadData() {
  file1 = new SoundFile(this, "music.mp3");
  file2 = new SoundFile(this, "chill.mp3");
  dataLoaded = true ;
}
public void keyReleased()
{
  if (key == 'w')
    wPressed = false;
  else if (key == 'a')
    aPressed = false;
  else if (key == 'd')
    dPressed = false;
  color cr = color(random(255), random(255), random(255));
  // change the target color to a random color (and restart timer)
  fc.set(cr);
}
void initScreen() {
  background(0);
  textAlign(CENTER, CENTER);
  textSize(30);
  fill(fc.c());
  text("Asteroid Arcade Game", width/2, 300);
  fill(255);
  text("Music:", 1300, 50);
  if ( mouseX >= 1450 && mouseX <= 1500 && mouseY >= 25 && mouseY <= 75) {
    fill(255, 0, 0);
    rect(1475, 50, 30, 30);
  } else {
    fill(255);
    rect(1475, 50, 30, 30);
  }
  if ( mouseX >= 1400 && mouseX <= 1435 && mouseY >= 45 && mouseY <= 75) {
    fill(255, 0, 0);
    triangle(1400, 45, 1400, 75, 1435, 60);
  } else {
    fill(255);
    triangle(1400, 45, 1400, 75, 1435, 60);
  }
  if (mouseX >= 750 && mouseX <= 950 && mouseY >= 550 && mouseY <= 750) {
    fill(50);
    rect(825, 630, 100, 50);
    fill(255, 0, 0);
    text("Start", width/2, height/2);
  } else 
  {
    fill(25);
    rect(825, 630, 100, 50);
    fill(255);
    text("Start", width/2, height/2);
  }
  if (mouseX >= 750 && mouseX <= 950 && mouseY >= 850 && mouseY <= 1050) {
    fill(50);
    rect(800, 930, 150, 50);
    fill(255, 0, 0);
    text("Controls", width/2, 950);
  } else
  {
    fill(25);
    rect(800, 930, 150, 50);
    fill(255);
    text("Controls", width/2, 950);
  }
  if (mouseX >= 750 && mouseX <= 950 && mouseY >= 1050 && mouseY <= 1250) {
    fill(50);
    rect(830, 1130, 95, 50);
    fill(255, 0, 0);
    text("Exit", width/2, 1150);
  } else
  {
    fill(25);
    rect(830, 1130, 95, 50);
    fill(255);
    text("Exit", width/2, 1150);
  }
  for (int i= 0; i< stars.length; i++) {
    stars[i].show();
  }
}
void gameScreen() {
  background(0);
  if (mouseX >= 0 && mouseX <= 100 && mouseY >= 0 && mouseY <= 120) {
    fill(50);
    rect(0, 0, 100, 50);
    fill(255, 0, 0);
    textSize(20);
    text("Quit", 50, 20);
    textSize(15);
  } else {
    fill(25);
    rect(0, 0, 100, 50);
    fill(255);
    textSize(20);
    text("Quit", 50, 20);
    textSize(15);
  }
  for (int i = 0; i < asteroids.size(); i++) {
    asteroids.get(i).move();
    asteroids.get(i).show();
  }
  for (int i= 0; i< stars.length; i++) {
    stars[i].show();
  }
  for (int i = 0; i < shots.size(); i++) {
    Bullet cshots = shots.get(i);
    cshots.move();
    cshots.show();
    if (shots.get(i).outOfScreen == true)
    {
      shots.remove(shots.get(i));
    }
    for (int j = 0; j < shots.size(); j++) {
      for (int b = 0; b < asteroids.size(); b++) {
        Asteroid casteroids = asteroids.get(b);
        float d = dist(cshots.getX(), cshots.getY(), casteroids.getX(), casteroids.getY());
        if (d < 20) {
          asteroids.remove(b);
          shots.remove(i);
          break;
        }
      }
    }
  }
  johnathan.show();
  johnathan.move();
  if (wPressed)
    johnathan.accelerate(0.1);
  if (aPressed)
    johnathan.turn(-5);
  if (dPressed)
    johnathan.turn(5); 


  if (asteroids.size() == 0) {
    gameScreen = 3;
  }
  fill(255);
  textSize(15);
  text("X Coordinate: " + nf((float)johnathan.myCenterX, 0, 2) +
    "\nY Coordinate: " + nf((float)johnathan.myCenterY, 0, 2) + 
    "\nDirection: " + nf((float)johnathan.myPointDirection, 0, 0) + 
    "\nVertical Speed: " + nf((float)johnathan.myYspeed, 0, 2) + 
    "\nHorizontal Speed: " + nf((float)johnathan.myXspeed, 0, 2), 100, 1200);
  textSize(25);
  text("Remaining Asteroids: " + asteroids.size(), 1575, 25);
  textSize(15);
}
void gameOverScreen() {
  background(0);
  textSize(30);
  fill(255);
  text("You win!", width/2, height/2);
  if (mouseX >= 750 && mouseX <= 950 && mouseY >= 1050 && mouseY <= 1250) {
    fill(50);
    rect(752, 1142, 180, 50);
    fill(255, 0, 0);
    text("Main Menu", 842, 1165);
  } else
  {
    fill(25);
    rect(752, 1142, 180, 50);
    fill(255);
    text("Main Menu", 842, 1165);
  }
}
void loadingScreen() {
  background(0);
  sw.start();
  for (int i= 0; i< stars.length; i++) {
    stars[i].show();
  }
  textSize(30);
  text("Loading...", width/2, height/2);
}
void optionsScreen() {
  background(0);
  textSize(50);
  if (mouseX >= 0 && mouseX <= 100 && mouseY >= 0 && mouseY <= 120) {
    fill(50);
    rect(0, 0, 125, 55);
    fill(255, 0, 0);
    text("Back", 50, 20);
  } else {
    fill(25);
    rect(0, 0, 125, 55);
    fill(255);
    text("Back", 50, 20);
  }
  fill(255);
  text("Controls:", width/2, 300);
  text("Forward: W", width/2, 350);
  text("Turn Left: A", width/2, 400);
  text("Turn Right: D", width/2, 450);
  text("Stop: S", width/2, 500);
  text("Hyperspace(Teleport): E", width/2, 550);
  text("Shoot: Spacebar", width/2, 600);
}
void loadGame() {
  gameScreen = 5;
}
void startGame() {
  gameScreen=2;
}
void options() {
  gameScreen=4;
}
void back() {
  gameScreen=1;
}
public void mousePressed() {
  if ( mouseX >= 1450 && mouseX <= 1500 && mouseY >= 25 && mouseY <= 75) {
    file1.stop();
  }
  if (gameScreen == 1 && mouseX >= 1400 && mouseX <= 1435 && mouseY >= 45 && mouseY <= 75) {
    file1.play();
  }
  if (gameScreen==1 && mouseX >= 750 && mouseX <= 950 && mouseY >= 1050 && mouseY <= 1250) {
    exit();
  }
  if (gameScreen==3 && mouseX >= 750 && mouseX <= 950 && mouseY >= 1050 && mouseY <= 1250) {
    back();
  }
  if (gameScreen==1 && mouseX >= 750 && mouseX <= 950 && mouseY >= 550 && mouseY <= 750) {
    startGame();
    setup2();
  }
  if (gameScreen==1 && mouseX >= 750 && mouseX <= 950 && mouseY >= 850 && mouseY <= 1050) {
    options();
  }
  if (gameScreen==4 && mouseX >= 0 && mouseX <= 100 && mouseY >= 0 && mouseY <= 120) {
    back();
  }
  if (gameScreen==2 && mouseX >= 0 && mouseX <= 100 && mouseY >= 0 && mouseY <= 120) {
    back();
  }
  //if (gameScreen == 4 && second == 1)
  //{
  //  startGame();
  //}
}
public void keyPressed()
{
  if (key == 'w')
    wPressed = true;
  else if (key == 's')
    johnathan.reverse();
  else if (key == 'a')
    aPressed = true;
  else if (key == 'd')
    dPressed = true;
  else if (key == 'e')
    johnathan.hyperspace();
  else if (key == ' ')
    shots.add(new Bullet(johnathan));
}
