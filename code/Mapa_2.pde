void mapa2(){
  p2[0] = new Pared2(0,0,360,40);
  p2[1] = new Pared2(0,0,40,height);
  p2[2] = new Pared2(0,560,width,40);
  p2[3] = new Pared2(640,0,40,height);
  p2[4] = new Pared2(400,0,120,40);
  p2[5] = new Pared2(320,40,40,40);
  p2[6] = new Pared2(160,240,360,40);
  p2[7] = new Pared2(160,240,40,120);
  p2[8] = new Pared2(160,320,360,40);
  p2[9] = new Pared2(480,240,40,120);
  p2[10] = new Pared2(440,40,40,200);
  p2[11] = new Pared2(560,0,80,40);
  p2[12] = new Pared2(360,120,40,80);
  p2[13] = new Pared2(320,360,40,80);
  p2[14] = new Pared2(480,360,40,80);
  p2[15] = new Pared2(520,320,40,40);
  p2[16] = new Pared2(280,200,40,40);
  p2[17] = new Pared2(240,120,120,40);
  p2[18] = new Pared2(80,80,200,40);
  p2[19] = new Pared2(80,120,40,320);
  p2[20] = new Pared2(120,160,40,40);
  p2[21] = new Pared2(120,400,160,40);
  p2[22] = new Pared2(200,440,40,40);
  p2[23] = new Pared2(80,480,280,40);
  p2[24] = new Pared2(320,480,40,80);
  p2[25] = new Pared2(400,400,40,120);
  p2[26] = new Pared2(440,480,120,40);
  p2[27] = new Pared2(560,400,40,120);
  p2[28] = new Pared2(600,240,40,160);
  p2[29] = new Pared2(560,80,40,200);
  p2[30] = new Pared2(520,80,40,40);
  p2[31] = new Pared2(480,160,40,40);

  
}
//-----------------------------------------------------------------------------------
void design2(){
   background(#000F07);
  
   //cuadricula();    
  dinero2();  
  texto();    
  detect();   
  
  enemigo2();
   for(int i=0; i< c_paredes2; i++){
    p2[i].dibujar2();    
  }
  pelado();
  for(int i = 220; i <500; i+=40){
   image(skull, i,300,40,40);
  }
  for(int i = 280; i <400; i+=40){
   image(skull, 640,i,40,40);
  }
  colisionar2();
  puntos();
  if (keyPressed){//Volver al menu
    if(key == 'M' || key == 'm'){      
     modo = "MENU";
   
    }
    }
    if(y<0&&x<390&&x>375||(y<0&&x>533&&x<549)){
     modo = "JUGAR"; 
    }
     if(modo == "JUGAR"&&y<0&&x<390&&x>375){
    x= 380;
    y= height-c_a/2 ;
    ex= 540;//Posición para enemigo
    ey = 140;
  }
  if(modo == "JUGAR" && (y<0&&x>533&&x<549)){
    x=540;
    y= height-c_a/2 ;
    ex= 540;//Posición para enemigo
    ey = 140;
  }
 
}
//-----------------------------------------------------------------------------------
void colisionar2(){
  for(int i=0; i < c_paredes2;i++){//Colision con paredes
    if(((x+c_a/2>=p2[i].px+3) && (x-c_a/2<p2[i].px+p2[i].bp-3) && (y +c_a/2>= p2[i].py+3)&&(y-c_a/2< p2[i].py + p2[i].ap-3))){

  fond.pause();    
  vel=0;
  bombo.trigger();// auido de electrocucion

  modo= "PERDER";//Insertar animación Choque electrico....
 } }  
 if((x+c_a/2>ex-re/2) && (x-c_a/2<ex+re/2) && (y +c_a/2>ey-re/2)&&(y-c_a/2<ey+re/2)){//Colision por enemigo
   fond.pause();
   vel=0;bombo.trigger();
  modo= "PERDER";//Inserte animación golgpe de enemigo
 }
  
}
void dinero2(){
  if ( modo == "MAPA2"){
  //stroke(255);  
  for (int i=0; i < bolsas2.size(); i++){//Aparición de bolsas 
  Dinero2 D2i = (Dinero2) bolsas2.get(i);
  D2i.dibujar();
  if(dist(x,y, D2i.bx, D2i.by)<c_a/2+radiob){//distancia entre dos puntos
    bolsas2.remove(i);moneda.trigger();// audio de recoleccion
   }
  }
 }  
}
//------------------------------------------
 void enemigo2(){
   image(images[imageIndex], ex, ey);//policia
   ey+=vel_e;//mover
   if(ey< 140){
   imageIndex = (imageIndex+1)%images.length; 
image(images[imageIndex], ex,ey);vel_e*=-1;
   }else if (ey >220){
     imageIndex = (imageIndex+1)%images.length; 
image(images[imageIndex], ex,ey);vel_e*=-1;
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
   noStroke();
  fill(0,0,255);
  rect(px,py,bp,ap);   
 }
}

void remover(){
 for (int i=0; i < bolsas2.size(); i++){
    bolsas2.remove(i);
  } 
}
