class menu{


  menu(int x, int y, int a, int h, int c){
    opx=x;
    opy=y;
    bb=a;
    hh=h;
    cc=c;
  }
  void drawOptions(){
   fill(cc);
   rect(opx,opy, bb,hh);
  }
}
