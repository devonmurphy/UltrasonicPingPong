import processing.serial.*;
Serial myPort;
Ball myBall;
Paddle paddleL, paddleR;

String hold;
int holdInt;

int pos=0, lastpos=0, thresh=5;
int paddleWidth=50, dist=100;
int scoreL, scoreR, bsize=25;

float paddleLY, paddleRY;

float lastR, lastL, posR, posL;

void setup() {
  size(1200, 800);
  printArray(Serial.list());
  myBall = new Ball(width/2, height/2, -3, random(-2, -1), bsize);
  myPort = new Serial(this, Serial.list()[1], 9600);
  myPort.bufferUntil('\n');
  paddleL= new Paddle(paddleWidth, paddleWidth, 0, height/2);
  paddleR= new Paddle(paddleWidth, paddleWidth, width, height/2);
}

void draw() {
  
if ( myPort.available() > 0)
      hold = myPort.readStringUntil('\n');//This reads one line
  if (hold != null) {
    //Gets rid of the spaces at the beginning and end for the int() function
    hold=trim(hold); 
    //Converts the buffer string into an int
    holdInt=int(hold);

    if (holdInt>=1000) {//Signal from the right sensor
    //This is here to stop the paddles from jumping all over the place
      if (abs(holdInt-lastR)>=thresh || abs(holdInt-lastR)==1 ) {
        paddleRY = lastR;
      }
      //Distance from the top of the screen is portional to the distance the sensor reads
      paddleRY=((float)holdInt-1000)*width/dist;

      lastR=paddleRY;
    }
    
    if (holdInt< 1000) {//Signal from the left sensor
      if (abs(holdInt-lastL)>=thresh || abs(holdInt-lastL) == 1) {
        paddleLY = lastL;
      }
      paddleLY=(float)holdInt*width/dist; 

      lastL=paddleLY;
    }
    //Update the paddle position
    paddleL.update(paddleLY);
    paddleR.update(paddleRY);
  }
  background(0);
  myBall.move();
  paddleL.move();
  paddleR.move();

  //Scoreboard
  textSize(32);
  text(scoreL, width/2-50, 50);
  text(scoreR, width/2+50, 50);
}

void serialEvent( Serial myPort) { //Whenever there is something in the serial
    
}