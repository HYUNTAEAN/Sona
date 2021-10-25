#include <Servo.h>
int trig = 8;
int echo = 9;
int m=1;
int M=360;
int pos=M;
int a=1;

Servo SV;

void setup() {
  
  Serial.begin(9600);
  pinMode(echo,INPUT);
  pinMode(trig,OUTPUT);
  SV.attach(10);
 
}

void loop() {
 
 SV.write(77);
 sensor();
 delay(10);

 
}

void sensor(){
   digitalWrite(trig,HIGH);
 delayMicroseconds(10);
 digitalWrite(trig,LOW);
 
 long distance = pulseIn(echo,HIGH)/58.2;
 Serial.print(pos);
 Serial.print(",");
 Serial.print(distance);
 Serial.print(".");
 
 pos=pos-a;
 if(pos <0){
  pos=360;
 }
}
