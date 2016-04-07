int readPin1 = 2; //These ping sensors need a read and trigger pin
int trigPin1 = 3;
int readPin2 = 4;
int trigPin2 = 5;
void setup(){
  pinMode(readPin1,INPUT);
  pinMode(trigPin1,OUTPUT);
  pinMode(readPin2,INPUT);
  pinMode(trigPin2,OUTPUT);
  Serial.begin(9600);
}
void loop(){
  //Print the values read from the sensors in serial 
  Serial.println(ping(trigPin1,readPin1));
  //add an offset so that the sensor signals can be distinguished in serial
  Serial.println(ping(trigPin2,readPin2)+1000);
  //its user input so its good to always have a little delay
  delay(50);
  
}

int ping(int tpin, int rpin){
  long duration, inches, cm;
  
  pinMode(tpin, OUTPUT); //Set the trigger pin to output
  digitalWrite(tpin, LOW); //Set the pin low and wait to clear noise
  delayMicroseconds(2);
  digitalWrite(tpin, HIGH); //Set the pin high for 10 ms
  delayMicroseconds(10);
  digitalWrite(tpin, LOW); //After the trigger pin has been high for 10 ms the pulse will be sent
  
  pinMode(rpin,INPUT); //Set the read pin to input
  duration = pulseIn(rpin,HIGH);  //The length of the wave is proportional to the distance
  cm = duration/58;//Micropik supplies us with this formula to calculate the range
  return cm;
}
