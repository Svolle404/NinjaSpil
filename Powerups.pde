class powerups {
  int t = 0;
  int r = int(random(15000, 20000));
  int powerup = 0;
  IntList powerups = new IntList();
  int fjernKastestjerner = 0;
  boolean spawnPowerup = false;
  int powerupTimer = 0;
  PVector position = new PVector();
  boolean langsommeKastestjerner = false;
  int langsommeKastestjernerTid = 0;
  boolean blink = false;
  int blinkTid = 0;

  void opdater() {
    if (millis()-hud.startTid > t+r) {
      t = millis();
      r = int(random(15000, 20000));
      powerups.clear();
      powerups.append(0); // Langsommere kastestjerner i 10 sekunder
      if (!spiller.bobleAktiv) {
        powerups.append(1); // Gør spilleren udødelig i 5 sekunder
      }
      if (spiller.liv < 3) {
        powerups.append(2); // Ekstra liv
      }
      if (spiller.svaerhed-fjernKastestjerner > 10) {
        powerups.append(3); // Fjern 10 kastestjerner
      }
      powerups.shuffle();
      spawnPowerup = true;
      powerupTimer = millis();
      position.set(random(100, width-100), random(100, height-100));
      powerupSpawn.play();
      blink = true;
      blinkTid = 0;
    }

    if (spawnPowerup && millis() > powerupTimer+5000) {
      spawnPowerup = false;
    }

    if (spawnPowerup) {
      if (powerupTimer+5000-millis() < 2000 && millis() > blinkTid+100) {
        blinkTid = millis();
        blink = !blink;
      }
    }

    if (langsommeKastestjerner && millis() > langsommeKastestjernerTid+10000) {
      langsommeKastestjerner = false;
    }
  }

  void vis() {
    if (spawnPowerup) {
      if (powerups.get(0) == 0) {
        if (blink) {
          image(powerupIkoner[0], position.x-25, position.y-25, 50, 50);
        }
        if (!gameover && dist(mouseX, mouseY-5, position.x, position.y) < 30+25) {
          langsommeKastestjerner = true;
          langsommeKastestjernerTid = millis();
          spawnPowerup = false;
          powerupAktiver.play();
        }
      } else if (powerups.get(0) == 1) {
        if (blink) {
          image(powerupIkoner[1], position.x-25, position.y-25, 50, 50);
        }
        if (!gameover && dist(mouseX, mouseY-5, position.x, position.y) < 30+25) {
          spiller.bobleAktiv = true;
          spawnPowerup = false;
          powerupAktiver.play();
        }
      } else if (powerups.get(0) == 2) {
        if (blink) {
          image(powerupIkoner[2], position.x-25, position.y-25, 50, 50);
        }
        if (!gameover && dist(mouseX, mouseY-5, position.x, position.y) < 30+25) {
          spiller.liv ++;
          spawnPowerup = false;
          powerupAktiver.play();
        }
      } else if (powerups.get(0) == 3) {
        if (blink) {
          image(powerupIkoner[3], position.x-25, position.y-25, 50, 50);
        }    
        if (!gameover && dist(mouseX, mouseY-5, position.x, position.y) < 30+25) {
          fjernKastestjerner += 10;
          spawnPowerup = false;
          powerupAktiver.play();
        }
      }
    }
  }


  // Ekstra liv
  // Langsommere kastestjerner
  // Fjern x kastestjerner
  // Udødelighed
}
