class nunchaku {
  int t = 0;
  int r = int(random(10000, 20000));
  float x = 0;
  float hastighed = 0;
  int frame = 0;
  int frameTid = 0;
  int blinkTid = 0;
  int omraade = 0;
  boolean blink = false;
  boolean angrib = false;
  boolean playSound = false;
  float side = 0;

  void opdater() {
    if (millis() > t+r) {
      if (!katana.angrib) {
        t = millis();
        r = int(random(10000, 20000));
        angrib = true;
        blinkTid = 0;
        blink = false;
        playSound = true;
        omraade = int(random(-0.5, 2.5));
        frame = 0;
        frameTid = millis();
        side = random(1);
        if (side > 0.5) {
          x = -360;
          hastighed = 3;
        } else {
          x = width+360;
          hastighed = -3;
        }
      } else {
        t = millis();
        r = int(random(10000, 20000));
      }
    }

    if (millis() > frameTid+20) {
      frameTid = millis();
      frame ++;
    }

    if (angrib && millis() > t+1500) {
      x += hastighed*deltaTime.dT;
    }

    if (angrib && millis() > blinkTid+100) {
      blink = !blink;
      blinkTid = millis();
    }

    if (x < -360 || x > width+360) {
      angrib = false;
    }
  }

  void vis() {
    if (angrib) {
      if (millis() < t+1500) {
        if (blink) {
          image(nunchakuOmraade, 0, omraade*height/3, width, height/3);
        }
      } else if (playSound && !gameover) {
        nunchakuAttack.play();
        playSound = false;
      }
      image(nunchakuAnimation[frame % 6], x-180, omraade*height/3, 360, 360);
      if (dist(mouseX, mouseY, x, omraade*height/3+height/6) < 180+30 && !spiller.udoedelig && !spiller.bobleAktiv) {
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

      if (spiller.bobleAktiv && dist(mouseX, mouseY, x, omraade*height/3+height/6) < 180+62.5) {
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
