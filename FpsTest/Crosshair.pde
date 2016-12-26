class Crosshair{
  float w = 1; //Pixel width of crosshair
  float opening = 6; //spacing between lines
  float lineLength = 5;
  int col = color(0,255,0); //RGB color of crosshair
  
  
  
  void update(float open){
    pushMatrix();
    strokeWeight(w);
    stroke(col);
    line((width/2)-((opening/2)*open),height/2,(width/2)-((opening/2)*open)-lineLength,height/2);
    line((width/2)+((opening/2)*open),height/2,(width/2)+((opening/2)*open)+lineLength,height/2);
    line(width/2,(height/2)-((opening/2)*open),width/2,(height/2)-((opening/2)*open)-lineLength);
    line(width/2,(height/2)+((opening/2)*open),width/2,(height/2)+((opening/2)*open)+lineLength);
    popMatrix();
  }
}