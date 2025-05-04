void page_title() {
  background(255);
  fill(0, 100);
  strokeWeight(4);
  rect(width/3, 300, width/3, 60);
  fill(255);
  textAlign(CENTER, CENTER);
  text("ENTER", width/2, height/2);

  /*フェードアウト*/
  fadeOut(alpha);
  alpha-= 5;  // 透明度を減らす
  if (alpha < 0) {
    noStroke();
    fill(255, 0);
    rect(0, 0, 480, 640);  // 透明度が0以下になったら描画を停止
  }

  if (keyPressed && key == ENTER) {
    page = 0;
    alpha = 255;
  }
}
