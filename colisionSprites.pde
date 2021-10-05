int x;
int y;
int maxImages = 3;
int imageIndex = 0;
PImage [] images = new PImage[maxImages];
int maximoimagenes = 3;
int primera = 0;
PImage [] imagenes = new PImage[maximoimagenes];

int vel=15;

int r=100;
void setup(){
  size(500,500);
for(int i = 0; i < images.length; i++){images[i] = loadImage("policia_" + i + ".png");
for(int a = 0; a < images.length; a++){imagenes[a] = loadImage("personaje_" + a + ".png");
}

}

frameRate(8);
}


void draw(){
 background(0);
 image(images[imageIndex], width/2,height/2 );

 rect(400,0,20,500);
 pelado();
 detect();


}


void pelado(){
    image(imagenes[primera], x,y,r,r);
  if(keyPressed && (key==CODED)){
       if(keyCode==RIGHT){
   primera = (primera+1)%imagenes.length; 
image(imagenes[primera], x,y,r,r);{x+=vel;}
       
}}
  if(keyPressed && (key==CODED)){
       if(keyCode==DOWN){ 
 primera = (primera+1)%imagenes.length; 
image(imagenes[primera], x,y );{y+=vel;}
       
         
}}
if(keyPressed && (key==CODED)){
       if(keyCode==LEFT){
 primera = (primera+1)%imagenes.length; 
image(imagenes[primera], x,y );{x-=vel;}
      
}}

if(keyPressed && (key==CODED)){
       if(keyCode==UP){
 primera = (primera+1)%imagenes.length;
 image(imagenes[primera], x,y );{y-=vel;}
      
      }}
 
  
}

void detect(){
  if(x>width-20){
  primera = (primera+1)%imagenes.length; 
  //image(imagenes[1], x,y ); 
   x=width-20;
  }
   if (y>height-46){
     primera = (primera)%imagenes.length; 
        //image(imagenes[1], x,y,r,r );
        y=height-46;        
   }
   
    if (keyCode==LEFT&&x<0){
      
         //image(imagenes[1], x,y,r,r );
         x=0;
    }
     if(keyCode==UP&&y<0){
       primera = (primera)%imagenes.length; 
        //image(imagenes[1], x,y,r,r); 
        y=0;
     }
}
