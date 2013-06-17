//classe de programme orienté objet

class element{
  
  
  AudioSample son;
  
  boolean clickedon=false;
  int locationx;
  int locationy;
  boolean link1=false;
  boolean link2=false;
  int type;
  int num;
  int waittime;
  
  element(int tempx, int tempy, int temptype){
    locationx=tempx;
    locationy=tempy;
    type=temptype;
    num=elementlist.length;
    boolean isok=true;
   
  
   localisationlist=(int[]) append(localisationlist,locationx);
   localisationlist=(int[]) append(localisationlist,locationy);
   colorlist=(int[]) append(colorlist,255);
   effectlist=(int[]) append(effectlist,0);
   wantcalllist=(int[]) append(wantcalllist,0); 
   
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
  
  }
  
  
  void siappel(){
    println(num);
      switch(type){
    case 1: 
           callthenextone(num);
           
           //son.addEffect(bpf);
           son.trigger(); 
           colorlist[num]=75;
           son.trigger();  
          
    break;
    case 2: 
          callthenextone(num);
          colorlist[num]=75; 
    
          
            if(num==0){
              if(wantcalllist[num]==0){
           effectlist[num]=millis()+int(bpm*32/2)*10;
          wantcalllist[num]=1; } }
          
    break;
    case 3: 
         if(wantcalllist[num]!=0){ }else{
          effectlist[num]=millis()+int(bpm*waittime/2)*10;
          wantcalllist[num]=1;
         }
         
    break;
    }
      
    }
    
    
    
  void clicked(){
    clickedon=!clickedon;
  }
  
  
  
  void dessiner(){
   
    int couleur=colorlist[num];
    int effect=(effectlist[num]-millis())/10;
    
    if(clickedon==false){
         noStroke();
      }else{
        strokeWeight(3);
        stroke(255);
      }
    
    
    switch(type){     
    case 1: 
           stroke(int(31*couleur/255),int(153*couleur/255),int(214*couleur/255),120);
           noFill();
           strokeWeight(10);
           
           ellipse(locationx, locationy, 60-son.mix.get(0)*50, 60-son.mix.get(0)*50);
           noStroke();
               if(clickedon==false){
                noStroke();
              }else{
               strokeWeight(3);
               stroke(255);
             }
           
           fill(int(31*couleur/255),int(153*couleur/255),int(214*couleur/255));
           ellipse(locationx, locationy, 40+son.mix.get(0)*50,40+son.mix.get(0)*50);
           
    break;
    case 2: 
         
        
           
           fill(int(31*couleur/255),int(153*couleur/255),int(214*couleur/255),120);
           rectMode(CENTER);
           
           rect(locationx, locationy, 35, 35,10,10,10,10);
           fill(int(31*couleur/255),int(153*couleur/255),int(214*couleur/255));
            rect(locationx, locationy, 15, 15,10,10,10,10); 
            rectMode(CORNER);
              if(num==0){
             if(abs(effect/bpm)<=2){
                fill(int(31*couleur/255),int(153*couleur/255),int(214*couleur/255),120);
                ellipse(locationx, locationy, 80-10*effect/bpm, 80-10*effect/bpm);
               
             } 
              fill(255);
                 ellipse(locationx, locationy, 15, 15);
           
         }
    break;
    case 3: 
           fill(31,153,214,120);
           
           
           ellipse(locationx, locationy, 63, 63); 
           fill(31,153,214);
           ellipse(locationx, locationy, 15, 15); 
          
           rect(locationx-6, locationy-46,12,12,4,4,4,4);
           
           float decal= -(bpm*waittime/2)*PI/(bpm*4)+PI/2;
           rect(locationx-6+40*cos(decal),locationy-6-40*sin(decal),12,12,4,4,4,4);
           fill(255);
           if(wantcalllist[num]==0){
             
             ellipse(locationx,locationy-28,11,11);
           }else{
             float alpha=effect*PI/(bpm*4)-(bpm*waittime/2)*PI/(bpm*4)+PI/2;
             for(float angle=PI/2; angle>alpha; angle=angle-0.1){
             ellipse(locationx+28*cos(angle),locationy-28*sin(angle),11,11);
             }
           }
    break;
    
    }
   
    noStroke();
  
  }
  
  int returntype(){
    return type;
  }



  int returnwait(){
    return waittime;
  }
}


