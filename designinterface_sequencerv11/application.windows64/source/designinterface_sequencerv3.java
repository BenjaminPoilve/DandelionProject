import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 
import javax.swing.*; 
import controlP5.*; 
import java.util.Arrays; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class designinterface_sequencerv3 extends PApplet {



//the imports

 


 
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

public void setup()
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


public void draw()
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
      stroke(255,PApplet.parseInt(colorlist[firstpoint]*0.8f),PApplet.parseInt(colorlist[firstpoint])*0.8f);}else{stroke(255,0,0);};
      line(localisationlist[2*firstpoint], localisationlist[2*firstpoint+1], localisationlist[2*secondpoint], localisationlist[2*secondpoint+1]);  
      float dist=sqrt(pow(localisationlist[2*firstpoint]- localisationlist[2*secondpoint],2)+pow(localisationlist[2*firstpoint+1]- localisationlist[2*secondpoint+1],2));
      fill(255,255-PApplet.parseInt(colorlist[firstpoint]*0.8f),255-PApplet.parseInt(colorlist[firstpoint])*0.8f);
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









//classe de programme orient\u00e9 objet
class element{
  AudioSample son;
  int locationx;
  int locationy;
  boolean link1=false;
  boolean link2=false;
  int type;
  int num;
  float waittime;
  element(int tempx, int tempy, int temptype){
    locationx=tempx;
    locationy=tempy;
    type=temptype;
    num=elementlist.length;
    switch(type){
    case 1: 
          son=loadson();
    
    break;
    case 2: 
    
    break;
    case 3: 
        waittime=attente;
    
    break;
    }
          
   localisationlist=(int[]) append(localisationlist,locationx);
   localisationlist=(int[]) append(localisationlist,locationy);
   colorlist=(int[]) append(colorlist,255);
   effectlist=(int[]) append(effectlist,0);
   wantcalllist=(int[]) append(wantcalllist,0);
  }
  
  
  public void siappel(){
    println(num);
      switch(type){
    case 1: 
           callthenextone(num);
           son.trigger(); 
           colorlist[num]=100;
           son.trigger();  
           
    
    break;
    case 2: 
          callthenextone(num);
          colorlist[num]=100;       
          
    break;
    case 3: 
         if(effectlist[num]>1){ }else{
          
          effectlist[num]=PApplet.parseInt(bpm*waittime/2);
          wantcalllist[num]=1;
         }
         
    break;
    }
      
    }
    
  public void dessiner(){
    int couleur=colorlist[num];
    int effect=effectlist[num];
    switch(type){
    case 1: 
           strokeWeight(3);
           stroke(150,0,0);
           fill(0,0,0);
           ellipse(locationx, locationy, 50, 50);
           fill(couleur,0,0);
           ellipse(locationx, locationy, 35, 35);
    
    break;
    case 2: 
          strokeWeight(3);
           stroke(150,0,0);
          rectMode(CENTER);
           fill(couleur,0,0); 
           rect(locationx, locationy, 27, 27);
    break;
    case 3: 
           fill(255,0,0);
           strokeWeight(3);
           stroke(150,0,0);
           
           ellipse(locationx, locationy, 35, 35); 
           fill(255);
           if(effect==0){
             fill(255);
             ellipse(locationx+10,locationy,7,7);
           }else{
             float alpha=effect*PI/(bpm*2);
             ellipse(locationx+10*cos(alpha),locationy-10*sin(alpha),7,7);
           }
    break;
    }
   
  
  }
  
  public int returntype(){
    return type;
  }
}




public void mousePressed() {
  
  if(mouseX>40 & mouseY>40 & mouseX<1120 & mouseY<540){
  
 switch(globalswitch) {
  case 0: 
    println("linkmode"); 
     if (clickon==0){
      if(onanobject(mouseX,mouseY)!=0){
      clickon=1;
      firstclick=onanobject(mouseX,mouseY)-1;  
     
      }
    }else{
       clickon=0;
     if(onanobject(mouseX,mouseY)!=0 & onanobject(mouseX,mouseY)-1!=firstclick){
      linklist=(int[]) append(linklist,firstclick); 
      linklist=(int[]) append(linklist,onanobject(mouseX,mouseY)-1); 
     
     }
    }
   
    break;
  case 1: 
    println("addmode");  
    elementlist=(element[]) append(elementlist,new element(mouseX,mouseY,addswitch));
   
      
    
    
    break;
    
  case 2: 
    println("playmode"); 
    break;
   }

  }
}


