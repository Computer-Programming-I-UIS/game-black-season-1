int z ;
int w;
int y;
int  x;
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
 //MOVIMIENTO DE ENEMIGOS
 
  //ENEMIGOS HORIZONTALES
 image(images[imageIndex], z+100,100 ); 
 z = z+3;
 if(z>500){z = 0;}
 imageIndex = (imageIndex+1)%imagenes.length;
 
 
 image(images[imageIndex], z,400 ); 
 z = z+3;
 if(z>500){z = 0;}
 imageIndex = (imageIndex+1)%imagenes.length;
 
 
 image(images[imageIndex], z+250,250 ); 
 z = z+3;
 if(z>500){z = 0;}
 imageIndex = (imageIndex+1)%imagenes.length;
 
 
 image(images[imageIndex], z+50,0 ); 
 z = z+3;
 if(z>500){z = 0;}
 imageIndex = (imageIndex+1)%imagenes.length;
 
 
 image(images[imageIndex], z+100,300 ); 
 z = z+3;
 if(z>500){z = 0;}
 imageIndex = (imageIndex+1)%imagenes.length;
 
 
 //ENEMIGOS VERTICALES
 image(images[imageIndex], 0,w );
 w = w+3 ;
 if(w>500){w = 0;} 
 imageIndex = (imageIndex+1)%imagenes.length;
 
 
 image(images[imageIndex], 100,w+20 );
 w = w+3 ;
 if(w>500){w = 0;} 
 imageIndex = (imageIndex+1)%imagenes.length;
 
 image(images[imageIndex], 100,w+300 );
 w = w+3 ;
 if(w>500){w = 0;} 
 imageIndex = (imageIndex+1)%imagenes.length;
 
 image(images[imageIndex], 400,w+20 );
 w = w+3 ;
 if(w>500){w = 0;} 
 imageIndex = (imageIndex+1)%imagenes.length;
 
 image(images[imageIndex], 300,w+20 );
 w = w+3 ;
 if(w>500){w = 0;} 
 imageIndex = (imageIndex+1)%imagenes.length;


image(images[imageIndex], 300,w+100 );
 w = w+3 ;
 if(w>500){w = 0;} 
 imageIndex = (imageIndex+1)%imagenes.length;
 
 //MOVIMIENTO PERSONAJE PRINCIPAL
 image(imagenes[primera], (x+500)/2,(y+500)/2);
 if(keyPressed && (key==CODED)){
       if(keyCode==RIGHT){
   primera = (primera+1)%imagenes.length; 
image(imagenes[primera], (x+500)/2,(y+500)/2 );{x=x+12;}

}}
  if(keyPressed && (key==CODED)){
       if(keyCode==DOWN){ 
 primera = (primera+1)%imagenes.length; 
image(imagenes[primera],(x+500)/2,(y+500)/2 );{y=y+12;}

}}
if(keyPressed && (key==CODED)){
       if(keyCode==LEFT){
 primera = (primera+1)%imagenes.length; 
image(imagenes[primera],(x+500)/2,(y+500)/2 );{x=x-12;}

}}

if(keyPressed && (key==CODED)){
       if(keyCode==UP){
 primera = (primera+1)%imagenes.length; 
image(imagenes[primera], (x+500)/2,(y+500)/2 );{y=y-12;}

}}





}
