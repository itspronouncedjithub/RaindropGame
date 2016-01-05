PVector mouse;   //declare a P
Raindrop r;  //declare a new Raindrop called r
int score;
Bucket b;
PImage storm;

//ArrayList<Raindrop r> = new Arraylist

// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  score = 0;
  size(800, 600);
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  r = new Raindrop(random(width), 0);   //Initialize r. The parameters used are the initial x and y positions
  b = new Bucket(60);
  imageMode(CENTER);
  storm = loadImage("storm.jpg");
}

void draw() {
  mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
  background(0, 0, 50);     //set background
  image(storm, width/2, height/2, storm.width, storm.height);
  fill (200);
  ellipse(-20, -30, 30, 100);
  b.display();
  textSize(50);                          //set text size
  text(score, 10, 100);                   //place score text
  r.fall();                              //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
  r.display();                           //display the raindrop
  if (r.isInContactWith(mouse)) {        //check to see if the raindrop is in contact with the point represented by the PVector called mouse
    r.resetTrue();                       //if it is, reset the raindrop
    score = score+1;                     //if it is, add one to score
  }
  if (r.loc.y > height + r.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
    r.resetFalse();                           //if it does, reset the raindrop
    score = 0;
  }
}