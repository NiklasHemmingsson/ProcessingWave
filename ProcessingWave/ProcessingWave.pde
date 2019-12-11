
//Värde som används för att räkna ut y-position med hjälp av sin.
float angle = 0.0;
//Hur lång ner i y-ledd ska utritningen starta. 
float offset = 250;
//Variabel som bestämmer tillåtet avstånd innan rektanglerna byter riktning.
float scalar = 40;

//Vinkeln som uträkningen ska starta med. 
float startAngle = 0;

//angleVel ändrar lutningen mellan rektanglarna
float angleVel = 0.3;

//Deklarerar en variabel med ett antal som representerar hur många bilder vi ska använda oss av
int numImages= 3;
//Deklarerar listan som innehåller numImages, alltså antal bilder
PImage[] img = new PImage[numImages];

//Variabel som används som index-värde i listan
int j = 0;

void setup () {
  size(1200, 800); //Ändra storleken på fönstret om ni vill, tex. size(800, 800);
  
  //Laddar in tre olika bilder.
  //Vi har sedan tidigare sagt att det ska finnas 3 bilder, därför kan vi direkt tilldela index-platserna en bild.
  img[0] = loadImage("turkos_lila.jpg");
  img[1] = loadImage("green_blue.jpg");
  img[2] = loadImage("red_yellow.jpg");
  //håller bilden i mitten av skärmen
  imageMode(CENTER);
  
  /*
  //Uppspelande av ljud.
  //bestämde oss för att inte använda detta, motivering under reflektering fråga 4
    path = sketchPath(audioName);
    file = new SoundFile(this,path);
    file.play();
  */
}

void draw() {
  //här ska ni skriva era for-loopar som omsluter metodanropet
  //Vit bakgrund
  background(255);
  //här anropar vi metoden ritaEnGrej. Värdet 10 tilldelas till int xpos.
  ritaEnGrej(10); //här anropas metoden ritaEnGrej med parametrarna 100, 80
  
}

// [förklara vad nedanstående gör]
//int xpos = 10 som tidigare förklarat
void ritaEnGrej(int xpos) {
  //angleVel blir värde av muspekarens x-position delat på 50. Alltså värden mellan ca 1-24.
  //angleVel ändrar lutningen mellan rektanglarna.
  angleVel = mouseX / 50;
  //Angle behöver starta med en vinkel.
  startAngle += 0.1;
  //Angle behöver ett startvärde för uträkningen för yPos längre ner. 
  angle = startAngle;
   
  //Random värde som vi valt för att get() kräver ett x-värde och ett y-värde. 
  //Endast x-värde är relevant, därför kan vi ge y ett slumpmässigt värde inom fönstrets ramar.
  int y = 500;
     
    //Loopen körs 31 gånger. 
    for(int i = 0; i <= 31; i++){
      //Uträkning för rektanglarnas y-position. Som tidigare nämnt är offset hur långt i y-ledd animationen sker & scalar är det tillåtna avståndet för rektanglarna innan de byter riktning. 
      float yPos = offset + sin(angle) * scalar;
      
      //hämtar pixelfärgen från en av de osynliga bakgrundbilderna, på samma position som rektanglarna.
      color c = img[j].get(xpos, y);
      //fyller rektanglarna med färgen som hämtats från den osynliga bakgrundsbilden.
      fill(c);
      
      //inga kanter på rektanglarna
      noStroke();
      //ritar ut rektanglarna. 
      rect(xpos, yPos, 10,300, 12,12,12,12);
      //Adderar 40 till xpos. Skapar på det här sättet ett avstånd mellan rektanglarna.
      xpos += 40;
      
      //Adderar angle med angleVel, som är musens x-position/50.
      angle += angleVel;
  }
  
}

//Metod som aktiveras när man klickar. 
void mouseClicked(){
  //plussar på j för att byta till nästa bild i listan.
  j++;
  
  //Om j är över 2, gå tillbaka till 0 som är den första bilden i listan.
  //Värdet är 2 då vi endast har 3 bilder. 
  if(j > 2) {
   j = 0;
  }
}
