//your variable declarations here
Star[] stars = new Star[500];
Spaceship johnathan = new Spaceship();
boolean wPressed, aPressed, dPressed, ePressed;
ArrayList <Asteroid> asteroids;
ArrayList <Bullet> shots = new ArrayList<Bullet>();
int gameScreen = 0;
StopWatch sw;
ColorFade fc;
public void setup() 
{
  fc = new ColorFade( color(0, 0, 255), color(255,0,0), 4000,1500);
  size (1750,1300);
    for (int i = 0; i < stars.length; i++){
    stars[i] = new Star();
  }
  asteroids = new ArrayList <Asteroid>();
  for (int i = 0; i < 20; i++) {
    asteroids.add(new Asteroid());
  }
  for (int i = 0; i < 0; i++) {
    shots.add(new Bullet(johnathan));
  }
}

public void draw() 
{
  if (gameScreen == 0) {
    initScreen();
  } else if (gameScreen == 1) {
    gameScreen();
  } else if (gameScreen == 2) {
    gameOverScreen();
  }if (gameScreen == 3) {
    optionsScreen();
  }if (gameScreen == 4) {
    loadingScreen();
  }
}
public void keyReleased()
{
  if(key == 'w')
    wPressed = false;
  else if(key == 'a')
    aPressed = false;
  else if(key == 'd')
    dPressed = false;
    color cr = color(random(255), random(255), random(255));
  // change the target color to a random color (and restart timer)
  fc.set(cr);
}
void initScreen() {
  background(0);
  textAlign(CENTER,CENTER);
  textSize(30);
  fill(fc.c());
  text("Asteroid Arcade Game",width/2,300);
  fill(25);
  rect(825,630,100,50);
  fill(255);
  text("Start", width/2, height/2);
  fill(25);
  rect(800,930,150,50);
  fill(255);
  text("Controls",width/2, 950);
  fill(25);
  rect(830,1130,95,50);
  fill(255);
  text("Exit", width/2, 1150);
  for (int i= 0; i< stars.length; i++) {
  stars[i].show();
  }
}
void gameScreen() {
  background(0);
  fill(25);
  rect(0,0,125,55);
  fill(255);
  text("Quit",50,20);
  for (int i= 0; i< stars.length; i++) {
  stars[i].show();
  }
  for (int i = 0; i < shots.size(); i++) {
      shots.get(i).move();
      shots.get(i).show();
      if (shots.get(i).outOfScreen == true)
      {
        shots.remove(shots.get(i));
      }
      /*for (int b = 0; b < shots.size(); b++){
        // FIX THIS (INDEX OUT OF BOUNDS) (line 86)
      float d = dist(shots.get(i).getX(), shots.get(i).getY(), asteroids.get(i).getX(),asteroids.get(i).getY());
      if (d < 10){
        asteroids.remove(i);
        shots.remove(i);
        break;
      }
      break;
      }
      */
    }
  johnathan.show();
  johnathan.move();
  if(wPressed)
    johnathan.accelerate(0.1);
  if(aPressed)
    johnathan.turn(-5);
  if(dPressed)
    johnathan.turn(5); 
    
 for (int i = 0; i < asteroids.size(); i++) {
      asteroids.get(i).move();
      asteroids.get(i).show();
  }
 
 if (asteroids.size() == 0) {
    gameScreen = 2;
  }
fill(255);
  textSize(15);
  text("X Coordinate: " + nf((float)johnathan.myCenterX, 0, 2) +
    "\nY Coordinate: " + nf((float)johnathan.myCenterY, 0, 2) + 
    "\nDirection: " + nf((float)johnathan.myPointDirection, 0, 0) + 
    "\nVertical Speed: " + nf((float)johnathan.myYspeed, 0, 2) + 
    "\nHorizontal Speed: " + nf((float)johnathan.myXspeed, 0, 2), 100, 1200);
}
void gameOverScreen() {
  textSize(30);
    text("You win!", width/2, height/2);
}
void loadingScreen(){
  background(0);
  sw.start();
  for (int i= 0; i< stars.length; i++) {
  stars[i].show();
  }
  textSize(30);
  text("Loading..." ,width/2,height/2);
}
void optionsScreen() {
  background(0);
  textSize(50);
  fill(25);
  rect(0,0,125,55);
  fill(255);
  text("Back", 50, 20);
  text("Controls:", width/2, 300);
  text("Forward: W", width/2, 350);
  text("Turn Left: A", width/2, 400);
  text("Turn Right: D", width/2, 450);
  text("Stop: S", width/2, 500);
  text("Hyperspace(Teleport): E", width/2, 550);
  text("Shoot: Spacebar", width/2, 600);
}
void loadGame(){
  gameScreen = 4;
}
void startGame() {
  gameScreen=1;
}
void options() {
  gameScreen=3;
}
void back() {
  gameScreen=0;
}
public void mousePressed() {
  if (gameScreen==0 && mouseX >= 750 && mouseX <= 950 && mouseY >= 1050 && mouseY <= 1250) {
    exit();
  }
  if (gameScreen==0 && mouseX >= 750 && mouseX <= 950 && mouseY >= 550 && mouseY <= 750) {
    startGame();
  }
  if (gameScreen==0 && mouseX >= 750 && mouseX <= 950 && mouseY >= 850 && mouseY <= 1050) {
    options();
  }
  if (gameScreen==3 && mouseX >= 0 && mouseX <= 100 && mouseY >= 0 && mouseY <= 120) {
    back();
  }
  if (gameScreen==1 && mouseX >= 0 && mouseX <= 100 && mouseY >= 0 && mouseY <= 120) {
    back();
  }
  //if (gameScreen == 4 && second == 1)
  //{
  //  startGame();
  //}
}
public void keyPressed()
{
  if(key == 'w')
    wPressed = true;
  else if (key == 's')
    johnathan.reverse();
  else if(key == 'a')
    aPressed = true;
  else if(key == 'd')
    dPressed = true;
  else if(key == 'e')
    johnathan.hyperspace();
  else if (key == ' ')
    shots.add(new Bullet(johnathan));
}
