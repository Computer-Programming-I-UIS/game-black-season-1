// importar biblioteca minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//audio
Minim minim;
AudioSample bombo;
AudioSample moneda;
AudioPlayer ganar;




ArrayList<Dinero> bolsas = new ArrayList<Dinero>();
float playerX;//Posición jugador
float playerY;


float cantidad = 5;
float VP= cantidad;//Velocidad

float radio1= 15;//Radio elipse jugador
float radiob=5;//Radio "bolsa"



//boolean colisionar = false;
boolean gameover = false;

int c_paredes=26;//numero de paredes
Pared [] p = new Pared[c_paredes];


//Con Sprite--------------------------------------------------------------------------------------

int x;
int y;
int ex;
int ey;
int maxImages = 3;
int imageIndex = 0;
PImage [] images = new PImage[maxImages];
int maximoimagenes = 3;
int primera = 0;
PImage [] imagenes = new PImage[maximoimagenes];

int vel=8;
int vel_e=10;
int r=100;
//radio enemigo
int re = 30; 
//radio posicion inicial capucho, ancho x alto
int c_a=20;
int c_h = 20;

//--------------------------------------------------------------------------------------
String modo;

int opciones=2;

menu[] opc = new menu[opciones];


int bb;
int hh;
int opx;
int opy;
int cc;

color Color1;
color Color2;
color Color3;
//-------------------------------------------
void setup(){
  size(680,600);
  ellipseMode(RADIUS);
  
  //******** sonido electrocutar  
minim = new Minim(this);
bombo = minim.loadSample("electro.mp3");
moneda = minim.loadSample("sonmoneda.mp3");
ganar = minim.loadFile("win.mp3");
//********* sonido electrocutar
  
   playerX= width/2;
   playerY= height/2;

  p[0] = new Pared(0,0,40,200);
  p[1]= new Pared(0,240,40,360);
  p[2] = new Pared(0,height-40,width,40);
  p[3] = new Pared(0,0,width,40);
  p[4] = new Pared(width-40,0,40,height-120);
  p[5]= new Pared(0,160,160,40);
  p[6] = new Pared(120,200,40,240);
  p[7] = new Pared(40,360,40,40);
  p[8] = new Pared(80,480,40,80);
  p[9]= new Pared(160,360,200,40);
  p[10] = new Pared(280,400,40,80);
  p[11] = new Pared(200,440,120,40);
  p[12] = new Pared(240,520,40,40);
  p[13] = new Pared(80,80,320,40);
  p[14] = new Pared(360,440,160,40);
  p[15] = new Pared(480,480,40,80);
  p[16] = new Pared(360,480,40,40);
  p[17] = new Pared(200,120,40,200);
  p[18] = new Pared(240,240,320,40);
  p[19] = new Pared(400,320,40,120);
  p[20] = new Pared(480,40,40,160);
  p[21] = new Pared(280,160,200,40);
  p[22] = new Pared(320,280,40,40);
  p[23] = new Pared(560,160,40,400);
  p[24] = new Pared(560,80,40,40);
  p[25] = new Pared(480,280,40,120);
  /*p[26] = new Pared(0,0,0,0);
  p[27] = new Pared(0,0,0,0);
  p[28] = new Pared(0,0,0,0);*/


//Con Sprite--------------------------------------------------------------------------------------
for(int i = 0; i < images.length; i++)images[i] = loadImage("policia_" + i + ".png");
for(int a = 0; a < imagenes.length; a++)imagenes[a] = loadImage("personaje_" + a + ".png");

x= 20 ;//Posicion para personaje
y= 220 ;

ex= width /2;//Posición para enemigo
ey = height/2; 
frameRate(20);


//--------------------------------------------------------------------------------------
opc[0] = new menu(50,50,200,40,200);
 opc[1] = new menu(50,100,200,40,200);
 modo = "MENU";
}

//-----------------------------------------
void draw(){
  background(0); 
  imageMode(CENTER);
  textSize(15);
 switch(modo){
  case "MENU":

  fill(Color1);
  rect(50,50,200,40);
  
  fill(0);text("JUGAR", 80,70);
  fill(Color2);
  rect(50,100,200,40);
  fill(0);
  text("INSTRUCCIONES", 80,120);
  fill(Color3);
  rect(50,150,200,40);
  fill(0);
  text("SALIR", 80,170);
  seleccionar();

    break;
  case "JUGAR":  
  play();
  break;
  case "INSTRUCCIONES":
  instruction();  
  break;
  case "PERDER":
  lose();
  break;
  case "GANAR":
  win();
  break;
 }
  
  
  
  println(mouseX, mouseY, bolsas.size());
  
  
  
  
 }
