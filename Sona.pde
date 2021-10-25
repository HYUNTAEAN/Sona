import processing.serial.*;
Serial myport;
String myString = null;
int dis;
int angle;

void setup(){
  myport = new Serial(this,"COM5",9600);
  size(1300,700);
  background(321);
}

void draw(){
  noStroke();
  fill(0,7);
  rect(0,0,width,height);
  rader();
  drawline();
  drawangry();
}

void serialEvent(Serial p){
  try{
    myString = p.readStringUntil('.');
    if(myString != null){
      String[] list = split(myString,',');
      angle = int(list[0]);
      dis=int(list[1].replace(".",""));
      print(angle);
      print(dis);
    }
  } catch(Exception e){
  }
}

void drawline(){
  pushMatrix();
  translate(width/2,height/2);
  strokeWeight(4);
  stroke(98,245,31);
  line(0,0,700/2*cos(radians(angle)),-700/2*sin(radians(angle)));
  popMatrix();
}

void drawangry(){
  pushMatrix();
  translate(width/2,height/2);
  stroke(255,10,10);
  float d = (700/2.0/30.0)*(float)dis;
  if(d<700/2){
    line(d*cos(radians(angle)),-d*sin(radians(angle)),
    700/2*cos(radians(angle)),-700/2*sin(radians(angle)));
  }
  popMatrix();
}

void rader(){
  pushMatrix();
  translate(width/2,height/2);
  noFill();
  strokeWeight(2);
  stroke(98,245,31);
  ellipse(0,0,700,700);
  arc(0,0,700*2/3,700*2/3,0,radians(360));
  arc(0,0,700*1/3,700*1/3,0,radians(360));
  arc(0,0,700*5/6,700*5/6,0,radians(360));
  arc(0,0,700*1/6,700*1/6,0,radians(360));
  arc(0,0,700*3/6,700*3/6,0,radians(360));
  line(0,0,700/2*cos(radians(30)),-700/2*sin(radians(30)));
  line(0,0,700/2*cos(radians(60)),-700/2*sin(radians(60)));
  line(0,0,700/2*cos(radians(90)),-700/2*sin(radians(90)));
  line(0,0,700/2*cos(radians(120)),-700/2*sin(radians(120)));
  line(0,0,700/2*cos(radians(150)),-700/2*sin(radians(150)));
  line(0,0,700/2*cos(radians(180)),-700/2*sin(radians(180)));
  line(0,0,700/2*cos(radians(210)),-700/2*sin(radians(210)));
  line(0,0,700/2*cos(radians(240)),-700/2*sin(radians(240)));
  line(0,0,700/2*cos(radians(270)),-700/2*sin(radians(270)));
  line(0,0,700/2*cos(radians(300)),-700/2*sin(radians(300)));
  line(0,0,700/2*cos(radians(330)),-700/2*sin(radians(330)));
  line(0,0,700/2*cos(radians(360)),-700/2*sin(radians(360)));
  textAlign(RIGHT);
  textSize(30);
  fill(98,245,31);
  text("10cm",700/6,0);
  text("20cm",700*2/6,0);
  text("30cm",700*3/6,0);
  popMatrix();
}
