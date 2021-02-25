class Spaceship extends Floater  
{
  public Spaceship()
  {
    corners = 3;
    myColor = 180;
    myCenterX = 200;
    myCenterY = 200;
    xCorners = new int[]{20, -5, -5};
    yCorners = new int[]{0, 10, -10};
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }
  public float getX() {return (int)myCenterX;}
  public float getY() {return (int)myCenterY;}
  public float getPointDirection() {return (int)myPointDirection;}
  public float getXSpeed() {return (int)myXspeed;}
  public float getYSpeed() {return (int)myYspeed;}
  void hyperspace()
  {
    myXspeed= 0;
    myYspeed= 0;
    
    myCenterX= Math.random()*width;
    myCenterY= Math.random()*height;
    
    myPointDirection = Math.random()*360;
  }
  void reverse()
  {
    myXspeed = 0;
    myYspeed = 0;
  }
}
