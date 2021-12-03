class hud {
  int startTid = 0;
  int staticMillis = 0;

  void visScore() {
    textAlign(LEFT, TOP);
    textFont(kongtext, 60);

    staticMillis = millis();

    if (millis()-startTid >= 0) {
      fill(0);
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (!gameover) {
            text("SCORE: "+(staticMillis-startTid), 10+i*4-4, 10+j*4-4);
          } else {
            text("SCORE: "+spiller.score, 10+i*4-4, 10+j*4-4);
          }
        }
      }

      fill(255);
      if (!gameover) {
        text("SCORE: "+(staticMillis-startTid), 10, 10);
      } else {
        text("SCORE: "+spiller.score, 10, 10);
      }
    }
  }

  void visNedtaelling() {
    textAlign(CENTER, CENTER);
    textFont(kongtext, 160);

    if (millis()-startTid < 0) {
      fill(0);
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          text((startTid-staticMillis+1000)/1000, width/2+i*4-4, height/2+j*4-4);
        }
      }

      fill(255);
      text((startTid-staticMillis+1000)/1000, width/2, height/2);
    }
  }

  void visLiv() {
    textAlign(RIGHT, TOP);
    textFont(kongtext, 60);

    if (millis()-startTid >= 0) {
      fill(0);
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          text("LIVES: "+spiller.liv+"/3", width-10+i*4-4, 10+j*4-4);
        }
      }

      fill(255);
      text("LIVES: "+spiller.liv+"/3", width-10, 10);
    }
  }
}
