class Start{

  public void playBut(){
    for(int j = 0;j<3;j++){
      fill(255);
      rect(250, 200+j*75, 500, 50, 7);
      textSize(32);
      fill(0);
      textAlign(CENTER, CENTER);
      int peep = j+1;
      text(peep+" Player", 500, 225+j*75);
    }
  }
}
