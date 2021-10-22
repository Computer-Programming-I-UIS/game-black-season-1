void imp1(){
  im[0] = new impulso(85,270,30,15);
  im[1] = new impulso(115,45,15,30);
  im[2] = new impulso(315,325,15,30);
  im[3] = new impulso(315,205,15,30);
}
void bkk(){
 bk[0]=new back(85,395,30,15); 
 bk[1] = new back (395,45,15,30);
 bk[2] = new back (195,325,15,30);
 bk[3] = new back (515,205,15,30);
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
  fill(9,100,3);
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
   
  fill(155,3,3);
  rect(px,py,bp,ap);   
 }
  
  
  
}
