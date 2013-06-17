

//the imports
import ddf.minim.*;
import javax.swing.*; 
import controlP5.*;
import java.util.Arrays;
 
//global variables
Minim minim;
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

void setup()
{
  
  size(1200,700);
  timelist=new ArrayList<Integer>();
  callinglist=new ArrayList<Integer>();
  noStroke();
 graphicenviron();
 frameRate(30);


  minim = new Minim(this);
  //add the debut
 elementlist=(element[]) append(elementlist,new element(600,80,2));

}


void draw()
{
  background(35);
  fill(35);
  stroke(50);
  rectMode(CORNER); 
  fill(0);
  rect(40, 40, 1120, 620);
  rectMode(CENTER); 
  fill(35);
  rect(600, 665, 400, 100);

  if(globalswitch==1){
    stroke(50);
    fill(30);
    ellipse(0,700,400,400);
    cp5.controller("Waittime").show();
    cp5.controller("Wait").show();
    cp5.controller("Soundbox").show();
    cp5.controller("Splitter").show();
       }else{
    stroke(50);
    fill(30);
    ellipse(0,700,200,200);

    cp5.controller("Waittime").hide();
    cp5.controller("Wait").hide();
    cp5.controller("Soundbox").hide();
    cp5.controller("Splitter").hide(); }
  
    //drawing the lines
  for (int i=0; i<linklist.length/2; i++){
    strokeWeight(3);
    int firstpoint=linklist[i*2];
    int secondpoint=linklist[i*2+1];
    if (colorlist[firstpoint]<255 & colorlist[firstpoint]>150 ){
      stroke(255,int(colorlist[firstpoint]*0.8),int(colorlist[firstpoint])*0.8);}else{stroke(255,0,0);};
      line(localisationlist[2*firstpoint], localisationlist[2*firstpoint+1], localisationlist[2*secondpoint], localisationlist[2*secondpoint+1]);  
      float dist=sqrt(pow(localisationlist[2*firstpoint]- localisationlist[2*secondpoint],2)+pow(localisationlist[2*firstpoint+1]- localisationlist[2*secondpoint+1],2));
      fill(255,255-int(colorlist[firstpoint]*0.8),255-int(colorlist[firstpoint])*0.8);
      ellipse( localisationlist[2*secondpoint]-15*(localisationlist[2*secondpoint]-localisationlist[2*firstpoint])/dist,localisationlist[2*secondpoint+1]-15*(localisationlist[2*secondpoint+1]-localisationlist[2*firstpoint+1])/dist,10,10);
  }
  strokeWeight(1);
  stroke(0);

  

  
  //drawing the element
  for (int i=0 ; i<elementlist.length; i++){
    elementlist[i].dessiner();
  }
 
 
  fill(255,40,40);
  strokeWeight(3);
  stroke(150,0,0);
  ellipse(600,80,60,60);
  
  
 //the waiting function 
  
/*  int longueur=callinglist.size();
  for(int i=0; i<callinglist.size();i++){
    int timeact=timelist.get(i);
    if (timeact==1){
      int tocall=callinglist.get(i);
      colorlist[tocall]=150;
      callthenextone(tocall);
      timelist.remove(i);
      callinglist.remove(i);
      i=i-1;
      
    }else{
      int tocall=callinglist.get(i);
      timelist.remove(i);
      callinglist.remove(i);
      timelist.add(timeact-1);
      callinglist.add(tocall);
    }
  }*/
  
  
 for(int i=0; i<effectlist.length;i++){
    
    if (effectlist[i]==0 & wantcalllist[i]==1){
      wantcalllist[i]=0;
      colorlist[i]=150;
      callthenextone(i);
      
    }
 }
  
  
  
  
  //the color part
  for (int i=0 ; i<colorlist.length; i++){
    if(colorlist[i]!=255){
      
      colorlist[i]=colorlist[i]+5;
    }
  }
  
  //the animated part
    for (int i=0 ; i<effectlist.length; i++){
    if(effectlist[i]!=0){
      
      effectlist[i]=effectlist[i]-1;
    }
  }
  
 
}









