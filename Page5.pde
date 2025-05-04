void page5() {

  background(#6FC4F7);
  translate(width/2, height/2, 0);
  //spotLight(247, 178, 136, 320, -200, 200, -1, 0, 0, PI/2, 2);
  spotLight(210, 233, 247, width/2, -height/2, 200, 0, 0, -1, -1, 0.1);
  directionalLight(210, 233, 247, 0,0, -1);
  //lights();
  if ((60 <= mouseX) || (60 <= mouseY) || (mouseY <= height - 60) || (mouseX <= width - 60)) {
    rotateY(radians(mouseX) * 0.5);
    rotateX(radians(mouseY) * 0.1);
  }
  shape(land5);

  pushMatrix();
  ortho();
  resetMatrix();

  hint(DISABLE_DEPTH_TEST);
  frame();
  fill(255);
  Button_r_show("記録");
  Button_config_show();
  decoration();
  hint(ENABLE_DEPTH_TEST);


  /*フェードアウト*/
  fadeOut(alpha);
  alpha -= 5;  // 透明度を減らす
  if (alpha < 0) {
    noStroke();
    fill(255, 0);
    rect(0, 0, 480, 640);  // 透明度が0以下になったら描画を停止
  }

  popMatrix();
}
