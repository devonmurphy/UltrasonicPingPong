class Paddle{
  float W,H,x,y;
  int port;
  Paddle(float a, float b, float c, float d){
    W=a;
    H=b;
    x=c;
    y=d;
  }
  void move(){
    noFill();
    noStroke();
    fill(255,0,0);
    rect(x,y,W,H);
  }
  void update(float Y ){
    
    y=Y;
}
}