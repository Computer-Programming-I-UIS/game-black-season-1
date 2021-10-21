/*------------------------------------
Videojuego: Black Season

Descripción: Black Season es un videojuego arcade que consta de llegar a la parte derecha del mapa o salida
evitando chocar las paredes ya que se encuentran electrificadas. De igual forma debe evitar a su enemigo que se
encuentra moviendose como un vigilante.

Navegue por el menú seleccionando las opciones dando clic, y para devolverse, pulse 'm'. 
          
Autores: Santiago Vargas
         Duvan Rodriguez

--------------------------------------*/



// importar biblioteca minim
import ddf.minim.*;


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

int c_paredes2=1;//numero de paredes
Pared2 [] p2 = new Pared2[c_paredes2];


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
int bajando = 0;
PImage[] bajimage = new PImage[maxImages];
int sub= 0;
PImage [] arimage = new PImage[maxImages];

int vel=6;
int vel_e=8;
int r=100;
//radio enemigo
int re = 30; 
//radio posicion inicial capucho, ancho x alto
int c_a=25;
int c_h = 25;
int rp = 25;

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
color Color4;
//-------------------------------------------

PImage jugar;
PImage jugar2;
PImage instr;
PImage instru2;
PImage crd;
PImage crd2;
PImage ext;
PImage ext2;
PImage port;
PImage gc;
PImage go;
PImage gw;

int a;
int b;
//----------------------------------------------------------------------------------------------------------------
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
  mapa();
  mapa2();

//Con Sprite--------------------------------------------------------------------------------------
for(int i = 0; i < images.length; i++)images[i] = loadImage("policia_" + i + ".png");
for(int a = 0; a < imagenes.length; a++)imagenes[a] = loadImage("personaje_" + a + ".png");
for(int i =0; i < bajimage.length; i++)bajimage[i]=loadImage("abpersonaje_" + i +".png");
for(int i =0; i < arimage.length; i++)arimage[i]=loadImage("arpersonaje_" + i +".png");
//Imagenees--------------------------------------------------------------------------------------
jugar = loadImage("jugar.png");
jugar2 = loadImage("jugar2.png");
instr= loadImage("instru.png");
instru2=loadImage("instru2.png");
crd = loadImage("cred.png");
crd2=loadImage("cred2.png");
ext=loadImage("ex.png");
ext2=loadImage("ex2.png");
port = loadImage("portad.png");
gc = loadImage("creditos.png");
go = loadImage("game over.png");
gw = loadImage("win.png");
a= 20;
b=220;

x= a ;//Posicion para personaje
y= b ;

ex= 540;//Posición para enemigo
ey = 140; 
frameRate(20);


//--------------------------------------------------------------------------------------
opc[0] = new menu(50,50,200,40,200);
opc[1] = new menu(50,100,200,40,200);
modo = "MENU";
}

