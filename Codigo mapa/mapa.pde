ArrayList<Dinero> bolsas = new ArrayList<Dinero>();
float playerX;//Posición jugador
float playerY;

float VPx = 15;//Velocidad
float VPy = 15;


float radio1= 15;//Radio elipse jugador
float radiob=5;//Radio "bolsa"

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
}
//-----------------------------------------
void draw(){
  background(0);
  cuadricula();
  detect();
  noStroke();
  fill(0,255,0);
  ellipse(playerX, playerY, radio1,radio1);//Jugador
  
  for (int i=0; i < bolsas.size(); i++){//Aparición de bolsas 
  Dinero Di = (Dinero) bolsas.get(i);
  Di.dibujar();
  if(dist(playerX, playerY, Di.bx, Di.by)<radio1+radiob){//distancia entre dos puntos
    bolsas.remove(i);
  }
 }
 texto();
  println(playerX, playerY);
  
}

//--------------------------------------------------
void keyPressed(){//Movimiento player
 if(key==CODED){
  if (keyCode == LEFT) playerX-=VPx;
 if (keyCode==RIGHT)playerX+=VPx;
 if (keyCode==UP) playerY-=VPy;
 if(keyCode==DOWN)playerY+=VPy;
 }
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
  if (playerX > width-radio1)playerX=width-radio1;
  if(playerX<radio1)playerX=radio1;
  if(playerY>height-radio1)playerY=height-radio1;
  if(playerY<radio1)playerY=radio1;
  
}
