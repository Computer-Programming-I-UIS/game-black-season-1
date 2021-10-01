int x;
int y;
int maxImages = 3;
int imageIndex = 0;
PImage [] images = new PImage[maxImages];
int maximoimagenes = 3;
int primera = 0;
PImage [] imagenes = new PImage[maximoimagenes];


void setup(){
  size(500,500);
for(int i = 0; i < images.length; i++){images[i] = loadImage("policia_" + i + ".png");
for(int a = 0; a < images.length; a++){imagenes[a] = loadImage("personaje_" + a + ".png");
}

}

frameRate(10);
}


void draw(){
 background(0);
 image(images[imageIndex], width/2,height/2 );
  image(imagenes[primera], x,y );
 
 
 if(keyPressed && (key==CODED)){
       if(keyCode==RIGHT){
   primera = (primera+1)%imagenes.length; 
image(imagenes[primera], x,y );{x=x+3;}

}}
  if(keyPressed && (key==CODED)){
       if(keyCode==DOWN){ 
 primera = (primera+1)%imagenes.length; 
image(imagenes[primera], x,y );{y=y+3;}

}}
if(keyPressed && (key==CODED)){
       if(keyCode==LEFT){
 primera = (primera+1)%imagenes.length; 
image(imagenes[primera], x,y );{x=x-3;}

}}

if(keyPressed && (key==CODED)){
       if(keyCode==UP){
 primera = (primera+1)%imagenes.length; 
image(imagenes[primera], x,y );{y=y-3;}

}}


}
