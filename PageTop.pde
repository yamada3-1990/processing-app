void page_top() {
  background(#232946);
  textSize(30);
  fill(#b8c1ec);
  textAlign(CENTER, CENTER);
  text("目標時間", width/2, 100);
  text(sum_goal + "h", width/2, 200);
  text("ENTERで決定", width/2, 580);
 // line(10, 10, 200, 200);


  plus1.show();
  plus1.cursor_location();//+1

  plus5.show();
  plus5.cursor_location();//+5
  
  plusHalf.show();
  plusHalf.cursor_location();//+0.5
  
  minusHalf.show();
  minusHalf.cursor_location();//-0.5

  minus1.show();
  minus1.cursor_location();//-1

  reset.show();
  reset.cursor_location();//reset





  if (keyPressed && keyCode == ENTER) {
    if (keyCode == ENTER)
      if (sum_goal == 0.0) {
        fill(#eebbc3);
        text("！有効な値を入力してください！", width/2, 150);
        page = 0;
      }
    if ((sum_goal != 0) && (sum_record == 0)) {
      page = 1;
      alpha = 255;

      String [] goal_h = {str(sum_goal)};
      saveStrings("data/goal.txt", goal_h);//目標時間を保存
    }
  }
  
  /*フェードアウト*/
  fadeOut(alpha);
  alpha-= 5;  // 透明度を減らす
  if (alpha < 0) {
    noStroke();
    fill(255, 0);
    rect(0, 0, 480, 640);  // 透明度が0以下になったら描画を停止
  }
}
