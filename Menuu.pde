String modo;

int opciones=2;

menu[] opc = new menu[opciones];


int bb;
int hh;
int opx;
int opy;
int cc;

color Color1;
color Color2;
color Color3;
void setup(){
 size(400,400);
 opc[0] = new menu(50,50,200,40,200);
 opc[1] = new menu(50,100,200,40,200);
 modo = "MENU";
 
}

void draw(){
  background(0);
  textSize(15);
 switch(modo){
  case "MENU":

  fill(Color1);
  rect(50,50,200,40);
  
  fill(0);text("JUGAR", 80,70);
  fill(Color2);
  rect(50,100,200,40);
  fill(0);
  text("INSTRUCCIONES", 80,120);
  fill(Color3);
  rect(50,150,200,40);
  fill(0);
  text("SALIR", 80,170);
  seleccionar();

    break;
  case "JUGAR":
  
  play();
  break;
  case "INSTRUCCIONES":
  instruction();
  
  break;
  case "PERDER":
  lose();
  break;
  case "GANAR":
  win();
  break;

 }

}


  void seleccionar(){
      if (mouseX >opx && mouseX<opx+bb && mouseY >50 &&mouseY<50+hh){//variar el color ligeramente
     Color1= color(255,0,0,200);
      }else Color1 = color(255,0,0);
    if (mouseX >opx && mouseX<opx+bb && mouseY >100 &&mouseY<100+hh){
      Color2= color(255,0,0,200);
    }else Color2 = color(255,0,0);
    if (mouseX >opx && mouseX<opx+bb && mouseY >150 &&mouseY<150+hh){
      Color3= color(255,0,0,200);
    }else Color3 = color(255,0,0);
     if (mouseX >opx && mouseX<opx+bb && mouseY >50 &&mouseY<50+hh && mousePressed){
     modo = "JUGAR";
    }else if (mouseX >opx && mouseX<opx+bb && mouseY >100 &&mouseY<100+hh && mousePressed){
      modo = "INSTRUCCIONES";
    }else if (mouseX >opx && mouseX<opx+bb && mouseY >150 &&mouseY<150+hh&& mousePressed){
      exit();
    }
  }
  
 void play(){
   background(255,0,0);
 if (keyPressed){//Volver al menu
    if(key == 'M' || key == 'm'){
      
     modo = "MENU"; 
      
    }
    }
 }
 void instruction(){
   background(0,255,0);
    if (keyPressed){
    if(key == 'M' || key == 'm'){
      
     modo = "MENU"; 
      
    }
    }
 }
void lose(){
  //Incluya animación
}
 
 void win(){
   //Inserte celebración
 }