//-------------------------------------------------------------------------------------------------------------------
void draw(){
  background(port); 
  imageMode(CENTER);
  textSize(15);

 switch(modo){
  case "MENU":


  image(jugar,width/2, height/2);
  image(instr, width/2, height/2+45);
  image(crd, width/2, height/2+90);
  image(ext, width/2, height/2+140);
  seleccionar();

    break;
  case "JUGAR":  
  play();
  break;
  case "INSTRUCCIONES":
  instruction();  
  break;
  case "CREDITS":
  credits();
  break;
  case "PERDER":
  lose();
  break;
  case "GANAR":
  win();
  break;
  case "MAPA2":
  design2();
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
    //-----------------------------------------  CON IMAGEN
    if (mouseX >281 && mouseX<397 && mouseY >281 &&mouseY<315){
      image(jugar2,width/2, height/2);
    }
    if (mouseX >194 && mouseX<485 && mouseY >332 &&mouseY<359){
      image(instru2,width/2, height/2+46);
    }
    if (mouseX >247 && mouseX<430 && mouseY >375 &&mouseY<404){
      image(crd2,width/2, height/2+90);
    }
    if (mouseX >285 && mouseX<394 && mouseY >427 &&mouseY<451){
      image(ext2,width/2, height/2+140);
    }
    if (mouseX >281 && mouseX<397 && mouseY >281 &&mouseY<315 && mousePressed){
     modo = "JUGAR";
     for(int i=20; i < width; i+=40){//añadir lista de bolsas de dinero ancho x alto cuando se seleccione modo jugar
    for(int j=20; j < height; j+=40){
       Dinero D = new Dinero(i,j);
       bolsas.add(D);
    }
  }
    }else if (mouseX >194 && mouseX<485 && mouseY >332 &&mouseY<359 && mousePressed){
      modo = "INSTRUCCIONES";
    }else if (mouseX >247 && mouseX<430 && mouseY >375 &&mouseY<404 && mousePressed){
      modo = "CREDITS";
    }else if (mouseX >285 && mouseX<394 && mouseY >427 &&mouseY<453 && mousePressed){
       exit();
    }
  }
  
//-----------------------------------------  
 void play(){
   background(0);
   //cuadricula();    
  dinero();  
  texto();    
  detect();   
  pelado();
  enemigo();

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
 
//INTRUCCIONES DEL JUEGO---------------------------------------- 
void instruction(){
   background(0,255,0);
   textSize(25);
   fill(0);
   text(("Instrucciones:"),10,25);
   textSize(15);
   text(("*Usa las flechas para moverte (una a la vez)\n*Escapa del laberinto y recolecta la mayor cantidad de monedas\n*No toques las paredes o moriras\n*Evita el policia."),10,50);
   text(("Pulsa 'm' para volver al menú"),width/2-40,height/2);
    if (keyPressed){
    if(key == 'M' || key == 'm'){      
     modo = "MENU";
     for (int i=0; i < bolsas.size(); i++){//Aparición de bolsas 
    bolsas.remove(i);
  }
    }
    }
    
 }
//MODO PERDER-----------------------------------------
void lose(){
  background(go);
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
  vel=6;
  
}
//MODO GANAR----------------------------------------- 
 void win(){//Inserte celebración
   background(gw);
   ganar.play();// auido de victoria
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
    bolsas.remove(i);moneda.trigger();// audio de recoleccion
  }
 }
  
}

 //--------------------------------------------------
 void enemigo(){
   image(images[imageIndex], ex, ey);//policia
   ex+=vel_e;//mover
   if(ex< 540){
   imageIndex = (imageIndex+1)%images.length; 
image(images[imageIndex], ex,ey);vel_e*=-1;
   }else if (ex >620){
     imageIndex = (imageIndex+1)%images.length; 
image(images[imageIndex], ex,ey);vel_e*=-1;
   }
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
  if (x > width-c_a/2 && modo == "JUGAR"){
    x=width-c_a/2;
    modo= "GANAR";
  }
  if(x-c_a/2<0){
    
    modo = "MAPA2";

  }
   //if(x<c_a/2)x=c_a/2;
  if(y>height-c_a/2)y=height-c_a/2; 
  if(y<c_a/2)y=c_a/2;
  
}

//COLISIONES CON PAREDES-----------------------------------------------
void colisionar(){
  for(int i=0; i < c_paredes;i++){//Colision con paredes
    if(((x+c_a/2>=p[i].px) && (x-c_a/2<p[i].px+p[i].bp) && (y +c_a/2>= p[i].py)&&(y-c_a/2< p[i].py + p[i].ap))
    ||((x+c_a/2>ex-re/2) && (x-c_a/2<ex+re/2) && (y +c_a/2>ey-re/2)&&(y-c_a/2<ey+re/2))){

  vel=0;
  //fill(255,0,0);
  //textMode(CENTER);
  bombo.trigger();// auido de electrocucion
  //text("YOU LOSE", width/2,width/2);

  modo= "PERDER";//Insertar animación Choque electrico....
 } }  
 if((x+c_a/2>ex-re/2) && (x-c_a/2<ex+re/2) && (y +c_a/2>ey-re/2)&&(y-c_a/2<ey+re/2)){//Colision por enemigo
   vel=0;
  modo= "PERDER";//Inserte animación golgpe de enemigo
 }
}


void credits(){
  background(gc);
  //fill(0);text("Duvan Rodriguez\nSantiago Vargas\nProgramación B1\n2021",10,10);
   if (keyPressed){//Volver al menu
    if(key == 'M' || key == 'm'){      
     modo = "MENU";   
    }
    }
}
