
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
}

void Wait(int theColor) {

  println("change to waitmode");
  addswitch=3;
}

void Soundbox(int theColor) {

  println("change to Soundboxmode");
  addswitch=1;
}


void Play(int theColor) {

  println("change to Soundboxmode");
  elementlist[0].siappel();
}

void Tempo(int tempo) {
  bpm=tempo/5;
 
 
}

void Waittime(int temp) {
  attente=(temp)*2;
 
 
}


void checkBox(float[] a) {
  globalswitch=int(a[0]);
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
 File file = fc.getSelectedFile(); 
 
       sample = minim.loadSample(file.getPath(),2048); 
        
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
