ArrayList<Dinero> bolsas = new ArrayList<Dinero>();
float playerX;//Posición jugador
float playerY;


float cantidad = 5;
float VP= cantidad;//Velocidad

float radio1= 15;//Radio elipse jugador
float radiob=5;//Radio "bolsa"



//boolean colisionar = false;
boolean gameover = false;

int c_paredes=4;//numero de paredes
Pared [] p = new Pared[c_paredes];


//Con Sprite--------------------------------------------------------------------------------------

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
//posicion incial policia.
int tr = 37; 
//radio posicion inicial capucho, anchoxalto
int c_a=37;
int c_h = 23;

//--------------------------------------------------------------------------------------

//-------------------------------------------
void setup(){
  size(680,600);
  ellipseMode(RADIUS);
  
   playerX= width/2;
   playerY= height/2;
  for(int i=20; i < width; i+=40){//añadir lista de bolsas de dinero ancho x alto
    for(int j=20; j < height; j+=40){
       Dinero D = new Dinero(i,j);
       bolsas.add(D);
    }
  }
  
  p[0] = new Pared(80,80,40,320);
  p[1]= new Pared(200,200,120,80);
  p[2] = new Pared(600,440,40,120);
  p[3] = new Pared(400,400,200,40);

//Con Sprite--------------------------------------------------------------------------------------
for(int i = 0; i < images.length; i++){images[i] = loadImage("policia_" + i + ".png");
for(int a = 0; a < images.length; a++){imagenes[a] = loadImage("personaje_" + a + ".png");
}
}
x= width/2 + c_a;
y= height/2 + c_h;
frameRate(5);


//--------------------------------------------------------------------------------------

}

//-----------------------------------------
void draw(){
  background(0); 
  imageMode(CENTER);
  
  
  cuadricula();  
   
  dinero();
  
  texto();
    
  detect();
   
  pelado();
  player();
  p[0].dibujar();
  p[1].dibujar();
  p[2].dibujar();
  p[3].dibujar();

  colisionar();
  
  println(playerX, playerY);
  
  
  
  
}





//-------------------------------------------

void dinero(){
  noStroke();
  
  for (int i=0; i < bolsas.size(); i++){//Aparición de bolsas 
  Dinero Di = (Dinero) bolsas.get(i);
  Di.dibujar();
  if(dist(playerX, playerY, Di.bx, Di.by)<radio1/2+radiob){//distancia entre dos puntos
    bolsas.remove(i);
  }
 }
  
}
//--------------------------------------------------
void keyPressed(){//Movimiento player
 if(key==CODED){
  if (keyCode == LEFT) playerX-=VP;
 if (keyCode==RIGHT)playerX+=VP;
 if (keyCode==UP) playerY-=VP;
 if(keyCode==DOWN)playerY+=VP;
 }
 }
 
void pelado(){
    image(imagenes[primera], x,y);
  if(keyPressed && (key==CODED)){
       if(keyCode==RIGHT){
   primera = (primera+1)%imagenes.length; 
image(imagenes[primera], x,y);{x+=vel;}
       
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
//-------------------------------------------
void cuadricula(){
  stroke(255);
   for(int j = 0; j <= height; j += 40){
      for(int i = 0; i < width; i += 40){
        fill(0); 
        rect(i, j, 40, 40);
      }
    } 
}


//Texto jugador gana -------------------------------------
void texto(){
  fill(255,0,0);
 if (bolsas.size()==0){
   text("YOU WIN", width/2, width/2);
 } 
}

//Detección de bordes-----------------------------------------

void detect(){
  if (playerX > width-radio1/2)playerX=width-radio1/2; 
  /*if(playerX<0)playerX=0; //Para elipse: */if(playerX<radio1/2)playerX=radio1/2;
  if(playerY>height-radio1/2)playerY=height-radio1/2; 
  /*if(playerY<0)playerY=0; //Para elipse: */ if(playerY<radio1/2)playerY=radio1/2;
}

//-------------------------------------------
void player(){
  noStroke();
  fill(0,255,0);
  rectMode(CENTER);
  rect(playerX, playerY, radio1,radio1);//Jugador
  rectMode(CORNER);
  
}


//}
void colisionar(){
  for(int i=0; i < c_paredes;i++){
    if((playerX+radio1/2>=p[i].px) && (playerX-radio1/2<p[i].px+p[i].bp) && (playerY +radio1/2>= p[i].py)&&(playerY -radio1/2< p[i].py + p[i].ap)){

  VP=0;
  fill(255,0,0);
  textMode(CENTER);
  text("YOU LOSE", width/2,width/2);
  gameover= true;
 }
 }
 
  
  
}