public void graphicenviron(){
   //lets add the ip5 control
  cp5 = new ControlP5(this);
  cp5.tab("default").setId(0);
  cp5.tab("default").activateEvent(true);    
  
   c = new ControlTimer();
  c.setSpeedOfTime(1);
  
cp5.addCheckBox("checkBox")
     
                .setPosition(5, 655)
                .setColorBackground(color(35))
                .setColorForeground(color(35))
                .setColorActive(color(35))
                .setColorLabel(color(35))
                .setSize(40, 40)
                
                .addItem("0", 0) ;
              
  
cp5.addSlider("Tempo")
     .setRange(50,200)
     .setValue(250)
     .setPosition(840,670)
     .setSize(300,20);
     
cp5.addSlider("Waittime")
     .setRange(1,4)
     .setValue(2)
     .setPosition(230,670)
     .setSize(100,20);
     


  cp5.addButton("Splitter")
     .setBroadcast(false)
     .setPosition(90,565)
     .setImages(loadImage("split2.png"), loadImage("split1.png"), loadImage("split1.png"))
     .updateSize()
     .setValue(1)
     .setBroadcast(true)
     .getCaptionLabel().align(CENTER,CENTER)

     ;
     
  cp5.addButton("Soundbox")
     .setBroadcast(false)
     .setPosition(5,530)
      .setImages(loadImage("sound2.png"), loadImage("sound1.png"), loadImage("sound1.png"))
     .updateSize()
     .setValue(2)
     .setBroadcast(true)
     .getCaptionLabel().align(CENTER,CENTER)
     ;
     
  cp5.addButton("Wait")
     .setBroadcast(false)
     .setPosition(125,645)
     .setImages(loadImage("timer2.png"), loadImage("timer1.png"), loadImage("timer1.png"))
     .updateSize()
     .setValue(2)
     .setBroadcast(true)
     .getCaptionLabel().align(CENTER,CENTER)
     ;
  
  
    cp5.addButton("Play")
     .setBroadcast(false)
     .setPosition(565,625)
     .setImages(loadImage("play1.png"), loadImage("play2.png"), loadImage("play3.png"))
     .updateSize()
     .setValue(2)
     .setBroadcast(true)
     .getCaptionLabel().align(CENTER,CENTER)
     ;

  // arrange controller in separate tabs

  cp5.getController("Play").moveTo("global");
  cp5.getController("Splitter").moveTo("global");
  cp5.getController("Soundbox").moveTo("global");
  cp5.getController("Wait").moveTo("global");
  cp5.getController("Tempo").moveTo("global");
  cp5.getController("Waittime").moveTo("global");
}

public void callin(int num, int time){
  
   callinglist.add(num);
   timelist.add(time);
 
}

public void callthenextone(int num){
  int[] calllist=new int[0];
  for (int i=0 ; i<linklist.length/2; i++){
        if (linklist[i*2]==num){
          int el=linklist[i*2+1];
          calllist=(int[]) append(calllist,el); }
      }    
    
 for(int i=0; i<calllist.length; i++){
       int call=calllist[i];
       elementlist[call].siappel();
 }
}


public int onanobject(int x, int y){
  for (int i=0; i<elementlist.length; i++){
    if (x>localisationlist[2*i]-10 & x<localisationlist[2*i]+10 & y>localisationlist[2*i+1]-10 & y<localisationlist[2*i+1]+10){
      return i+1;

    }
  }
  return 0;
}



//controlevent


public void Splitter(int theColor) {

  println("change to splittermode");
  addswitch=2;
}

public void Wait(int theColor) {

  println("change to waitmode");
  addswitch=3;
}

public void Soundbox(int theColor) {

  println("change to Soundboxmode");
  addswitch=1;
}


public void Play(int theColor) {

  println("change to Soundboxmode");
  elementlist[0].siappel();
}

public void Tempo(int tempo) {
  bpm=tempo/5;
 
 
}

public void Waittime(int temp) {
  attente=(temp)*2;
 
 
}


public void checkBox(float[] a) {
  globalswitch=PApplet.parseInt(a[0]);
  println(globalswitch);
  println(a);
}


//loader


 public AudioSample loadson()
{
   AudioSample sample;
  
    try { 
      UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName()); 
  } catch (Exception e) { 
      e.printStackTrace();  
       } 
 
// create a file chooser 
    final JFileChooser fc = new JFileChooser(); 
 
// in response to a button click: 
    int returnVal = fc.showOpenDialog(this); 
 File file = fc.getSelectedFile(); 
 
       sample = minim.loadSample(file.getPath(),2048); 
        
        return sample;       
}



//fin de minim

public void stop()
{
  // always close Minim audio classes when you are done with them

  // always stop Minim before exiting
  minim.stop();
  
  super.stop();
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "designinterface_sequencerv3" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
