class tabt {
  int t = 0;
  int s = 0;
  String spillerNavn = "";
  String saveScore = "SAVE SCORE";
  boolean blink = false;
  int blinkTimer = 0;
  color score = color(255);
  boolean search = true;

  void opdater() {
    if (millis() > t+1000 && s < 3) {
      t = millis();
      s ++;
    }

    if (millis() > blinkTimer+300) {
      blinkTimer = millis();
      blink = !blink;
    }
  }

  void vis() {
    textAlign(CENTER, CENTER);
    fill(0);

    if (spillerNavn.length() == 0) {
      score = color(100);
    } else {
      score = color(255);
      if (mouseX > width/2-textWidth("SAVE SCORE")/2 && mouseX < width/2+textWidth("SAVE SCORE")/2 && mouseY > height/2+height/8+height/16-33 && mouseY <  height/2+height/8+height/16-33+80) {
        saveScore = ">SAVE SCORE<";
        if (mousePressed) {
          for (int i = 0; i < 10; i++) {
            if (search) {
              if (spiller.score > int(hovedmenu.leaderboard[i*2+1])) {
                for (int j = 0; j < 9-i; j++) {
                  hovedmenu.leaderboard[19-j*2-1] = hovedmenu.leaderboard[19-j*2-3];
                  hovedmenu.leaderboard[19-j*2] = hovedmenu.leaderboard[19-j*2-2];
                }  
                hovedmenu.leaderboard[i*2] = spillerNavn;
                hovedmenu.leaderboard[i*2+1] = str(spiller.score);
                search = false;
              }
            }
          }
          saveStrings("leaderboard.txt", hovedmenu.leaderboard);
          hovedmenu.leaderboard = loadStrings("leaderboard.txt");
          side = 0;
          spiller.score = 0;
          spillerNavn = "";
          gameover = false;
          spiller.liv = 3;
          katana.t = millis();
          nunchaku.t = millis();
          powerups.t = millis();
          for (int i = 0; i < 500; i++) {
            kastestjerner[i].position.set(-100, -100);
            kastestjerner[i].retning.set(-1, -1);
            kastestjerner[i].x = int(random(-0.5, 2.5));
            kastestjerner[i].rotationTid = 0;
          }
        }
      } else {
        saveScore= "SAVE SCORE";
      }
    }

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        textFont(kongtext, 80);

        if (s > 0) {
          text("SCORE: "+spiller.score, width/2+i*4-4, height/2-height/8*2-height/16+j*4-4);
          text("YOUR BALLOON POPPED", width/2+i*4-4, height/2-height/8-height/16+j*4-4);
        }

        if (s > 2) {
          text(saveScore, width/2+i*4-4, height/2+height/8+height/16+j*4-4);
        }

        textFont(kongtext, 160);
        if (s > 1) {
          if (blink) {
            text(" "+spillerNavn+"_", width/2+i*4-4, height/2+j*4-4);
          } else {
            text(spillerNavn, width/2+i*4-4, height/2+j*4-4);
          }
        }
      }
    }

    fill(255);
    textFont(kongtext, 80);
    if (s > 0) {
      text("SCORE: "+spiller.score, width/2, height/2-height/8*2-height/16);
      text("YOUR BALLOON POPPED", width/2, height/2-height/8-height/16);
    }

    if (s > 2) {
      fill(score);
      text(saveScore, width/2, height/2+height/8+height/16);
    }

    textFont(kongtext, 160);
    fill(255);
    if (s > 1) {
      if (blink) {
        text(" "+spillerNavn+"_", width/2, height/2);
      } else {
        text(spillerNavn, width/2, height/2);
      }
    }
  }
}
