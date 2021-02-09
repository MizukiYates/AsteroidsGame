class Bullet extends Floater
{
  boolean outOfScreen;
  public Bullet(Spaceship bob)
  {
    myCenterX = bob.getX();
    myCenterY = bob.getY();
    myXspeed = bob.getXSpeed();
    myYspeed = bob.getYSpeed();
    outOfScreen = false;
    myPointDirection = bob.getPointDirection();
    accelerate(10);
    myColor = color(0,0,255);
  }
  public float getX() {return (int)myCenterX;}
  public float getY() {return (int)myCenterY;}
  public float getPointDirection() {return (int)myPointDirection;}
  public float getXSpeed() {return (int)myXspeed;}
  public float getYSpeed() {return (int)myYspeed;}
  public void show()
  {
    fill(myColor);
    ellipse((float)myCenterX,(float)myCenterY,10,10);
  }
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      outOfScreen = true;    
    }    
    else if (myCenterX<0)
    {     
      outOfScreen = true;    
    }    
    if(myCenterY >height)
    {    
      outOfScreen = true;    
    } 
    
    else if (myCenterY < 0)
    {     
      outOfScreen = true;    
    }   
  } 
}
