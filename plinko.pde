int width = 500;
int height = 500;
int Nb = 100;
float score = 0;
float average;
float a, b, c, d;

ball[] balls = new ball[Nb];
void setup() {
  size(width, height);


  //making balls
  for (int bi = 0; bi < Nb; bi++) {
    balls[bi] = new ball(width/2);
  }
}
//ball positions:  275/2, 425/2, 575/2, 725/2
void draw() {
  average = score/Nb;
  //layout
  background(#000000);
  fill(#FF0000);
  a = drop(225/2, 25);
  b = drop(375/2, 25);
  c = drop(525/2, 25);
  d = drop(675/2, 25);

  for (float i = 125/2; i <= 400; i+=75) {
    fill(#ff0000);
    quad(i, 400, i + 75, 400, i + 75 - 25/2, 500, i + 25/2, 500);
  }
  textAlign(CENTER);
  fill(#ffffff);
  text("1", width/2-150, 468); 
  text("3", width/2-75, 468); 
  text("5", width/2, 468); 
  text("3", width/2+75, 468); 
  text("1", width/2+150, 468); 
  rect(0, 100, 100, 300);
  rect(400, 100, 100, 300);
  
  for (float i = 100; i <= 400; i+=75) {
    for (float j = 175; j <= 400; j+=150) {
      fill(random(255),random(255),random(255));
      ellipse(i, j, 15, 15);
    }
  }
  for (float i = 275/2; i <= 400; i+=75) {
    for (float j = 100; j <= 400; j+=150) {
      fill(random(255),random(255),random(255));
      ellipse(i, j, 15, 15);
    }
  }
  //
  fill(#FFFFFF);
  for (int bi = 0; bi < Nb; bi++) {
    balls[bi].update();
    balls[bi].show();
    balls[bi].change(a);
    balls[bi].change(b);
    balls[bi].change(c);
    balls[bi].change(d);
    score += balls[bi].points();
    println(score);
  }
  fill(#000000);
  textSize(20);
  text("SCORE:", 50, 200 );
  text(score, 50, 230);
  text("Average:", 50, 260);
  text(average, 50, 290);
  textSize(30);
  text("P", 450, 160);
  text("L", 450, 200);
  text("i", 450, 240);
  text("N", 450, 280);
  text("K", 450, 320);
  text("O", 450, 360);
}

float drop(float x, float y) {
  rect(x, y, 50, 50);
  if (mousePressed && mouseX > x && mouseX < x + 50 && mouseY > y && mouseY < y + 50) {
    return x + 25;
  } 
  else {
    return 0;
  }
}

