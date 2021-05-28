PImage img; //<>//
int i = 0;
int t = 0;
int t1 = 0;
int t2 = 0;
int t3 = 0;
int time = 0;
int num = 100;
Bkg[] columns = new Bkg[num];
Boolean crash = false;
Boolean crash1 = false;
Boolean crash2 = false;
Boolean crash3 = false;
int score = 0;
int players = 1;
CharControl[] Animals = new CharControl[players];
Start startScreen = new Start();

void setup() {
  // Images must be in the "data" directory to load correctly
  frameRate(60);
  for(int i =0; i<players;i++){
    if(i==0){
      Animals[0] = new CharControl("CharCat.png", 50, 350,70,70,'a',-1);
    }
    if(i==1){
      Animals[1] = new CharControl("CharDog.png", 50, 350,70,70,'b',-1);
    }
    if(i==2){
      Animals[2] = new CharControl("CharPanda.png", 50, 350,70,70,'c',-1);
    }
  }
  frameRate(200);
  size(800, 800);
  for(int i = 0; i<num; i++){
    columns[i] = new Bkg(i);
  }
}

void draw() {
  if(players == 0){
    startScreen.playBut();
  }
  
  if(players == 1){
    background(#93CDFF);
    for(int i = 0; i<num ; i++){
      if(columns[i].score(Animals[0])&&crash==false){
        score +=1;
      }
      columns[i].make(time);
      columns[i].displayScore(score);
      if(crash == false){
        crash = columns[i].crash(Animals[0]);
      }
    }
    Animals[0].display(crash, score);
    Animals[0].gravity(t);
    t+=1;
    time+=1;
  }

  if(players == 2){
    background(#93CDFF);
    for(int i = 0; i<num ; i++){
      if(columns[i].score(Animals[0])){
        score +=1;
      }
      columns[i].make(time);
      columns[i].displayScore(score);
      if(crash1 == false){
        crash1 = columns[i].crash(Animals[0]);
      }
      if(crash2 == false){
        crash2 = columns[i].crash(Animals[1]);
      }
    }
    if(crash1 == true && Animals[0].finalScore == -1){
      Animals[0].finalScore = score;
      println(score);
    }
    if(crash2 == true && Animals[1].finalScore == -1){
      Animals[1].finalScore = score;
      println(score);
    }
    Animals[0].dis(crash1);
    t1 = Animals[0].gravity(t1);
    Animals[1].dis(crash2);
    t2 = Animals[1].gravity(t2);
    t1+=1;
    t2+=1;
    time+=1;
    Animals[0].checkEnd(crash1, crash2, Animals[0].finalScore,Animals[1].finalScore);
  }
  
  if(players == 3){
    background(#93CDFF);
    for(int i = 0; i<num ; i++){
      if(columns[i].score(Animals[0])){
        score +=1;
      }
      columns[i].make(time);
      columns[i].displayScore(score);
      if(crash1 == false){
        crash1 = columns[i].crash(Animals[0]);
      }
      if(crash2 == false){
        crash2 = columns[i].crash(Animals[1]);
      }
      if(crash3 == false){
        crash3 = columns[i].crash(Animals[2]);
      }
    }
    if(crash1 == true && Animals[0].finalScore == -1){
      Animals[0].finalScore = score;
      println(score);
    }
    if(crash2 == true && Animals[1].finalScore == -1){
      Animals[1].finalScore = score;
      println(score);
    }
    if(crash3 == true && Animals[2].finalScore == -1){
      Animals[2].finalScore = score;
      println(score);
    }
    Animals[0].dis(crash1);
    t1 = Animals[0].gravity(t1);
    Animals[1].dis(crash2);
    t2 = Animals[1].gravity(t2);
    Animals[2].dis(crash3);
    t3 = Animals[2].gravity(t3);
    t1+=1;
    t2+=1;
    t3+=1;
    time+=1;
    Animals[0].checkEnd3(crash1, crash2, crash3, Animals[0].finalScore, Animals[1].finalScore, Animals[2].finalScore);
  }
}
