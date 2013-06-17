//classe de programme orienté objet
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
  
  
  void siappel(){
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
          
          effectlist[num]=int(bpm*waittime/2);
          wantcalllist[num]=1;
         }
         
    break;
    }
      
    }
    
  void dessiner(){
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
  
  int returntype(){
    return type;
  }
}



