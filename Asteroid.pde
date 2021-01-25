class Asteroid extends Floater
{
  private double rotationSpeed;
  Asteroid()
  {
    corners = 8;
    myColor = color(255);
    myCenterX = 200;
    myCenterY = 200;
    //random speeds
    myXspeed = (Math.random() * 8) - 5; 
    myYspeed = (Math.random() * 8) - 5;
    myPointDirection = 0;
    //random rotation speed
    rotationSpeed = (int)(Math.random() * 3) - 1;
    //stores x and y cords
    xCorners = new int[corners]; 
    yCorners = new int[corners];
    // x
    xCorners[0] = (int)(Math.random() * 3) - 3;
    xCorners[1] = (int)(Math.random() * 4) + 8;
    xCorners[2] = (int)(Math.random() * 4) + 10;
    xCorners[3] = (int)(Math.random() * 4) + 8;
    xCorners[4] = (int)(Math.random() * 3) - 3;
    xCorners[5] = (int)(Math.random() * 4) - 8;
    xCorners[6] = (int)(Math.random() * 4) - 10;
    xCorners[7] = (int)(Math.random() * 4) - 8;
    // y
    yCorners[0] = (int)(Math.random() * 4) + 10;
    yCorners[1] = (int)(Math.random() * 4) + 8;
    yCorners[2] = (int)(Math.random() * 3) - 3;
    yCorners[3] = (int)(Math.random() * 4) - 8;
    yCorners[4] = (int)(Math.random() * 4) - 10;
    yCorners[5] = (int)(Math.random() * 4) - 8;
    yCorners[6] = (int)(Math.random() * 3) - 3;
    yCorners[7] = (int)(Math.random() * 4) + 8;
  }
  public void move()
  {
    myPointDirection += rotationSpeed;//turn asteroid
    super.move();
  }
  
  
}
