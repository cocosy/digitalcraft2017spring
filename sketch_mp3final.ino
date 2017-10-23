///              MP3 PLAYER PROJECT
/// http://educ8s.tv/arduino-mp3-player/
//////////////////////////////////////////


#include <SoftwareSerial.h>
//#include <Serial.h>
SoftwareSerial mySerial(10, 11);
# define Start_Byte 0x7E
# define Version_Byte 0xFF
# define Command_Length 0x06
# define End_Byte 0xEF
# define Acknowledge 0x00 //Returns info with command 0x41 [0x01: info, 0x00: no info]
# define ACTIVATED LOW

boolean isPlaying = false;
int buttonPin =A0;
int val =0;


void setup () {

mySerial.begin (9600);
delay(1000);
pinMode(9, OUTPUT);


}




void loop () { 
  //print out A0 value of foam but didn't work
 val = analogRead(A0);
  Serial.println(val);

//if the pressure of foam reach 650, isPlaying is true
  if (val > 650){
    isPlaying = true;
  }

//if isPlaying is true, play the sound or pause 
  
 if(isPlaying == true){
  digitalWrite(9, HIGH);
  play();

    }
  else{
      pause();
      digitalWrite(9, LOW);
      }
  isPlaying = false;
  }
    


void play()
{
  execute_CMD(0x0D,0,1); 
  delay(2000);
}

void pause()
{
  execute_CMD(0x0E,0,0);
  delay(500);
}

void setVolume(int volume)
{
  execute_CMD(0x06, 0, volume); // Set the volume (0x00~0x30)
  delay(2000);
}

void execute_CMD(byte CMD, byte Par1, byte Par2)
 //Excecute the command and parameters
{
// Calculate the checksum (2 bytes)
word checksum = -(Version_Byte + Command_Length + CMD + Acknowledge + Par1 + Par2);
// Build the command line
byte Command_line[10] = { Start_Byte, Version_Byte, Command_Length, CMD, Acknowledge,
Par1, Par2, highByte(checksum), lowByte(checksum), End_Byte};
//Send the command line to the module
for (byte k=0; k<10; k++)
{
mySerial.write( Command_line[k]);
}
}
