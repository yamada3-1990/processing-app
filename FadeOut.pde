int alpha = 255;
 
void fadeOut(int alpha) {
  if (page == 0 || page == 20 || page == 30 || page == 40) {//top,record,resetページ
    fill(0, alpha);
    noStroke();
    rect(0, 0, 480, 640);
  } else {//その他のページ
    fill(0, alpha);
    noStroke();
    rect(-width/2, -height/2, 480, 640);
  }
}
