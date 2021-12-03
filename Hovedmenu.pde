class hovedmenu {
  String play = "PLAY";
  String quit = "QUIT";
  void vis() {
    fill(0, 100);
    noStroke();
    rect(width/5-250, 0, 500, height);
    rect(width-width/5+250, 0, -width/2, height);
    textAlign(CENTER, CENTER);
    textFont(kongtext, 80);

    fill(0);
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        text(play, width/5+i*4-4, height/2-60+j*4-4);
      }
    }
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        text(quit, width/5+i*4-4, height/2+60+j*4-4);
      }
    }

    fill(255);
    text(play, width/5, height/2-60);
    text(quit, width/5, height/2+60);

    fill(255, 100);
    noStroke();
    //rect(width/5-textWidth("PLAY")/2, height/2-90, textWidth("PLAY"), 70); 

    if (mouseX > width/5-textWidth("PLAY")/2 && mouseX < width/5+textWidth("PLAY")/2 && mouseY > height/2-90 && mouseY < height/2-90+70) {
      play = ">PLAY<";
      if (mousePressed) {
        side = 1;
        hud.startTid = millis()+3000;
      }
    } else {
      play = "PLAY";
    }

    if (mouseX > width/5-textWidth("QUIT")/2 && mouseX < width/5+textWidth("QUIT")/2 && mouseY > height/2-90+120 && mouseY < height/2-90+70+120) {
      quit = ">QUIT<";
      if (mousePressed) {
        exit();
      }
    } else {
      quit = "QUIT";
    }
  }
}
