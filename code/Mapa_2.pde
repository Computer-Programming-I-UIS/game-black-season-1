void mapa2(){
  p2[0] = new Pared2(40,40,40,40);
 /* p[1]= new Pared(0,240,40,360);
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
  p[25] = new Pared(480,280,40,120);*/
  
}
void design2(){
   background(0);
  
   cuadricula();    
  dinero2();  
  texto();    
  detect();   
  pelado();
  enemigo();
   for(int i=0; i< c_paredes2; i++){
    p2[i].dibujar2();    
  }
  colisionar2();
  if (keyPressed){//Volver al menu
    if(key == 'M' || key == 'm'){      
     modo = "MENU";
   
    }
    }
    if(y<0){
     modo = "JUGAR"; 
    }
     if(modo == "JUGAR"){
    x= 20;
  y= 220 ;
  }
 
}
void colisionar2(){
  for(int i=0; i < c_paredes2;i++){//Colision con paredes
    if(((x+c_a/2>=p2[i].px) && (x-c_a/2<p2[i].px+p2[i].bp) && (y +c_a/2>= p2[i].py)&&(y-c_a/2< p2[i].py + p2[i].ap))){

  vel=0;
  bombo.trigger();// auido de electrocucion

  modo= "PERDER";//Insertar animación Choque electrico....
 } }  
 if((x+c_a/2>ex-re/2) && (x-c_a/2<ex+re/2) && (y +c_a/2>ey-re/2)&&(y-c_a/2<ey+re/2)){//Colision por enemigo
   vel=0;bombo.trigger();
  modo= "PERDER";//Inserte animación golgpe de enemigo
 }
  
}
void dinero2(){
  if ( modo == "MAPA2"){
  noStroke();  
  for (int i=0; i < bolsas2.size(); i++){//Aparición de bolsas 
  Dinero2 D2i = (Dinero2) bolsas2.get(i);
  D2i.dibujar();
  if(dist(x,y, D2i.bx, D2i.by)<c_a/2+radiob){//distancia entre dos puntos
    bolsas2.remove(i);moneda.trigger();// audio de recoleccion
   }
  }
 }  
}

class Pared2{
 float px;
 float py;
 float bp;
 float ap;
 
 Pared2(float x, float y, float h, float a){
   px=x;
   py=y;
   bp=h;
   ap=a;   
 }
 void dibujar2(){
  fill(0,0,255);
  rect(px,py,bp,ap);   
 }
}

void remover(){
 for (int i=0; i < bolsas2.size(); i++){
    bolsas2.remove(i);
  } 
}
