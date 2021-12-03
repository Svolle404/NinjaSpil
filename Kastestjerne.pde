class kastestjerne {
  int stoerrelse = 50;
  float hastighed = 0.3;
  PVector position = new PVector(-2*stoerrelse, -2*stoerrelse);
  PVector retning = new PVector(-1, -1);
  int rotationTid = 0;
  int x = int(random(-0.5, 2.5));

  void opdater() {
    retning.normalize();

    if (powerups.langsommeKastestjerner) {
      hastighed = 0.15;
    } else {
      hastighed = 0.3;
    }

    position.set(position.x+retning.x*hastighed*deltaTime.dT, position.y+retning.y*hastighed*deltaTime.dT);

    if (millis() > rotationTid+100) {
      rotationTid = millis();
      x ++;
    }

    if (position.x > width+stoerrelse) {
      position.x = -stoerrelse;
      retning = PVector.random2D();
      position.y = random(0, height);
    } else if (position.x < -stoerrelse) {
      position.x = width+stoerrelse;
      position.y = random(0, height);
      retning = PVector.random2D();
    }

    if (position.y > height+stoerrelse) {
      position.y = -stoerrelse;
      position.x = random(0, width);
      retning = PVector.random2D();
    } else if (position.y < -stoerrelse) {
      position.y = height+stoerrelse;
      position.x = random(0, width);
      retning = PVector.random2D();
    }

    if (dist(mouseX, mouseY-5, position.x, position.y) < 30+25 && !spiller.udoedelig && !spiller.bobleAktiv) {
      if (spiller.liv > 0) {
        spiller.liv --;
        spiller.udoedelig = true;
        spiller.udoedeligTid = millis()+3000;
        spiller.blink = true;
        spiller.blinkTid = millis();
        hit.play();
        if (spiller.liv == 0) {
          spiller.score  = millis()-hud.startTid;
          gameover = true;
          spiller.doedsposition = new PVector(mouseX, mouseY);
          tabt.t = millis();
          tabt.s = 0;
          tabt.search = true;
        }
      }
    }

    if (spiller.bobleAktiv && dist(mouseX, mouseY, position.x, position.y) < 62.5+25) {
      spiller.udoedelig = true;
      spiller.udoedeligTid = millis()+3000;
      spiller.blink = true;
      spiller.blinkTid = millis();
      hit.play();
      spiller.bobleAktiv = false;
    }
  }  

  void vis() {
    pushMatrix();
    translate(position.x, position.y);
    image(kastestjerne[x % 3], -stoerrelse/2, -stoerrelse/2, stoerrelse, stoerrelse);
    popMatrix();
  }
}
