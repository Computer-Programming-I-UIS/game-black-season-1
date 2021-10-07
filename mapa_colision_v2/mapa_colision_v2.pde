ArrayList<Dinero> bolsas = new ArrayList<Dinero>();
float playerX;//Posición jugador
float playerY;


float cantidad = 5;
float VP= cantidad;//Velocidad

float radio1= 15;//Radio elipse jugador
float radiob=5;//Radio "bolsa"



//boolean colisionar = false;
boolean gameover = false;

int c_paredes=6;//numero de paredes
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

int vel=5;

int r=100;
//posicion incial policia.
int tr = 37; 
//radio posicion inicial capucho, anchoxalto
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
  
   playerX= width/2;
   playerY= height/2;
  for(int i=20; i < width; i+=40){//añadir lista de bolsas de dinero ancho x alto
    for(int j=20; j < height; j+=40){
       Dinero D = new Dinero(i,j);
       bolsas.add(D);
    }
  }
  
  p[0] = new Pared(0,0,40,200);
  p[1]= new Pared(0,240,40,360);
  p[2] = new Pared(0,height-40,width,40);
  p[3] = new Pared(0,0,width,40);
  p[4] = new Pared(width-40,0,40,height-120);
  p[5]= new Pared(0,160,160,40);
  /*p[6] = new Pared(600,440,40,120);
  p[7] = new Pared(400,400,200,40);
  p[8] = new Pared(80,80,40,320);
  p[9]= new Pared(200,200,120,80);
  p[10] = new Pared(600,440,40,120);
  p[11] = new Pared(400,400,200,40);*/

//Con Sprite--------------------------------------------------------------------------------------
for(int i = 0; i < images.length; i++){images[i] = loadImage("policia_" + i + ".png");
for(int a = 0; a < images.length; a++){imagenes[a] = loadImage("personaje_" + a + ".png");
}
}
x= width/2 ;
y= height/2 ;
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
  
  
  
  println(mouseX, mouseY);
  
  
  
  
 }

void seleccionar(){
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
    }else if (mouseX >opx && mouseX<opx+bb && mouseY >100 &&mouseY<100+hh && mousePressed){
      modo = "INSTRUCCIONES";
    }else if (mouseX >opx && mouseX<opx+bb && mouseY >150 &&mouseY<150+hh&& mousePressed){
      exit();
    }
  }
  
 void play(){
   background(255,0,0);
   cuadricula();    
  dinero();  
  texto();    
  detect();   
  pelado();
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
 void instruction(){
   background(0,255,0);
    if (keyPressed){
    if(key == 'M' || key == 'm'){
      
     modo = "MENU"; 
      
    }
    }
 }
void lose(){
  background(255,0,0);
  textSize(50);
  fill(0);
  text("YOU LOSE",width/2,height/2);//Incluya animación
  textSize(15);
  text("Pulsa m para regresar al menú", width/2,height/2+100);
  if (keyPressed){
    if(key == 'M' || key == 'm'){      
     modo = "MENU";       
    }
   }
     for(int i=20; i < width; i+=40){//añadir lista de bolsas de dinero ancho x alto
    for(int j=20; j < height; j+=40){
       Dinero D = new Dinero(i,j);
       bolsas.add(D);
    }
  }
   x= width/2 ;
  y= height/2 ;
  vel=5;
  
}
 
 void win(){
   //Inserte celebración
 }



//-------------------------------------------

void dinero(){
  noStroke();
  
  for (int i=0; i < bolsas.size(); i++){//Aparición de bolsas 
  Dinero Di = (Dinero) bolsas.get(i);
  Di.dibujar();
  if(dist(x,y, Di.bx, Di.by)<c_a/2+radiob){//distancia entre dos puntos
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
  if (x > width-c_a/2)x=width-c_a/2; 
  /*if(playerX<0)playerX=0; //Para elipse: */if(x<c_a/2)x=c_a/2;
  if(y>height-c_a/2)y=height-c_a/2; 
  /*if(playerY<0)playerY=0; //Para elipse: */ if(y<c_a/2)y=c_a/2;
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
    if((x+c_a/2>=p[i].px) && (x-c_a/2<p[i].px+p[i].bp) && (y +c_a/2>= p[i].py)&&(y-c_a/2< p[i].py + p[i].ap)){

  vel=0;
  fill(255,0,0);
  textMode(CENTER);
  text("YOU LOSE", width/2,width/2);
  gameover= true;
  modo= "PERDER";
 }
 }
 
  
  
}
