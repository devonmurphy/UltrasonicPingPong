class Ball {
  float x, y, vx, vy, size;
  Ball( float a, float b, float c, float d, float e) {
    x=a;
    y=b;
    vx=c;
    vy=d;
    size=e;
  }
  void move() {
    x=x+vx;
    y=y+vy;
    //Ball on right paddle
    if (sqrt((x-width)*(x-width)+(y-paddleRY)*(y-paddleRY))<=paddleWidth/2+size/2) {
      x=x-2*vx;
      vx=-vx;
    }
    //Point for left reset ball going right
    if ((x+size/2)>=width) { 
      scoreL=scoreL+1;
      myBall= new Ball(width/2, height/2, 3, random(-2, 2), bsize);
    }

    //Ball on left paddle
    if (sqrt(x*x+(y-paddleLY)*(y-paddleLY))<=paddleWidth/2+size/2) { 
      x=x-2*vx;
      vx=-vx;
    }
    //Point for right reset ball going left
    if ((x-size/2)<=0) { 
      scoreR=scoreR+1;
      myBall= new Ball(width/2, height/2, -3, random(-2, 2), bsize);
    }

    //Ball bouncing off top and bottom
    if (y>=height-size/2 || y<=0+size/2) {
      y=y-2*vy;
      vy=-vy;
    }


    noFill();
    noStroke();
    fill(255, 0, 0);
    ellipse(x, y, size, size);
  }
}

