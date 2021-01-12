//your variable declarations here
Star[] stars = new Star[200];
Spaceship johnathan = new Spaceship();
boolean wPressed, aPressed, dPressed;

public void setup() 
{
  size (500,500);
  for (int i = 0; i < stars.length; i++){
    stars[i] = new Star();
  }
}
public void draw() 
{
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

fill(255);
  textSize(15);
  text("X Coordinate: " + nf((float)johnathan.myCenterX, 0, 2) +
    "\nY Coordinate: " + nf((float)johnathan.myCenterY, 0, 2) + 
    "\nDirection: " + nf((float)johnathan.myPointDirection, 0, 0) + 
    "\nVertical Speed: " + nf((float)johnathan.myYspeed, 0, 2) + 
    "\nHorizontal Speed: " + nf((float)johnathan.myXspeed, 0, 2), 10, 25);
}
public void keyPressed()
{
  if(key == 'w')
    wPressed = true;
  else if(key == 'a')
    aPressed = true;
  else if(key == 'd')
    dPressed = true;
  else if(key == 's')
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
