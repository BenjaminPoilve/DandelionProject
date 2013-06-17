void graphicenviron(){
   //lets add the ip5 control
  cp5 = new ControlP5(this);
  cp5.tab("default").setId(0);
  cp5.tab("default").activateEvent(true);    
  
   c = new ControlTimer();
  c.setSpeedOfTime(1);
  
cp5.addButton("checkBox")
                .activateBy(ControlP5.PRESSED)
                .setBroadcast(false)
                .setPosition(14, 505)
                .setColorBackground(color(35))
                .setColorForeground(color(35))
                .setColorActive(color(35))
                .setColorLabel(color(35))
                .setSize(46, 46)
                .setImages(loadImage("plus.png"), loadImage("plus.png"), loadImage("plus2.png"))
                .updateSize()
               .setValue(1)
               .setBroadcast(true)
                ;
              
  
cp5.addSlider("Tempo")
     .setRange(50,200)
     .setValue(250)
     .setPosition(128,663)
     .setSize(152,13)
     .setColorForeground(color(196, 196, 196))
     .setColorActive(color(210, 210, 210))
     .setColorBackground(color(112, 111, 111));
     
cp5.addSlider("Waittime")
     .setRange(1,4)
     .setValue(2)
     .setPosition(800,5)
     .setSize(100,20);
     



  cp5.addButton("Splitter")
     .activateBy(ControlP5.PRESSED)
     .setBroadcast(false)
     .setPosition(82,439)
     .setImages(loadImage("split2.png"), loadImage("split1.png"), loadImage("split1.png"))
     .updateSize()
     .setValue(1)
     .setBroadcast(true)
     .getCaptionLabel().align(CENTER,CENTER)

     ;
     
  cp5.addButton("Soundbox")
     .activateBy(ControlP5.PRESSED)
     .setBroadcast(false)
     .setPosition(6,402)
      .setImages(loadImage("sound2.png"), loadImage("sound1.png"), loadImage("sound1.png"))
     .updateSize()
     .setValue(2)
     .setBroadcast(true)
     .getCaptionLabel().align(CENTER,CENTER)
     ;
     
  cp5.addButton("Wait")
     .activateBy(ControlP5.PRESSED)
     .setBroadcast(false)
     .setPosition(121,512)
     .setImages(loadImage("timer2.png"), loadImage("timer1.png"), loadImage("timer1.png"))
     .updateSize()
     .setValue(2)
     .setBroadcast(true)
     .getCaptionLabel().align(CENTER,CENTER)
     ;
  
  
    cp5.addButton("Play")
     .setBroadcast(false)
     .setPosition(447,628)
     .setImages(play, play, loadImage("play2.png"))
     .updateSize()
     .setValue(2)
     .setBroadcast(true)
     .getCaptionLabel().align(CENTER,CENTER)
     ;
     
     cp5.addSlider("Band")
     .setRange(100,2000)
     .setValue(250)
     .setPosition(728,463)
     .setSize(152,13)
     .setColorForeground(color(196, 196, 196))
     .setColorActive(color(210, 210, 210))
     .setColorBackground(color(112, 111, 111));
     
     cp5.addSlider("Bandwidth")
     .setRange(50,500)
     .setValue(250)
     .setPosition(728,413)
     .setSize(152,13)
     .setColorForeground(color(196, 196, 196))
     .setColorActive(color(210, 210, 210))
     .setColorBackground(color(112, 111, 111));

  // arrange controller in separate tabs

  cp5.getController("Play").moveTo("global");
  cp5.getController("Splitter").moveTo("global");
  cp5.getController("Soundbox").moveTo("global");
  cp5.getController("Wait").moveTo("global");
  cp5.getController("Tempo").moveTo("global");
  cp5.getController("Waittime").moveTo("global");
}
