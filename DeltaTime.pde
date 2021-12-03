class deltaTime {
  long tid = 0;
  long tidNu = 0;
  float dT = 0;

  void beregn() {
    tidNu = millis();
    dT = (tidNu-tid);
  }

  void opdater() {
    tid = tidNu;
  }
}
