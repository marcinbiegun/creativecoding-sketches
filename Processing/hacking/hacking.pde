
import controlP5.*; 
//import spout.*;

import oscP5.*;
import netP5.*;

OscP5 osc;
NetAddress receiver;

OscMessage m;

ControlP5 MyController;
//Spout spout;

int counter = 0;
int amount = 0;
int fontSize = 16;
int letterSpacing = 8;
int lineSpacing = 16;
float letterRatio = (float) lineSpacing / letterSpacing;
int leftMargin = 200;
int topMargin = 20;

float noiseScale = 0.5;
float noiseSpeedY = 0.1;
float noiseSpeedZ = 0.1;
float noiseThresh = 0.5;

String[] lines;


void setup() {
  size(800, 600, P3D);
  
  osc = new OscP5( this , 12000 );
  receiver = new NetAddress( "127.0.0.1" , 10000 );

  //spout = new Spout(this);
  //spout.createSender("Spout Processing");
  
  PFont mono = createFont("Inconsolata-Regular.ttf", fontSize);
  textFont(mono);
  
  lines = loadStrings("code.txt");
  //lines = loadStrings("test.txt");
  
  MyController = new ControlP5(this);
  // values, pos, size
  MyController.addSlider("amount",      0,10,5,  10,10, 100,10);
  MyController.addSlider("noiseScale",  0,1,0.5, 10,30, 100,10);
  MyController.addSlider("noiseSpeedY",  0,0.2,0.1, 10,50, 100,10);
  MyController.addSlider("noiseSpeedZ",  0,0.2,0.1, 10,70, 100,10);
  MyController.addSlider("noiseThresh", 0,1,0.5, 10,90, 100,10);
  
  /*
  b = cp5.addButton("buttonValue")
         .setValue(4)
         .setPosition(100,190)
         .setSize(200,200)
         .setId(2);*/
}


void draw() {
  if (frameCount % 2 == 0) {
    counter++;
  }
  
  clear();
  background(0);
  
  String newText = "";
  
  for (int y=0; y < lines.length && y < 128; y++) {
    String line = lines[y];
    for (int x=0; x < 64; x++) {
      if (x >= line.length()) {
        break;
      }
      char letter = line.charAt(x);
      char newLetter = asciiCycle(letter, counter, x, y);
      
      setColor(x, y, counter);
      drawLetter(newLetter, x, y);
      
      
      float noiseValue = noise(x*noiseScale, y*noiseScale*letterRatio*frameCount*noiseSpeedY, frameCount*noiseSpeedZ);
      if (noiseValue < noiseThresh) {
        newText += newLetter;
      } else {
        newText += " ";
      }
    

    }
     newText += "\n"; 
  }

 // osc.send( receiver , "/test" , "asd");
  
  
  
  //OscMessage myMessage = new OscMessage("/test");
  //myMessage.add(newText); /* add an int to the osc message */
 // osc.send(myMessage, receiver); 
  //osc.send(receiver, myMessage);
  
  //osc.send( receiver , "/test" , newText);
   
  //spout.sendTexture();
  //text(counter, x, y+40);
}


char asciiCycle(char letter, int turn, int x, int y) {
  int n = (int) letter;
  
  // don't change the letter
  if ((n + turn) % 10 < amount) { 
    return letter;
  }

  // A-Z
  if (n >= 65 && n <= 90) {
    n = cycleNumber(n, turn,  65, 90);
  // a-z
  } else if (n >= 97 && n <= 122) {
    n = cycleNumber(n, turn, 97, 122);
  // 0-9
  } else if (n >= 48 && n <= 57) {
    n = cycleNumber(n, turn, 48, 57);
  // braces, etc.
  } else if (n >= 91 && n <= 96) {
    n = cycleNumber(n, turn, 91, 96);
  // braces, etc.
  } else if (n >= 123 && n <= 125) {
    n = cycleNumber(n, turn, 123, 125);
  // @#$%
  } else if (n >= 33 && n <= 47) {
    n = cycleNumber(n, turn, 33, 47);
  }
  
  char nextLetter = (char) n;
  return nextLetter;
}

void drawLetter(char letter, int x, int y) {
  text(letter, leftMargin + x*letterSpacing, topMargin + y*lineSpacing);
}

void setColor(int x, int y, int counter) {
  float noiseValue = noise(x*noiseScale, y*noiseScale*letterRatio*frameCount*noiseSpeedY, frameCount*noiseSpeedZ);
  float colorBright = (noiseValue > noiseThresh) ? 0.0 : 1.0;

  fill(colorBright*255);
}

int cycleNumber(int n, int turn, int min, int max) {
  int rangeSize = max - min;
  int turnInRange = turn % rangeSize;
  
  n += turnInRange;
  
  if (n < min) {
    n = min;
  } else if (n > max) {
    int overRange = n-max;
    n = min + overRange;
  }

  return n;

}

void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  //print("### received an osc message.");
  //print(" addrpattern: "+theOscMessage.addrPattern());
  //println(" typetag: "+theOscMessage.typetag());
  if(theOscMessage.checkTypetag("f")) {
    float value = theOscMessage.get(0).floatValue();
   // println(String.format("%.02f", value));
    //noiseThresh = value;
    //println( Float.toString(value));
    //MyController.getController("noiseThresh").setValue(value);
  }
}
