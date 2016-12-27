class Player{
  float sensitivity = 0.006;//Mouse sense
  PImage view = loadImage(dataPath("view.png"));
  
  float rotX = 0;
  float rotY = 0;
  float rotZ = 0;
  float x = 0;
  float y = 0;
  float z = 0;
  
  
  Controls cr = new Controls();
  Crosshair c = new Crosshair();
  Player(float x, float y, float z){
    this.x = x;
    this.y = y;
    this.z = z;
  }
  void update(float moveX, float moveZ){
    cr.update(rotY);
    x+=cr.x;
    z+=cr.z;
    c.update(1);
    rotX=bound(rotX-(dy*sensitivity),-(PI/2),(PI/2));
    //image(view,0,0,width,height);
    rotY=bound(rotY+(dx*sensitivity),-TWO_PI-1,TWO_PI+1);
    rotY%=TWO_PI;
    
    pushMatrix();
    translate(width/2,height/2);
    pushMatrix();
    rotateX(rotX);
    rotateY(rotY);
    rotateZ(rotZ);
    
    translate(-x, y,-z); //(m.hs[(int)(x)][(int)( m.pixelLength)]*m.diff)
    
    for(PShape s : m.parts){
      shape(s);
    }
    //shape(m.hmap);
    popMatrix();
    
    popMatrix();
  }
  
  
  float bound(float v, float min, float max){
    if(v<min){
      return min;
    }if(v>max){
      return max;
    }
    return v;
  }
  
  
  
  
  
}