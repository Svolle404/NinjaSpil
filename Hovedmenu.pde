class hovedmenu {
  String play = "PLAY";
  String quit = "QUIT";
  String[] leaderboard = loadStrings("leaderboard.txt");

  void vis() {
    fill(0, 150);
    noStroke();
    rect(width/5-250, 0, 500, height);
    rect(width-width/5+250, 0, -width/2, height);
    fill(0);

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        textAlign(CENTER, CENTER);
        textFont(kongtext, 80);
        text(play, width/5+i*4-4, height/2-60+j*4-4);
        text(quit, width/5+i*4-4, height/2+60+j*4-4);
        text("LEADERBOARD", width-width/5+250-width/4+i*4-4, 100+j*4-4);
        textFont(kongtext, 40);
        for (int k = 0; k < 10; k++) {
          textAlign(LEFT, CENTER);
          text(leaderboard[k*2], width-width/5+250-width/2+50+i*4-4, 300+60*k+j*4-4);
          textAlign(RIGHT, CENTER);
          text(leaderboard[k*2+1], width-width/5+250-50+i*4-4, 300+60*k+j*4-4);
        }
      }
    }

    fill(255);
    textFont(kongtext, 80);
    textAlign(CENTER, CENTER);
    text(play, width/5, height/2-60);
    text(quit, width/5, height/2+60);
    text("LEADERBOARD", width-width/5+250-width/4, 100);

    textFont(kongtext, 40);
    for (int k = 0; k < 10; k++) {
      textAlign(LEFT, CENTER);
      text(leaderboard[k*2], width-width/5+250-width/2+50, 300+60*k);
      textAlign(RIGHT, CENTER);
      text(leaderboard[k*2+1], width-width/5+250-50, 300+60*k);
    }

    textFont(kongtext, 80);
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
