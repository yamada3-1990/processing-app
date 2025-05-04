void decoration() {
  noStroke();
  fill(#eebbc3, 150);
  arc(205, 285, 60, 60, -90, 360);
  fill(#eebbc3);
  noStroke();
  arc(205, 285, 40, 40, radians(-90), radians(-90 +floor(sum_record_total * 360 / sum_goal)));//円グラフ

  fill(#232946);
  textSize(25);
  text(floor(sum_record_total * 100 / sum_goal), 200, 280);
  textSize(15);
  text("%", 223, 290);

  textSize(20);
  fill(255);
  text("睡眠時間 : " + sum_record_total + "h", 0, 270);
  text("目標時間 : " + sum_goal + "h", 0, 300);
}

void frame() {
  noFill();
  strokeWeight(120);
  stroke(#0E181F, 150);
  rect(-width/2, -height/2, width, height, 80);//外枠

  strokeWeight(1);
}//外枠
