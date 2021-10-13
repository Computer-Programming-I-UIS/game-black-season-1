int x;
int y;

int maximagenex = 3;
int imagen = 0;
PImage [] imagenex = new PImage[maximagenex];


int maxymo = 3;
int ymagen = 0;
PImage [] maximo = new PImage[maxymo];


void setup(){
for(int b = 0; b <imagenex.length; b++){imagenex[b]= loadImage("arpersonaje_" + b + ".png");
}

for(int l = 0; l <maximo.length; l++){maximo[l]= loadImage("abpersonaje_" + l + ".png");
}

frameRate(10);

}

void draw(){
background(0);

image(imagenex[imagen],x,y);
image(maximo[ymagen],x,y);

if(keyPressed && (key==CODED)){
       if(keyCode==UP){imagen = (imagen+1) % imagenex.length;
       image(imagenex[imagen],x,y);{y = y - 3;}}}

if(keyPressed && (key==CODED)){
       if(keyCode==DOWN){ 
 ymagen = (ymagen+1) % maximo.length; 
image(maximo[ymagen], x,y );{y=y+3;}

}}



}
