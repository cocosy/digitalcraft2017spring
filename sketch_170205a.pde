PShape s;
PFont f;


void setup() {
   s = loadShape("//Users/cocosy/Documents/Processing/Hand.svg");
   size(672, 600);
   f = createFont("Ariel",32);
}

void draw() {
  background(255,200,200,70);
  textFont(f,35);                  // STEP 3 Specify font to be used
  fill(255);                         // STEP 4 Specify font color 
  text("mutation",75,200);   // STEP 5 Display Text
  
  shape(s, 207, 374, width/8, height/6);
  shape(s, 224, 300, width/3, height/2);
  shape(s, 257, 269, width/9, height/6);  
  shape(s, 306, 245, width/9, height/6);
  shape(s, 348, 285, width/10, height/7);
  shape(s, 393, 344, width/12, height/8);
}

void mousePressed() {
  s.rotate(0.5);  
}