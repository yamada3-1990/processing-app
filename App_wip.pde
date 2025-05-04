//フォント
//3Dモデル
//タイトル画面
//リセット画面

Button plus1, plus5, plusHalf, minus1, minusHalf, reset;

float goal_hours = 0.0;

PShape land1;
PShape land2;
PShape land3;
PShape land4;
PShape land5;//3Dモデル

PImage trash;

int page = 0;
float sum_goal = 0;//目標合計時間
float sum_record = 0;//記録時間
float sum_record_total = 0;//記録時間合計





void setup() {
  surface.setLocation(1000, 100);

  String [] g_h = loadStrings("data/goal.txt");
  goal_hours = float(g_h[0]);//目標時間の読み込み

  PFont font = createFont("Meiryo", 30);
  textFont(font);

  trash = loadImage("trash.png");

  land1 = loadShape("island1.obj");
  land2 = loadShape("island2.obj");
  land3 = loadShape("island3.obj");
  land4 = loadShape("island4.obj");
  land5 = loadShape("island5.obj");

  plus1 = new Button(140, 270, 90, 70, 1, "+1");
  minus1 = new Button(250, 270, 90, 70, -1, "-1");
  plusHalf = new Button(140, 360, 90, 70, 0.5, "+0.5");
  minusHalf = new Button(250, 360, 90, 70, -0.5, "-0.5");
  plus5 = new Button(140, 450, 90, 70, 5, "+5");
  reset = new Button(250, 450, 90, 70, 0, "reset");

  size(480, 640, P3D);

  if (goal_hours == 0) {
    page = 40;
  } else {
    page = 20;
    sum_record = 0;
  }//初回のみ目標時間設定のページ
}

void draw() {
  switch(page) {
  case 0:
    page_top();
    break;
  case 1:
    page1();
    break;
  case 2:
    page2();
    break;
  case 3:
    page3();
    break;
  case 4:
    page4();
    break;
  case 5:
    page5();
    break;
  case 20:
    page_record();
    break;
  case 30:
    page_reset();
    break;
  case 40:
    page_title();
    break;
  }
}

void mouseClicked() {
  plus1.click();
  plus5.click();
  plusHalf.click();
  minusHalf.click();
  minus1.click();
  reset.click();
  Button_record();
  Button_reset();
  if (sum_goal != 0) {
    println("sum_goal:" + sum_goal + " sum_record:" + sum_record + " sum_record_total:" + sum_record_total + " 進捗:" + floor(sum_record_total * 100 / sum_goal));
  }
}
