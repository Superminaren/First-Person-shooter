class CollisionDetector{
  
  
  float heightCollision(Player p, Map m){
    if(m.done){
      if(p.x >0 && p.x<(m.pixelLength*m.heightmap.width) && p.z >0 && p.z<(m.pixelLength*m.heightmap.height)){
        return (m.hs[floor(p.x/m.pixelLength)][floor(p.z/m.pixelLength)]);
      }
    }
    return 500;
  }
  
  boolean colliding(Player p, Map m){
    return false;
  }
}