class Controls{
  float moveMentSpeed = 20.0;
  
  float z = 0;
  float x = 0;
  float y = 0;
  
  
  float realAngle = 0; //Angle after sideways modifiers
  //Key mapping
  boolean w = false;
  boolean s = false;
  boolean a = false;
  boolean d = false;
  
  void update(float rotationY){
    if(!w&&!s&&!a&&!d){
      x = 0;
      z = 0;
    }else{
      realAngle = (rotationY);
      if(s){realAngle+=PI;}
      
      
      x = moveMentSpeed*cos(realAngle-(PI/2));
      z = moveMentSpeed*sin(realAngle-(PI/2));
    }
    
    
  }
  
  
  
  
  
  float delta(){
    return 60.0/frameRate;
  }
  
  
}