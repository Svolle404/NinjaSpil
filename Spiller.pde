class spiller {
  int liv = 3;
  int t = 0;
  int frame = 0;
  boolean udoedelig = false;
  int udoedeligTid = 0;
  boolean blink = false;
  int blinkTid = 0;
  int score = 0;
  PVector doedsposition = new PVector();
  int svaerhed = 0;
  boolean bobleAktiv = false;

  void opdater() {
    if (millis() > t+100) {
      t = millis();
      frame ++;
    }

    if (udoedelig) {
      if (millis() > udoedeligTid) {
        udoedelig = false;
      }

      if (millis() > blinkTid+100) {
        blinkTid = millis();
        blink = !blink;
      }
    }

    svaerhed = (millis()-hud.startTid+2500)/2500;
  }

  void vis() {
    if (!gameover) {
      if (udoedelig) {
        if (blink) {
          image(spillerAnimation[frame % 6], mouseX-37.5, mouseY-40, 75, 160);
        }
      } else {
        image(spillerAnimation[frame % 6], mouseX-37.5, mouseY-40, 75, 160);
      }
      if (bobleAktiv) {
        image(boble, mouseX-62.5, mouseY-62.5, 125, 125);
      }
    } else {
      image(spillerAnimation[frame % 6], doedsposition.x-37.5, doedsposition.y-40, 75, 160);
      if (bobleAktiv) {
        image(boble, doedsposition.x-62.5, doedsposition.y-62.5, 125, 125);
      }
    }
  }
}
