void page_reset() {
  fill(0, 7);
  rect(0, 0, 480, 640);
  textSize(40);
  fill(255);
  text("初期化 yes:y no:n", width/2, height/2);

  if (keyPressed && key == 'y') {
    sum_goal = 0;
    sum_record = 0;
    sum_record_total = 0;
    page = 0;
    alpha = 255;
    String [] goal_h_r = {str(0)};
    saveStrings("data/progress.txt", goal_h_r);//記録時間の合計を保存
    sum_record = 0;
  }
  if (keyPressed && key == 'n') {
    if ((floor(sum_record_total * 100 / sum_goal) >= 0) && (floor(sum_record_total * 100 / sum_goal) < 25)) {
      page = 1;
      //page1();
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
  }
}
