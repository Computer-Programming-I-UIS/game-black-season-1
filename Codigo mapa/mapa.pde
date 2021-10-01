ArrayList<Dinero> bolsas = new ArrayList<Dinero>();
float playerX=width/2;
float playerY=height/2;

float VPx = 10;
float VPy = 10;


float radio1= 10;//Radio elipse jugador
void setup(){
  size(700,600);
  ellipseMode(RADIUS);
  
   
  for(int i=50; i < width; i+=50){//añadir lista de bolsas de dinero ancho x alto
    for(int j=50; j < height; j+=50){
       Dinero D = new Dinero(i,j);
       bolsas.add(D);
    }
  }
}

void draw(){
  background(0);
  fill(0,255,0);
  ellipse(playerX, playerY, radio1,radio1);
  for (int i=0; i < bolsas.size(); i++){ 
  Dinero Di = (Dinero) bolsas.get(i);
  Di.dibujar();
  if(dist(playerX, playerY, Di.bx, Di.by)<10){//distancia entre dos puntos
    bolsas.remove(i);
  }
 }
}

void keyPressed(){
 if (keyCode == LEFT) playerX-=VPx;
 if (keyCode==RIGHT)playerX+=VPx;
 if (keyCode==UP) playerY-=VPy;
 if(keyCode==DOWN)playerY+=VPy;
  
}