//-----------------------------------------
void seleccionar(){
  for (int i=0; i < bolsas.size(); i++){
    bolsas.remove(i);
  }
    x= 20;
  y= 220 ;
      if (mouseX >opx && mouseX<opx+bb && mouseY >50 &&mouseY<50+hh){//variar el color ligeramente
     Color1= color(255,0,0,200);
      }else Color1 = color(255,0,0);
    if (mouseX >opx && mouseX<opx+bb && mouseY >100 &&mouseY<100+hh){
      Color2= color(255,0,0,200);
    }else Color2 = color(255,0,0);
    if (mouseX >opx && mouseX<opx+bb && mouseY >150 &&mouseY<150+hh){
      Color3= color(255,0,0,200);
    }else Color3 = color(255,0,0);
     if (mouseX >opx && mouseX<opx+bb && mouseY >50 &&mouseY<50+hh && mousePressed){
     modo = "JUGAR";
     for(int i=20; i < width; i+=40){//añadir lista de bolsas de dinero ancho x alto cuando se seleccione modo jugar
    for(int j=20; j < height; j+=40){
       Dinero D = new Dinero(i,j);
       bolsas.add(D);
    }
  }
    }else if (mouseX >opx && mouseX<opx+bb && mouseY >100 &&mouseY<100+hh && mousePressed){
      modo = "INSTRUCCIONES";
    }else if (mouseX >opx && mouseX<opx+bb && mouseY >150 &&mouseY<150+hh&& mousePressed){
      exit();
    }
  }
//-----------------------------------------  
 void play(){
   background(255,0,0);
   cuadricula();    
  dinero();  
  texto();    
  detect();   
  pelado();
  enemigo();
  //player();
  for(int i=0; i< c_paredes; i++){
    p[i].dibujar();    
  }
  colisionar();
 if (keyPressed){//Volver al menu
    if(key == 'M' || key == 'm'){      
     modo = "MENU";
   
    }
    }
 }
 
//----------------------------------------- 
void instruction(){
   background(0,255,0);
   textSize(25);
   fill(0);
   text(("Instrucciones:"),10,25);
   textSize(15);
   text(("*Usa las flechas para moverte (una a la vez)\n*Escapa del laberinto y recolecta la mayor cantidad de monedas\n*No toques las paredes o moriras\n*Evita el policia."),10,50);
   
    if (keyPressed){
    if(key == 'M' || key == 'm'){      
     modo = "MENU";
     for (int i=0; i < bolsas.size(); i++){//Aparición de bolsas 
    bolsas.remove(i);
  }
    }
    }
    
 }
//-----------------------------------------
void lose(){
  background(255,0,0);
  textSize(50);
  fill(0);
  text("YOU LOSE",width/2,height/2);//Incluya animación
  textSize(15);
  text("Pulsa m para regresar al menú", width/2,height/2+100);
  text("Bolsas Recolectadas...."+(255-bolsas.size()), width/2,height/2+200);
  if (keyPressed){
    if(key == 'M' || key == 'm'){      
     modo = "MENU";     
    }
   }
    
 //}
     /*for(int i=20; i < width; i+=40){//añadir lista de bolsas de dinero ancho x alto
    for(int j=20; j < height; j+=40){
       Dinero D = new Dinero(i,j);
       bolsas.add(D);
    }
  }*/
   x= 20;
  y= 220 ;
  vel=8;
  
}
//MODO GANAR----------------------------------------- 
 void win(){//Inserte celebración
   background(0,70,255);
   fill(0);
   textSize(50);
   text("YOU WIN", width/2,height/2);
   textSize(18);ganar.play();// auido de victoria
   text("Pulsa m para regresar al menú", width/2, height/2);
    if (keyPressed){
    if(key == 'M' || key == 'm'){      
     modo = "MENU";
     if( modo == "MENU"){
     for (int i=0; i < bolsas.size(); i++){//Aparición de bolsas 
    bolsas.remove(i);
  }
 }
    }
   }
 }
