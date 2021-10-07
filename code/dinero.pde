class Dinero{
  float bx;
  float by;
  Dinero(float x, float y){
    bx= x;
    by = y;
  }

  void dibujar(){
    fill(255,255,0);
     ellipse(bx,by,radiob, radiob);
 }
  
}
