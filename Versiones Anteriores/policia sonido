//COLISIONES CON PAREDES-----------------------------------------------
void colisionar(){
  for(int i=0; i < c_paredes;i++){//Colision con paredes
    if(((x+c_a/2>=p[i].px) && (x-c_a/2<p[i].px+p[i].bp) && (y +c_a/2>= p[i].py)&&(y-c_a/2< p[i].py + p[i].ap))
    ||((x+c_a/2>ex-re/2) && (x-c_a/2<ex+re/2) && (y +c_a/2>ey-re/2)&&(y-c_a/2<ey+re/2))){

  vel=0;
  fill(255,0,0);
  textMode(CENTER);
  text("YOU LOSE", width/2,width/2);bombo.trigger();// auido de electrocucion
  gameover= true;
  modo= "PERDER";//Insertar animación Choque electrico....
 } }  
 if((x+c_a/2>ex-re/2) && (x-c_a/2<ex+re/2) && (y +c_a/2>ey-re/2)&&(y-c_a/2<ey+re/2)){//Colision por enemigo
   vel=0;
  fill(255,0,0);
  textMode(CENTER);
  text("YOU LOSE", width/4,width/4);policia.trigger();// sonido de policia
  gameover= true;
  modo= "PERDER";//Inserte animación golgpe de enemigo
 }
}
