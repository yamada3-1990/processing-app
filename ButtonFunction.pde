/*時間設定*/
class Button {
  int x;
  int y;
  int b_width;
  int b_height;
  float val;
  String text;

  Button(int x, int y, int b_width, int b_height, float val, String text) {
    this.x = x;
    this.y = y;
    this.b_width = b_width;
    this.b_height = b_height;
    this.val = val;
    this.text = text;
  }

  //ボタンの表示
  void show() {
    fill(#A27F84);
    noStroke();
    //noFill();
    //stroke(255);
    rect(x+5, y+5, b_width, b_height, 10);//ボタン(影)
    fill(#eebbc3, 180);
    noStroke();
    rect(x, y, b_width, b_height, 10);//ボタン
    textAlign(CENTER, CENTER);
    fill(#232946);
    text(text, x + b_width/2, y + b_height/2);//テキスト
  }

  //ボタンの範囲
  void click() {
    /*top page*/
    if ((mouseX >= x) && (mouseX <= x + b_width) && (mouseY >= y) && (mouseY <= y + b_height) && (page == 0)) {
      sum_goal += val;
    }//目標時間

    if ((sum_goal < 0) && (val == -1) && (page == 0)) {
      sum_goal += 1;
    }//目標時間を正の値に限定する

    if ((mouseX >= x) && (mouseX <= x + b_width) && (mouseY >= y) && (mouseY <= y + b_height) && (val == 0) && (page == 0)) {
      sum_goal = 0;
    }//reset

    /*record page*/
    if ((mouseX >= x) && (mouseX <= x + b_width) && (mouseY >= y) && (mouseY <= y + b_height) && (page == 20)) {
      sum_record += val;
    }//記録時間

    if ((sum_record < 0) && (val == -1) && (page == 20)) {
      sum_record += 1;
    }//記録時間を正の値に限定する

    if ((mouseX >= x) && (mouseX <= x + b_width) && (mouseY >= y) && (mouseY <= y + b_height) && (val == 0) && (page == 20)) {
      sum_record = 0;
    }//reset
  }

  //カーソルの位置によるボタンの変化
  void cursor_location() {
    if ((mouseX >= x) && (mouseX <= x + b_width) && (mouseY >= y) && (mouseY <= y + b_height) && ((page == 0) || (page == 20))) {
      fill(#A27F84);
      noStroke();
      rect(x - 5, y - 5, b_width + 20, b_height + 10, 10);//ボタン
      fill(#eebbc3, 180);
      noStroke();
      rect(x - 10, y - 10, b_width + 20, b_height + 10, 10);//ボタン

      fill(#232946);
      textSize(40);
      text(text, x - 10 + (b_width + 20)/2, y - 10 + (b_height + 10)/2);
      textSize(30);//テキスト
    }
  }
}

/*記録用ページに飛ぶ*/
void Button_record() {
  if ((mouseX >= 0) && (mouseX <= 60) && (mouseY >= height-60) && (mouseY <= height) && ((page == 1) || (page == 2) || (page == 3) || (page == 4) || (page == 5))) {
    page = 20;
    alpha = 255;
  }
}

/*記録用ボタン*/
void Button_r_show(String str1) {
  noLights();
  fill(#eebbc3, 180);
  stroke(#eebbc3);
  rect(-239, 259, 60, 60, 10);
  textSize(25);
  fill(#232946);
  text(str1, -210, 285);
}

/*リセット*/
void Button_reset() {
  if ((mouseX >= width-60) && (mouseY >= 0) && (mouseY <= 60 ) && ((page == 1) || (page == 2) || (page == 3) || (page == 4) || (page == 5))) {
    page = 30;
    alpha = 255;
  }
}


/*リセット用ボタン*/
void Button_config_show() {
  noLights();
  fill(#eebbc3, 180);
  stroke(255, 200);
  stroke(#eebbc3);
  rect(179, -height/2, 60, 60, 10);
  image(trash, 190, -310, 40, 40);
  textSize(25);
}
