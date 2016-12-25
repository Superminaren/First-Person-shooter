
class Cursor
{
  float xPos, yPos, xStart, yStart, xLast, yLast;
  boolean selecting = false;
  Robot robot;
 
  Cursor(){
    try{
      robot = new Robot();
    }catch (Throwable e){
     
    }
  }
  
  
 
  private void update(int xScreen, int yScreen, int xFrame, int yFrame){
    robot.mouseMove(xScreen+xFrame+round(width/2), yScreen+yFrame+round(height/2));
   
    xPos += mouseX-width/2;
    yPos += mouseY-height/2;
   
    xPos = xPos>width?width:xPos;
    xPos = xPos<0?0:xPos;
    yPos = yPos>height?height:yPos;
    yPos = yPos<0?0:yPos;
  }
 
  void display()
  {
    /*stroke(0, 200, 0);
    strokeWeight(2);
    line(xPos, yPos, xPos + 8, yPos + 5);
    line(xPos, yPos, xPos + 5, yPos + 8);
    line(xPos + 5, yPos + 8, xPos + 8, yPos + 5);*/
  }
 
  void selectionBox()
  {
    stroke(0, 200, 0);
    strokeWeight(1);
    fill(0);
    rect(xStart, yStart, xPos-xStart, yPos-yStart);
  }
}