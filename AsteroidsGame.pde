//your variable declarations here
Star[] stars = new Star[500];
Spaceship johnathan = new Spaceship();
boolean wPressed, aPressed, dPressed, ePressed;
ArrayList <Asteroid> asteroids;
int gameScreen = 0;
StopWatch sw;
public void setup() 
{
  size (1750,1300);
    for (int i = 0; i < stars.length; i++){
    stars[i] = new Star();
  }
  asteroids = new ArrayList <Asteroid>();
  for (int i = 0; i < 20; i++) {
    asteroids.add(new Asteroid());
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
void initScreen() {
  background(0);
  textAlign(CENTER);
  textSize(30);
  text("Asteroid Arcade Game",width/2,300);
  fill(25);
  rect(825,615,100,50);
  fill(255);
  text("Start", width/2, height/2);
  fill(25);
  rect(800,915,150,50);
  fill(255);
  text("Controls",width/2, 950);
  for (int i= 0; i< stars.length; i++) {
  stars[i].show();
  }
}
void gameScreen() {
  background(0);
  for (int i= 0; i< stars.length; i++) {
  stars[i].show();
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
    "\nHorizontal Speed: " + nf((float)johnathan.myXspeed, 0, 2), 10, 25);
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
  text("Back", 200, 200);
  text("Controls:", width/2, 300);
  text("Forward: W", width/2, 350);
  text("Turn Left: A", width/2, 400);
  text("Turn Right: D", width/2, 450);
  text("Stop: S", width/2, 500);
  text("Hyperspace(teleport): E", width/2, 550);
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
  
  if (gameScreen==0 && mouseX >= 750 && mouseX <= 950 && mouseY >= 550 && mouseY <= 750) {
    startGame();
  }
  if (gameScreen==0 && mouseX >= 750 && mouseX <= 950 && mouseY >= 850 && mouseY <= 1050) {
    options();
  }
  if (gameScreen==3 && mouseX >= 100 && mouseX <= 250 && mouseY >= 100 && mouseY <= 250) {
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
}

public void keyReleased()
{
  if(key == 'w')
    wPressed = false;
  else if(key == 'a')
    aPressed = false;
  else if(key == 'd')
    dPressed = false;
}
