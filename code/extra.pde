void imp1(){
  im[0] = new impulso(90,220,20,20);
  
}
void bkk(){
 bk[0]=new back(90,400,20,20); 
}
class impulso{
   float px;
 float py;
 float bp;
 float ap;
 
 impulso(float x, float y, float h, float a){
   px=x;
   py=y;
   bp=h;
   ap=a;   
 }
 void dibujar(){
   stroke(255);
  fill(0,255,0);
  rect(px,py,bp,ap);   
 }
  
  
}

class back{
   float px;
 float py;
 float bp;
 float ap;
 
 back(float x, float y, float h, float a){
   px=x;
   py=y;
   bp=h;
   ap=a;   
 }
 void dibujar(){
   stroke(255);
  fill(255,0,0);
  rect(px,py,bp,ap);   
 }
  
  
  
}
