

//the imports
import ddf.minim.*;
import ddf.minim.effects.*;
import javax.swing.*; 
import controlP5.*;
import java.util.Arrays;
//cursor image
PImage split;
PImage timer;
PImage sound;
PImage fond;
PImage plusbutton;
PImage plusbuttonpushed;
PImage play;
//global variables
Minim minim;
BandPass bpf;
ControlP5 cp5;
ControlTimer c;
//global switching value in addmode
int addswitch;
//global switch
int globalswitch;
//systeme de numerotation
int globalnum=0;
element[] elementlist= new element[0];


//liste localisation et numero
int[] localisationlist= new int[0];
int clickon=0;
int[] linklist=new int[0];

//the element of the waiting part
ArrayList<Integer> callinglist;
ArrayList<Integer> timelist;
int[] removelist= new int[0];

//element to implement the clicking system
int firstclick;

//animation part (list to store the color of each element
int[] colorlist= new int[0];
int[] effectlist= new int[0];
int[] wantcalllist= new int[0];
int attente;
int bpm;

int bandloc;
int bandwidth;

//timer
int tempo; 
int clock; // the timer for moving from note to note

void setup()
{
  split=loadImage("data/split2.png");
  timer=loadImage("data/timer2.png");
  sound=loadImage("data/sound2.png");
  fond=loadImage("data/looknfeel wireframe-01.png");
  play=loadImage("data/play.png");
  plusbutton=loadImage("data/plusbutton-01.png");
  plusbuttonpushed=loadImage("data/plusbuttonpushed-01.png");
  size(948,711);
  timelist=new ArrayList<Integer>();
  callinglist=new ArrayList<Integer>();
  noStroke();
 graphicenviron();
 frameRate(50);


  minim = new Minim(this);
    bpf = new BandPass(440, 20, 2048);
  
  //add the debut
 elementlist=(element[]) append(elementlist,new element(474,80,2));

}


void draw()
{
  image(fond,0,0, 948, 711);

  cp5.controller("Band").hide();
    cp5.controller("Bandwidth").hide();
  
  if(globalswitch==1){
    image(plusbuttonpushed,4,203, 282 ,365);
    cp5.getController("checkBox").setImages(loadImage("moins.png"), loadImage("moins.png"), loadImage("moins.png"));
    cp5.controller("Waittime").show();
    cp5.controller("Wait").show();
    cp5.controller("Soundbox").show();
    cp5.controller("Splitter").show();
       }else{
    image(plusbutton,4,203, 282, 365);
    cp5.getController("checkBox").setImages(loadImage("plus.png"), loadImage("plus2.png"), loadImage("plus2.png"));
    cp5.controller("Waittime").hide();
    cp5.controller("Wait").hide();
    cp5.controller("Soundbox").hide();
    cp5.controller("Splitter").hide(); }
    
    
    
    

 drawlines();
  
 noStroke();
   fill(31,153,214,120);
  ellipse(474,80,60,60);

  
  
    //drawing the element
  for (int i=0 ; i<elementlist.length; i++){
    elementlist[i].dessiner();
  }
 
 
  
  
 
  
  
  
 for(int i=0; i<effectlist.length;i++){
    
    if ((effectlist[i]-millis())<0 & wantcalllist[i]==1){
      if(i==0){
       wantcalllist[i]=0;
       
      colorlist[i]=70;
      elementlist[0].siappel();
        
      }else{
      wantcalllist[i]=0;
      colorlist[i]=70;
      callthenextone(i);
      }
    }
 }
  
  
  
  
  //the color part
  for (int i=0 ; i<colorlist.length; i++){
    if(colorlist[i]!=255){
      
      colorlist[i]=colorlist[i]+10;
    }
  }
  
  //the animated part
    
  
 
}









