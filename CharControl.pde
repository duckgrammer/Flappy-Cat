import java.lang.Math;

class CharControl{
  //private String name;
  private float xpos;
  private float ypos;
  private float xdim;
  private float ydim;
  private float gravity = 0.00015;
  private float v = -0.013;
  private boolean gameover = false;
  private char fly;
  //public int scoreFinal;
  private int finalScore;
  PImage img;
  
  public CharControl(String name, float xpos, float ypos, float xdim,float ydim, char fly, int finalScore){
    //this.name = name;
    this.xpos = xpos;
    this.ypos = ypos;
    this.xdim = xdim;
    this.ydim = ydim;
    this.fly = fly;
    this.finalScore = finalScore;
    img = loadImage(name);
  }
  
 public void display(boolean crash, int score)
 {
   if(gameover==false && crash ==false){
     image(img, xpos, ypos, xdim, ydim);
   }
   else{
     background(#000000);
     textSize(32);
     fill(255);
     textAlign(CENTER, CENTER);
     text("GAME OVER", 400, 400);
     if(score ==-1){
       score = 0;
     }
     text("CAT: "+score, 400, 450);
   }
 }

 public void dis(Boolean crash){
   if(crash ==false){
     image(img, xpos, ypos, xdim, ydim);
   }
 }
 
 public boolean checkEnd(boolean crash1, boolean crash2, int score1, int score2){
   if(crash1 ==true && crash2 == true){
     background(#000000);
     textSize(32);
     fill(255);
     textAlign(CENTER, CENTER);
     if(score1 ==-1){
       score1 = 0;
     }
     if(score2 ==-1){
       score2 = 0;
     }
     text("GAME OVER", 400, 400);
     text("CAT: "+score1, 400, 450);
     text("DOG: "+score2, 400, 500);
     return false;
   }
   return true;
 }
 
 public boolean checkEnd3(boolean crash1, boolean crash2, boolean crash3, int score1, int score2, int score3){
   if(crash1 == true){
     if(crash2 ==true && crash3 == true){
       background(#000000);
       textSize(32);
       fill(255);
       textAlign(CENTER, CENTER);
       text("GAME OVER", 400, 400);
       if(score1 ==-1){
       score1 = 0;
       }
       if(score2 ==-1){
         score2 = 0;
       }
       if(score3 ==-1){
       score3 = 0;
       }
       text("CAT: "+score1, 400, 450);
       text("DOG: "+score2, 400, 500);
       text("PANDA: "+score3, 400, 550);
       return false;
     }
   }
   return true;
 }
 
 public int  gravity(int time){
   time ++;
   if(ypos>0){
     if(keyPressed){
       if(key == fly){
         time=0;
         t=0;
       }
     }
   }
   if(ypos<850)
   {
      ypos = ypos+(v*time)+(gravity*(time*time))/2;
   }
   else{
    gameover = true;
   }
  return time;
  }
  
}
