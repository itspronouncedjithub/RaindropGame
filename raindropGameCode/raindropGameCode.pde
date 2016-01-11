PVector mouse;   //declare a P
int score;
Bucket b;                                                               //declare a new Bucket called b
PImage storm;     //declare image
float menu;

ArrayList <Raindrop> r = new ArrayList<Raindrop>();

// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  r.add(new Raindrop(random(width), 0));
  score = 0;                                                            //add score value
  size(1200, 800);                                                       //set canvas size
  mouse = new PVector();                                                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  b = new Bucket(60);                                                   //initialize b. The parameer is the width of te bucket
  imageMode(CENTER);
  storm = loadImage("storm.jpg");
}

void draw() {

  if (menu==0) {
    background(150, 150, 250);
    textAlign(CENTER);
    textSize(100);
    text("RAINDROP GAME", width/2, height/2 - 40);
    textSize(40);
    text("press enter to begin", width/2, height/2 + 40);


    if (keyPressed) {
      if (key == ENTER) {
        menu=menu+1;
      }
    }
  } else if (menu==1) {
    mouse.set(mouseX, mouseY);                                            //set value of mouse as mouseX,mouseY
    background(0, 0, 50);                                                 //set background
    image(storm, width/2, height/2, storm.width, storm.height);
    r.add(new Raindrop(random(width), 0));

    for (int i = r.size()-1; i >= 0; i--) { 
      Raindrop x = r.get(i);  
      x.display();              
      x.fall();
      if (x.isInContactWith(mouse)) {                                     //check to see if the raindrop is in contact with the point represented by the PVector called mouse
        x.reset();                                                        //if it is, reset the raindrop
        score = score+1;                                                  //if it is, add one to score
        r.remove(i);
      }
      if (x.loc.y > height + x.diam/2) {        //check to see if the raindrop goes below the bottom of the screen
        x.reset();                                                        //if it does, reset the raindrop
        r.remove(i);
      }
    }

    fill (200);
    ellipse(-20, -30, 30, 100);
    b.display();
    textSize(50);                                                         //set text size
    text(score, 100, 100);                                                 //place score text
  }
}