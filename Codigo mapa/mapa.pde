ArrayList<Dinero> bolsas = new ArrayList<Dinero>();
float playerX;//Posición jugador
float playerY;


float cantidad = 5;
float VP= cantidad;//Velocidad

float radio1= 15;//Radio elipse jugador
float radiob=5;//Radio "bolsa"



//boolean colisionar = false;
boolean gameover = false;
Pared p1;
Pared p2;
Pared p3;
Pared p4;
//boolean uwu = (playerX+radio1>p4.px) && (playerX<p4.px+p4.bp) && (playerY +radio1> p4.py) && (playerY < p4.py + p4.ap);
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
 
  colisionar();
  
  //trycolisionar();
  println(playerX, playerY);
  
  
}

//-------------------------------------------



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

  /*if ((mouseX>p1.px) && (mouseX<p1.px+p1.bp) && (mouseY > p1.py) && (mouseY < p1.py + p1.ap)){
    println("COLISION");
    VP=0;
  }else {
    VP= cantidad;   
    println("R");
  }*/
  
  /*if ((playerX+radio1>p1.px) && (playerY +radio1> p1.py) && (playerY < p1.py + p1.ap)){
    playerX=p1.px-radio1;
  }if((playerX<p1.px+p1.bp) && (playerY +radio1> p1.py) && (playerY < p1.py + p1.ap)){
    playerX=p1.px+p1.bp;
  }if ((playerX+radio1>p1.px) && (playerX<p1.px+p1.bp) && (playerY +radio1> p1.py)){
     playerY=p1.py-radio1; 
  }if ((playerX+radio1>p1.px) && (playerX<p1.px+p1.bp) && (playerY < p1.py + p1.ap)){
   playerY= p1.py+p1.ap; 
  }
---------------------------------------------------------------------------------------------------------------------------  
  if ((playerX+radio1>p2.px) && (playerX<p2.px+p2.bp) && (playerY +radio1> p2.py) && (playerY < p2.py + p2.ap)){
    println("COLISION");
    colisionar = true;
  } 
  if ((playerX+radio1>p3.px) && (playerX<p3.px+p3.bp) && (playerY +radio1> p3.py) && (playerY < p3.py + p3.ap)){
    println("COLISION");
    colisionar = true;
  } 
  if ((playerX+radio1>p4.px) && (playerX<p4.px+p4.bp) && (playerY +radio1> p4.py) && (playerY < p4.py + p4.ap)){
    println("COLISION");
    colisionar = true;
  }
  
  if(colisionar == true){
       VP =1;
  }*/

}

//boolean colisionar(){  
/*void trycolisionar(){
  if(((playerX+radio1>=p4.px) && (playerX<p4.px+p4.bp) && (playerY +radio1> p4.py) && (playerY < p4.py + p4.ap))){
    if((playerX+radio1>=p4.px)){
      playerX=p4.px-radio1;
    }
    else if(playerX<p4.px+p4.bp)playerX=p4.px+p4.bp;
  }

}*/

void player(){
  noStroke();
  fill(0,255,0);
  rectMode(CENTER);
  rect(playerX, playerY, radio1,radio1);//Jugador
  rectMode(CORNER);
  
}
void trycolisionar(){//OJO: Solo funciona con cuadrados :D :/
  if((playerX+radio1>p1.px) && (playerY +radio1> p1.py) ){
    this.playerX=playerX;
    this.playerY=playerY;
    
  }
  
  
}

//}
boolean colisionar(){
 if ((playerX+radio1/2>=p4.px) && (playerX-radio1/2<p4.px+p4.bp) && (playerY +radio1/2>= p4.py)
   ||((playerX+radio1/2>p3.px) && (playerX-radio1/2<p3.px+p3.bp) && (playerY +radio1/2> p3.py) && (playerY < p3.py + p3.ap))
  ||((playerX+radio1/2>p1.px) && (playerX-radio1/2<p1.px+p1.bp) && (playerY +radio1/2> p1.py) && (playerY < p1.py + p1.ap))
  ||(((playerX+radio1/2>p2.px) && (playerX-radio1/2<p2.px+p2.bp) && (playerY +radio1/2> p2.py) && (playerY < p2.py + p2.ap)))){
  VP=0;
  fill(255,0,0);
  textMode(CENTER);
  text("YOU LOSE", width/2,width/2);
   return true; 
 }else{
   VP=cantidad;
  return false; 
 }
 
  
  
}
