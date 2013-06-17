
void mousePressed() {
  
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


