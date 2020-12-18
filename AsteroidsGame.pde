//your variable declarations here
Star[] stars = new Star[200];
Spaceship johnathan = new Spaceship();
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
}
void keyPressed() {
    if (keyCode == 68) {
    johnathan.turn(4);
  }
  if (keyCode == 65) {
    johnathan.turn(-4);
  }
  if (keyCode == 87) {
    johnathan.accelerate(.1);
  }
  if (keyCode == 69) {
    // uses the setter functions to set new random location for the space and change it's direction
    johnathan.changeX((int)(Math.random() * width));
    johnathan.changeY((int)(Math.random() * height));
    johnathan.changeDirection((int)(Math.random() * 360));
  }
 
  //if (keyCode == 32) {
  //  johnathan.shoot();
  //}
}
