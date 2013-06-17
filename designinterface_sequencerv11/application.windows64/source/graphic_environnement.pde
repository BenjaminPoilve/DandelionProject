void graphicenviron(){
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
