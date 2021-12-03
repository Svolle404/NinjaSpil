class katana {
  int t = 0;
  int r = int(random(5000, 15000));
  int blinkTid = 0;
  int omraade = 0;
  boolean blink = false;
  boolean angrib = false;
  boolean playSound = false;

  void opdater() {
    if (millis()-hud.startTid > t+r) {
      if (!nunchaku.angrib) {
      t = millis();
      r = int(random(5000, 15000));
      angrib = true;
      blinkTid = 0;
      blink = false;
      playSound = true;
      omraade = int(random(-0.5, 2.5));
      } else {
        t = millis();
        r = int(random(5000, 15000));
      }
    }

    if (angrib && millis() > blinkTid+100) {
      blink = !blink;
      blinkTid = millis();
    }

    if (millis() > t+1700) {
      angrib = false;
    }
  }

  void vis() {
    if (angrib) {
      if (blink && millis() < t+1500) {
        image(katanaOmraade, omraade*width/3, 0, width/3, height);
      }

      if (millis() > t+1500 && !gameover) {
        image(katanaSwoosh, omraade*width/3, 0, width/3, height);
        if (playSound) {
          katanaAttack.play();
          playSound = false;
          if (mouseX > omraade*width/3-30 && mouseX < omraade*width/3+width/3+30 && !spiller.udoedelig && !spiller.bobleAktiv) {
            if (spiller.liv > 0) {
              spiller.liv --;
              spiller.udoedelig = true;
              spiller.udoedeligTid = millis()+3000;
              spiller.blink = true;
              spiller.blinkTid = millis();
              hit.play();
              if (spiller.liv == 0) {
                spiller.score = millis()-hud.startTid;
                gameover = true;
                spiller.doedsposition = new PVector(mouseX, mouseY);
              }
            }
          }

          if (spiller.bobleAktiv && mouseX > omraade*width/3-30 && mouseX < omraade*width/3+width/3+30) {
            spiller.udoedelig = true;
            spiller.udoedeligTid = millis()+3000;
            spiller.blink = true;
            spiller.blinkTid = millis();
            hit.play();
            spiller.bobleAktiv = false;
          }
        }
      }
    }
  }
}
