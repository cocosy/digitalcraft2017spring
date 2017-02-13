
import ddf.minim.*;
Minim minim;
AudioPlayer player;
PFont Thonburi;
int a = 204;
int b = 204;
 

void setup(){
  frameRate(10);
  size(412, 200, P3D);
  // we pass this to Minim so that it can load files from the data directory
 
  minim = new Minim(this);

  // loadFile will look in all the same places as loadImage does.
  // this means you can find files that are in the data folder and the 
  // sketch folder. you can also pass an absolute path, or a URL.
  player = minim.loadFile("Comedy Of Errors.mp3");  
  Thonburi = createFont("Thonburi", 20);
}




void draw(){  
 background(a,b);

  // draw a line to show where in the song playback is currently located
  float posx = map(player.position(), 0, player.length(), 0, width);
  stroke(0,200,0);
  strokeWeight(3);
  line(posx, 0, posx, height);
  

  
  textFont(Thonburi);
  text("Click to pause",10,20);
  
  strokeWeight(1);
  fill(255);
  ellipse(mouseX, mouseY, 23, 23);
  
  saveFrame("haha-##.png");
  
}

 
     



void mousePressed()
{
  if ( player.isPlaying() )
{player.pause();
   a = a+20; 

  }
  // if the player is at the end of the file,
  // we have to rewind it before telling it to play again
  else if ( player.position() == player.length() )
  {
    player.rewind();
    player.play();
  }
  else
  {
   player.play();
 a = a+20;
}
  
}


  