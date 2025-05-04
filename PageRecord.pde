int sum_g;
int progress;

void page_record() {

  String [] s_g = loadStrings("data/goal.txt");
  sum_g = int(s_g[0]);
  if (sum_g != 0) {
    sum_goal = sum_g;
  }//目標時間読み込み

  background(#232946);
  textSize(30);
  fill(#b8c1ec);
  textAlign(CENTER, CENTER);
  text("時間を記録する", width/2, 100);
  text(sum_record + "h", width/2, 170);
  textSize(20);
  text("合計 : " + sum_record_total + "h", width/2, 210);
  text("目標時間 : " + sum_goal + "h", width/2-19, 240);
  textSize(30);
  text("ENTERで決定", width/2, 580);


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

  /*フェードアウト*/
  fadeOut(alpha);
  alpha-= 5;  // 透明度を減らす
  if (alpha < 0) {
    noStroke();
    fill(255, 0);
    rect(0, 0, 480, 640);  // 透明度が0以下になったら描画を停止
  }

  String [] pro = loadStrings("data/progress.txt");
  progress = int(pro[0]);
  sum_record_total = progress + sum_record;


  /*ページ遷移*/
  if (keyPressed && keyCode == ENTER) {
    if ((floor(sum_record_total * 100 / sum_goal) > 0) && (floor(sum_record_total * 100 / sum_goal) < 25)) {
      page = 1;
     // page1();
      alpha = 255;
    }
    if ((floor(sum_record_total * 100 / sum_goal) >= 25) && (floor(sum_record_total * 100 / sum_goal) < 50)) {
      page = 2;
      alpha = 255;
    }
    if ((floor(sum_record_total * 100 / sum_goal) >= 50) && (floor(sum_record_total * 100 / sum_goal) < 75)) {
      page = 3;
      alpha = 255;
    }
    if ((floor(sum_record_total * 100 / sum_goal) >= 75) && (floor(sum_record_total * 100 / sum_goal) < 100)) {
      page = 4;
      alpha = 255;
    }
    if (floor(sum_record_total * 100 / sum_goal) >= 100) {
      page = 5;
      alpha = 255;
    }
    String [] goal_h_r = {str(sum_record_total)};
    saveStrings("data/progress.txt", goal_h_r);//記録時間の合計を保存
    sum_record = 0;
  }
}
