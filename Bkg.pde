class Bkg{
  private float gravity = 0.1;
  private float v = -1;
  private float y = (v/gravity)*(v/gravity)-(v/2)*(v/2)+75;
  private float block = random(0,300-y);
  private float top = block+250;
  private float bottom = 450-block-y;
  private float xpos;
  private float xcor;
  private float hitBox = 0.8;
  
  public Bkg(float i){
    xpos =i*300;
  }

  public void make(int t){
    xcor = 800+xpos-5*(t*0.25);
    fill(#72D660);
    rect(xcor,0,100,top);
    rect(xcor,800-bottom,100,bottom);
    
  }
  
  public boolean crash(CharControl bot){
    if((bot.xpos+bot.xdim*hitBox>xcor && bot.xpos+bot.xdim*hitBox<xcor+100)||(bot.xpos+bot.xdim-bot.xdim*hitBox>xcor && bot.xpos+bot.xdim-bot.xdim*hitBox<xcor+100)){
      if((bot.ypos+bot.ydim*hitBox>800-bottom && bot.ypos+bot.ydim*hitBox<800)||(bot.ypos+bot.ydim-bot.ydim*hitBox>800-bottom && bot.ypos+bot.ydim-bot.ydim*hitBox<800)){
        return true;
      }
    }
    
    if((bot.xpos+bot.xdim*hitBox>xcor && bot.xpos+bot.xdim*hitBox<xcor+100)||(bot.xpos+bot.xdim-bot.xdim*hitBox>xcor && bot.xpos+bot.xdim-bot.xdim*hitBox<xcor+100)){
      if((bot.ypos+bot.ydim*hitBox>0 && bot.ypos+bot.ydim*hitBox<top)||(bot.ypos+bot.ydim-bot.ydim*hitBox>0 && bot.ypos+bot.ydim-bot.ydim*hitBox<top)){
        return true;
      }
    }
    if(bot.ypos>800||bot.ypos<0){
      return true; 
    }
    
    return false;
  }
  
  
  
  public boolean score(CharControl bot){
    if(bot.xpos + bot.xdim/2 == xcor+100/2){
      return true;
    }
    return false;
  }
  
  public void displayScore(int score){
    textSize(32);
    fill(255);
    textAlign(CENTER, CENTER);
    text(score, 400, 400);
  }
  
}
