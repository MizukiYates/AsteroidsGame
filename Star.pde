class Star //note that this class does NOT extend Floater
{
  private int myColor;
  private int beta;
  private int myX;
  private int myY;
  Star() {
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    beta = 100+(int)(Math.random()*155);
    myX = (int)(Math.random()*(width));
    myY = (int)(Math.random()*(height));
  }
  public void show() {
    noStroke();;
    fill(myColor, beta);
    ellipse(myX, myY, 5, 5);
  }
}
