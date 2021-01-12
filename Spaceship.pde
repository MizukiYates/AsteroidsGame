class Spaceship extends Floater  
{
  Spaceship()
  {
    corners = 3;
    myColor = 255;
    myCenterX = 200;
    myCenterY = 200;
    xCorners = new int[]{20, -5, -5};
    yCorners = new int[]{0, 10, -10};
    myXspeed = 0;
    myYspeed = 0;
  }
  
  void hyperspace()
  {
    myXspeed= 0;
    myYspeed= 0;
    
    myCenterX= Math.random()*width;
    myCenterY= Math.random()*height;
    
    myPointDirection = Math.random()*360;
  }
}
