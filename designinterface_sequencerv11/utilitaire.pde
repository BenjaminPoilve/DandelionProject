//implementer drag and drop
//voir si on trouve mieux pour timer
void drawlines(){
  
  
     //drawing the lines
  for (int i=0; i<linklist.length/2; i++){
    strokeWeight(2);
     int decalx=0;
     int decaly=0;
     int decalxsec=0;
     int secondpoint=linklist[i*2+1];
     int firstpoint=linklist[i*2];   
    switch (elementlist[firstpoint].returntype()){
      case 1:        
      break;
    case 2:  
    break;
    case 3: if(elementlist[firstpoint].returnwait()==2){
            decaly=int(20*sqrt(2));
            decalxsec=int(-20*sqrt(2));
    }
           if(elementlist[firstpoint].returnwait()==4){
           decaly=40; 
    }     if(elementlist[firstpoint].returnwait()==6){
            decaly=int(20*sqrt(2));
            decalxsec=int(20*sqrt(2));
    }     if(elementlist[firstpoint].returnwait()==8){
          decalxsec=40;
    }
   
   
    
     break;}
     
     switch (elementlist[secondpoint].returntype()){
      case 1:
      break;
    case 2:  
    break;
    case 3:  decalx=-40;
     break;}
           
    float dist=sqrt(pow(localisationlist[2*firstpoint]+decaly- localisationlist[2*secondpoint],2)+pow(localisationlist[2*firstpoint+1]+decalxsec- (localisationlist[2*secondpoint+1]+decalx),2));
    if (colorlist[firstpoint]<150 & colorlist[firstpoint]>70 ){
      stroke(255);
      fill(255);
      int quotient=int((150-colorlist[firstpoint])*dist/80);
      ellipse( localisationlist[2*secondpoint]-quotient*(localisationlist[2*secondpoint]-(localisationlist[2*firstpoint]+decaly))/dist,localisationlist[2*secondpoint+1]+decalx-quotient*(localisationlist[2*secondpoint+1]+decalx-(localisationlist[2*firstpoint+1]+decalxsec))/dist,10,10);
 
      }
      else{stroke(255);};
      line(localisationlist[2*firstpoint]+decaly,localisationlist[2*firstpoint+1]+decalxsec, localisationlist[2*secondpoint], decalx+localisationlist[2*secondpoint+1]);  
      fill(255);
      ellipse( localisationlist[2*secondpoint]-0*(localisationlist[2*secondpoint]-(localisationlist[2*firstpoint]+decaly))/dist,decalx+localisationlist[2*secondpoint+1]-0*(decalx+localisationlist[2*secondpoint+1]-(localisationlist[2*firstpoint+1]+decalxsec))/dist,12,12);
  }
  
  
  
  
  
  
}

void callin(int num, int time){
  
   callinglist.add(num);
   timelist.add(time);
 
}



void callthenextone(int num){
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


int onanobject(int x, int y){
  for (int i=0; i<elementlist.length; i++){
    if (x>localisationlist[2*i]-10 & x<localisationlist[2*i]+10 & y>localisationlist[2*i+1]-10 & y<localisationlist[2*i+1]+10){
      return i+1;

    }
  }
  return 0;
}



//controlevent


void Splitter(int theColor) {

  println("change to splittermode");
  addswitch=2;
   cursor(split);
}

void Wait(int theColor) {

  println("change to waitmode");
  addswitch=3;
   cursor(timer);
}

void Soundbox(int theColor) {

  println("change to Soundboxmode");
  addswitch=1;
   cursor(sound);
}


void Play(int theColor) {

  println("change to Soundboxmode");
  if(wantcalllist[0]==0){
  elementlist[0].siappel();
   cp5.getController("Play").setImages(loadImage("pause.png"), loadImage("pause.png"), loadImage("pause.png"));
    } else {
    cp5.getController("Play").setImages(play, play, loadImage("play2.png"));
    wantcalllist[0]=0;}
}

void Tempo(int tempo) {
  bpm=tempo/5;
 
 
}

void Band(int bandloc) {
  bpf.setFreq(bandloc);
 
 
}
void Bandwidth(int bandwidth) {
   bpf.setBandWidth(bandwidth);
 
 
}

void Waittime(int temp) {
  attente=(temp)*2;
 
 
}


void checkBox(int a) {
  globalswitch=abs(globalswitch-a);
  println(globalswitch);
  println(a);
}


//loader


 AudioSample loadson()
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
 if (returnVal == JFileChooser.APPROVE_OPTION) { 
  File file = fc.getSelectedFile(); 
  // see if it's an image 
  // (better to write a function and check for all supported extensions) 
  if (file.getName().endsWith("mp3")||file.getName().endsWith("wav")) { 
    // load the image using the given file path
   sample = minim.loadSample(file.getPath(),2048); 
        
          
  } else { 
   sample=null;
    
  } 
} else { 
  sample=null;
  println("Open command cancelled by user."); 
}
 
 return sample;          
}



//fin de minim

void stop()
{
  // always close Minim audio classes when you are done with them

  // always stop Minim before exiting
  minim.stop();
  
  super.stop();
}
