class ball { 
  float locX, locY, cdV, cdH, rando;
  int dH;
  boolean blahV, blahH, blahQ, blahR;
  ball(float X) {
    locX = X;
    locY = 75;
    cdV = 0;
    cdH = 0;
    dH = 0; 
    rando = 0;
    blahV = false;
    blahH = true;
    blahQ = true;
    blahR = true;
  }

  void show() {
    ellipse(locX, locY, 15, 15);
  }

  void update() {

    if (locY > 425) {
      cdV = 0;
      cdH = 0;
      blahV = false;
      blahH = false;
    }

    if (cdV > 0) {
      cdV -= 1;
      locY += 1;
      if (cdV <= 1) {
        blahH = true;
      }
    } 

    if (cdH > 0) {
      cdH -= 1;
      if (dH > 0) {
        locX += 1;
      } 
      else if (dH < 0) {
        locX -= 1;
      }
      if (cdH <= 1) {
        blahV = true;
      }
    } 

    if (blahV) {
      cdV = 75;
      blahV = false;
      blahR = false;
    }

    if (blahH) {
      blahH = false;
      if (!blahR) {
        cdH = 75/2;
      }

      if (locX <= 110) {
        dH = 1;
      } 
      else if (locX >= 390) {
        dH = -1;
      } 
      else {
        rando = random(1, 101);
        if (rando > 50) {
          dH = 1;
        } 
        else {
          dH = -1;
        }
      }
    }
  }

  void change(float x) {
    if (x > 0) {
      locX = x;
      cdH = 75/2;
    }
  }

  float points() {
    if (locY > 425 && blahQ) {
      blahQ = false;
      if (locX < 275/2) {
        return 1;
      } 
      else if (locX < 425/2) {
        return 3;
      } 
      else if (locX < 575/2) {
        return 5;
      } 
      else if (locX < 725/2) {
        return 3;
      } 
      else {
        return 1;
      }
    } 
    else {
      return 0;
    }
  }
}

