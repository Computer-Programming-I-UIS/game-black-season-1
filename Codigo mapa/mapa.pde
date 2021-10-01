Dinero []bolsas= new Dinero[];
float playerX=width/2;
float playerY=height/2;

void setup(){
  size(600,600);
  for (int i; i < bolsas.length; i+=75){
    
  }
}

void draw(){
  background(0);
  rect(playerX, playerY, 50,50);
}

void keyPressed(){
 if (keyPressed == LEFT) playerY-=2;
 if (keyPressed==RIGHT)playerY+=2;
 if (keyPressed==UP) playerX+=2;
 if(keyPressed==DOWN)playerY-=2;
  
}
