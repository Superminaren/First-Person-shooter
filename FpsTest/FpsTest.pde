import java.awt.Robot;
import com.jogamp.nativewindow.util.*;
Cursor cursor;
Map m;

int wX = 0;
int wY = 0;
float dx = 0;
float dy = 0;
float sx = 0;
float sy = 0;


void setup(){
  size(1280,600,P3D); 
  //m = new Map(dataPath("Heightmap.png"));
  m = new Map(dataPath("terrain-heightmap.JPG"));
  //terrain-heightmap.JPG
  noCursor();
  cursor = new Cursor();
  frameRate(120);
}
void draw(){
  m.load();
  //ortho();
  background(0);
  lights();
  //stroke(color(0,255,255));
  m.update();
  surface.setTitle(""+frameRate);
  updateCursor();

}


void updateCursor(){
    
    getWindowLocation(P3D);
    println("WX: "+wX + " WY: "+wY);
    //Display the cursor
    if(focused){
      dx = mouseX-(width/2);
      dy = mouseY-(height/2);
      
      
      sx+=dx;
      sy+=dy;
      stroke(color(0,255,255));
      ellipse(sx,sy,20,20);
      text("sx: "+sx,20,20);
      text("sy: "+sy,20,40);
      cursor.update(0, 0, wX, wY);
      //noCursor();
    }else{
      cursor();
    }
    
    
    
}

void mousePressed(){
  if (mouseButton == LEFT){
    cursor.xStart = mouseX;
    cursor.yStart = mouseY;
  }
}

void mouseReleased(){
  cursor.selecting = false;
}

PVector getWindowLocation(String renderer) {
  PVector l = new PVector();
  if (renderer == P2D || renderer == P3D) {
    Point p = new com.jogamp.nativewindow.util.Point();
    ((com.jogamp.newt.opengl.GLWindow)surface.getNative()).getLocationOnScreen(p);
    wX = p.getX();
    wY = p.getY();
  } else if (renderer == JAVA2D) {
    java.awt.Frame f =  (java.awt.Frame) ((processing.awt.PSurfaceAWT.SmoothCanvas) surface.getNative()).getFrame();
    wX = f.getX();
    wY = f.getY();
  }
  return l;
}