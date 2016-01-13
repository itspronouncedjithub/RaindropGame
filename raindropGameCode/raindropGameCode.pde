PVector mouse;                                                          //declare a P //<>//
int score;                                                              //declare variable for score
Bucket b;                                                               //declare a new Bucket called b                                                                 //declare a new Bucket called b
PImage storm;                                                           //declare image
float menu;                                                             //declare variable for menu

ArrayList <Raindrop> r = new ArrayList<Raindrop>();                     //create arraylist


// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test



void setup() {                                                          //this runs once
  r.add(new Raindrop(random(width), 0));                                //initialize r. The parameters are the coordinates of the initial locations of the raindrops
  score = 0;                                                            //add score value
  size(1200, 800);                                                      //set canvas size
  mouse = new PVector();                                                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  b = new Bucket(60);                                                   //initialize b. The parameter is the width of the bucket
  imageMode(CENTER);                                                    //center image placement
  storm = loadImage("storm.jpg");                                       //load image of storm
}

void draw() {                                                           //this runs repeatedly

  if (menu==0) {                                                        //sets start screen
    background(150, 150, 255);                                          //set background
    textAlign(CENTER);                                                  //aligns image to center
    textSize(100);                                                      //set text size
    text("RAINDROP GAME", width/2, height/2 - 40);                      //add start text
    textSize(40);                                                       //set text size
    text("press enter to begin", width/2, height/2 + 40);               //add text with instructions


    if (keyPressed) {                                                   
      if (key == ENTER) {
        menu=1;
      }
    }                                                                   //if enter is pressed, start game
  } else if (menu==1) {                                                 //runs game code
    mouse.set(mouseX, mouseY);                                          //set value of mouse as mouseX,mouseY
    background(0, 0, 50);                                               //set background
    image(storm, width/2, height/2, storm.width, storm.height);         //loads background image
    r.add(new Raindrop(random(width), 0));                              //add a new raindrop on the top of the screen at a random x coordinate                              

    for (int i = r.size()-1; i >= 0; i--) { 
      Raindrop x = r.get(i);  
      x.display();                                                      //display the raindrop                
      x.fall();                                                         //have the raindrop fall
      if (x.isInContactWith(mouse)) {                                   //check to see if the raindrop is in contact with the point represented by the PVector called mouse
        x.reset();                                                      //if it is, reset the raindrop
        score = score+1;                                                //if it is, add one to score
        r.remove(i);                                                    //remove the raindrop at your mouse coords
      }
      if (x.loc.y > height + x.diam/2) {                                //check to see if the raindrop goes below the bottom of the screen
        x.reset();                                                      //if it does, reset the raindrop
        r.remove(i);                                                    //remove raindrop at bottom of screen
      }
    }

    fill (200);                                                         //set color of score text
    ellipse(-20, -30, 30, 100);
    b.display();                                                        //displays bucket
    textSize(50);                                                       //set text size
    text(score, 100, 100);                                              //place score text
    if (score>=200) {
      menu=2;
    }                                                                   //if score is 200, run win screen
  } else if (menu==2) {                                                 //set win screen
    background(150, 150, 255);                                          //set background
    textAlign(CENTER);                                                  //align text to center
    textSize(100);                                                      //set text size
    fill(random(255), random(255), random(255));                        //set random fill
    text("YOU WIN GG", width/2, height/2 - 40);                         //set "you win" text
    textSize(40);                                                       //set text size
    fill(255);                                                          //set color
    text("press ENTER to play again", width/2, height/2 + 40);          //give instructions text
    text("press TAB to enter freeplay", width/2, height/2 + 90);        //give instructions text


    if (keyPressed) {
      if (key == ENTER) {
        menu=1;
        score=0;                                                        //if enter is pressed, reset score and game
      } else if (key == TAB) {
        menu=3;
      }                                                                 //if tab is pressed, rest game but not score
    }                                                                        
  } else if (menu==3) {
    mouse.set(mouseX, mouseY);                                          //set value of mouse as mouseX,mouseY
    background(0, 0, 50);                                               //set background
    image(storm, width/2, height/2, storm.width, storm.height);         //place background image
    r.add(new Raindrop(random(width), 0));                              //place raindrop

    for (int i = r.size()-1; i >= 0; i--) {                             
      Raindrop x = r.get(i);                                            //get raindrop info
      x.display();                                                      //display raindrop
      x.fall();                                                         //set raindrop to fall
      if (x.isInContactWith(mouse)) {                                   //check to see if the raindrop is in contact with the point represented by the PVector called mouse
        x.reset();                                                      //if it is, reset the raindrop
        score = score+1;                                                //if it is, add one to score
        r.remove(i);                                                    //remove the raindrop at your mouse coords
      }
      if (x.loc.y > height + x.diam/2) {                                //check to see if the raindrop goes below the bottom of the screen
        x.reset();                                                      //if it does, reset the raindrop
        r.remove(i);                                                    //remove raindrop at bottom of screen
      }
    }

    fill (200);                                                         //set color
    ellipse(-20, -30, 30, 100);                                         //place ellipse
    b.display();                                                        //display bucket
    textSize(50);                                                       //set text size
    text(score, 100, 100);                                              //place score text

  }
}