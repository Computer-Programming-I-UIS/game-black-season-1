ArrayList<Dinero> bolsas = new ArrayList<Dinero>();
float playerX;//Posición jugador
float playerY;

float cantidad = 15;
float VP= cantidad;//Velocidad


float radio1= 15;//Radio elipse jugador
float radiob=5;//Radio "bolsa"

boolean colisionar = false;
boolean gameover = false;
Pared p1;
Pared p2;
Pared p3;
Pared p4;

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
  
  p1 = new Pared(80,80,40,320);
  p2 = new Pared(200,200,120,80);
  p3 = new Pared(600,440,40,120);
  p4 = new Pared(400,400,200,40);
  
}

//-----------------------------------------
void draw(){
  background(0); 
  cuadricula();  
  
  dinero();
  texto();
  detect();
  player();
  p1.dibujar();
  p2.dibujar();
  p3.dibujar();
  p4.dibujar();
 
  //colisionar(playerX, playerY);
  //println(playerX, playerY);
  
  
}

//-------------------------------------------

void player(){
  noStroke();
  fill(0,255,0);
  rect(playerX, playerY, radio1,radio1);//Jugador
  
}

//-------------------------------------------

void dinero(){
  noStroke();
  for (int i=0; i < bolsas.size(); i++){//Aparición de bolsas 
  Dinero Di = (Dinero) bolsas.get(i);
  Di.dibujar();
  if(dist(playerX, playerY, Di.bx, Di.by)<radio1+radiob){//distancia entre dos puntos
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
  if(playerX<0)playerX=0; //Para elipse: if(playerX<radio1)playerX=radio1;
  if(playerY>height-radio1)playerY=height-radio1; 
  if(playerY<0)playerY=0; //Para elipse:  if(playerY<radio1)playerY=radio1;

  /*if ((mouseX>p1.px) && (mouseX<p1.px+p1.bp) && (mouseY > p1.py) && (mouseY < p1.py + p1.ap)){
    println("COLISION");
    VP=0;
  }else {
    VP= cantidad;   
    println("R");
  }*/
  
  if ((playerX+radio1>p1.px) && (playerX<p1.px+p1.bp) && (playerY +radio1> p1.py) && (playerY < p1.py + p1.ap)){
    println("COLISION");
    cantidad=0;
    //colisionar = true;
  }
  if ((playerX+radio1>p2.px) && (playerX<p2.px+p2.bp) && (playerY +radio1> p2.py) && (playerY < p2.py + p2.ap)){
    println("COLISION");
    VP=1;//colisionar = true;
  } else VP= cantidad;
  if ((playerX+radio1>p3.px) && (playerX<p3.px+p3.bp) && (playerY +radio1> p3.py) && (playerY < p3.py + p3.ap)){
    println("COLISION");
    VP=0;//colisionar = true;
  } 
  if ((playerX+radio1>p4.px) && (playerX<p4.px+p4.bp) && (playerY +radio1> p4.py) && (playerY < p4.py + p4.ap)){
    println("COLISION");
    cantidad = 0;//colisionar = true;
  }
  
  if(colisionar == true){
       
  }
}

/*boolean colisionar(float xx, float yy){
  
 float mx = (float)playerX+p1.px/2; 
  
  return(xx > mx-p1.px/2);
  
}*/
