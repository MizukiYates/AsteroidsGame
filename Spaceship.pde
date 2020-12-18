class Spaceship extends Floater  {
    //aLaser bob;
    Spaceship() {
        // all variables are protected and inherited from Floater class
        myCenterX = width/2; // starting x position of the spaceship (middle of x axis)
        myCenterY = height/2; // starting x position of the spaceship (middle of y axis)
        myXspeed = 0.0; // x speed velocity
        myYspeed = 0.0; // y speed velocity
        myPointDirection = 0; // angle of spaceship direction
        myColor = color(255); // color of spaceship (default white)
        corners = 3; // # of corners of spaceship (defines xCorners and yCorners length)
        xCorners = new int[corners]; // stores x locations of all points of spaceship
        yCorners = new int[corners]; // stores y locations of all points of spaceship
        // all corners (x and y)
        xCorners[0] = 10;
        xCorners[1] = -11;
        xCorners[2] = -11;
        yCorners[0] = 0;
        yCorners[1] = 8;
        yCorners[2] = -8;
        //bob = new Laser(myCenterX, myCenterY, myPointDirection);
    }
    /*
    public void shoot() {
        bob.show();
    }
    */
    // setter function for x location
    public void changeX(int x_) {
        myCenterX = x_;
    }
    // setter function for y location
    public void changeY(int y_) {
        myCenterY = y_;
    }
    // setter function direction of spaceship
    public void changeDirection(int d_) {
        myPointDirection = d_;
    }
}
