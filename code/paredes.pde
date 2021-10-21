class Pared{
 float px;
 float py;
 float bp;
 float ap;
 
 Pared(float x, float y, float h, float a){
   px=x;
   py=y;
   bp=h;
   ap=a;   
 }
 void dibujar(){
   //stroke(255);
   noStroke();
  fill(0,0,255);
  rect(px,py,bp,ap);   
 }
}
