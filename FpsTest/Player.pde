class Player{
  float sensitivity = 0.001;//Mouse sense
  
  
  float rotX = 0;
  float rotY = 0;
  float rotZ = 0;
  float x = 0;
  float y = 0;
  float z = 0;
  
  Player(float x, float y, float z){
    this.x = x;
    this.y = y;
    this.z = z;
  }
  void update(float moveX, float moveZ){
    x+=moveX;
    z+=moveZ;
    x+=0.001;
    
    
    
    
    
    
    
    rotX+= dy*sensitivity;
    rotY+= dx*sensitivity;
    translate(-x,-y,-z);
    rotateX(rotX);
    rotateY(rotY);
    rotateZ(rotZ);
    shape(m.hmap);
    translate(width/2,height/2);
  }
  
  
  
  
  
  
}