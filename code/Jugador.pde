//Jugador------------------------------------
void pelado(){
   
    image(imagenes[primera], x,y,rp,rp);//
  if(keyPressed && (key==CODED)){
       if(keyCode==RIGHT){
   primera = (primera+1)%imagenes.length; 
image(imagenes[primera], x,y, rp,rp);x+=vel;
       
}}
  if(keyPressed && (key==CODED)){
       if(keyCode==DOWN){ 
 bajando = (bajando+1)%bajimage.length; 
image(bajimage[bajando], x,y);y+=vel;
       
         
}}
if(keyPressed && (key==CODED)){
       if(keyCode==LEFT){
 izq = (izq+1)%izimage.length; 
image(izimage[izq], x,y,rp,rp );x-=vel;
      
}}

if(keyPressed && (key==CODED)){
       if(keyCode==UP){
 sub = (sub+1)%arimage.length;
 image(arimage[sub], x,y);y-=vel;
      
      }}
 
  
}