//DINERO-------------------------------------------

void dinero(){
  noStroke();
  
  for (int i=0; i < bolsas.size(); i++){//Aparición de bolsas 
  Dinero Di = (Dinero) bolsas.get(i);
  Di.dibujar();
  if(dist(x,y, Di.bx, Di.by)<c_a/2+radiob){//distancia entre dos puntos
    bolsas.remove(i);moneda.trigger();// auido de recoleccion
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
 //--------------------------------------------------
 void enemigo(){
   image(images[imageIndex], ex, ey);//policia
   ex+=vel_e;//mover
   if(ex< width/2){
   imageIndex = (imageIndex+1)%images.length; 
image(images[imageIndex], ex,ey);vel_e*=-1;
   }else if (ex >width/2+200){
     imageIndex = (imageIndex+1)%images.length; 
image(images[imageIndex], ex,ey);vel_e*=-1;
   }
 }
 
//Jugador------------------------------------
void pelado(){
    
    image(imagenes[primera], x,y);//
  if(keyPressed && (key==CODED)){
       if(keyCode==RIGHT){
   primera = (primera+1)%imagenes.length; 
image(imagenes[primera], x,y);x+=vel;
       
}}
  if(keyPressed && (key==CODED)){
       if(keyCode==DOWN){ 
 primera = (primera+1)%imagenes.length; 
image(imagenes[primera], x,y );y+=vel;
       
         
}}
if(keyPressed && (key==CODED)){
       if(keyCode==LEFT){
 primera = (primera+1)%imagenes.length; 
image(imagenes[primera], x,y );x-=vel;
      
}}

if(keyPressed && (key==CODED)){
       if(keyCode==UP){
 primera = (primera+1)%imagenes.length;
 image(imagenes[primera], x,y );y-=vel;
      
      }}
 
  
}
//Cuadrícula-------------------------------------------
void cuadricula(){
  stroke(255);
   for(int j = 0; j <= height; j += 40){
      for(int i = 0; i < width; i += 40){
        fill(0); 
        rect(i, j, 40, 40);
      }
    } 
}


//Texto bolsas = 0 -------------------------------------
void texto(){
  fill(255,0,0);
 if (bolsas.size()==121){
   text("YOU WIN", width/2, width/2);
 } 
}

//Detección de bordes-----------------------------------------

void detect(){
  if (x > width-c_a/2){
    x=width-c_a/2;
    modo= "GANAR";
  }
  /*if(playerX<0)playerX=0; //Para elipse: */if(x<c_a/2)x=c_a/2;
  if(y>height-c_a/2)y=height-c_a/2; 
  /*if(playerY<0)playerY=0; //Para elipse: */ if(y<c_a/2)y=c_a/2;
  
}

//JUGADOR-------------------------------------------
void player(){
  noStroke();
  fill(0,255,0);
  rectMode(CENTER);
  rect(playerX, playerY, radio1,radio1);//Jugador
  rectMode(CORNER);
  
}


//COLISIONES CON PAREDES-----------------------------------------------
void colisionar(){
  for(int i=0; i < c_paredes;i++){//Colision con paredes
    if(((x+c_a/2>=p[i].px) && (x-c_a/2<p[i].px+p[i].bp) && (y +c_a/2>= p[i].py)&&(y-c_a/2< p[i].py + p[i].ap))
    ||((x+c_a/2>ex-re/2) && (x-c_a/2<ex+re/2) && (y +c_a/2>ey-re/2)&&(y-c_a/2<ey+re/2))){

  vel=0;
  fill(255,0,0);
  textMode(CENTER);bombo.trigger();// auido de electrocucion
  text("YOU LOSE", width/2,width/2);
  gameover= true;
  modo= "PERDER";//Insertar animación Choque electrico....
 } }  
 if((x+c_a/2>ex-re/2) && (x-c_a/2<ex+re/2) && (y +c_a/2>ey-re/2)&&(y-c_a/2<ey+re/2)){//Colision por enemigo
   vel=0;
  fill(255,0,0);
  textMode(CENTER);
  text("YOU LOSE", width/2,width/2);
  gameover= true;
  modo= "PERDER";//Inserte animación golgpe de enemigo
 }
}
