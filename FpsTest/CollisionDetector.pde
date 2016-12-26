class CollisionDetector{
  
  
  float heightCollision(Player p, Map m){
    if(p.x >0 && p.x<(m.pixelLength*m.heightmap.width) && p.z >0 && p.z<(m.pixelLength*m.heightmap.height)){
      return (m.hs[round(p.x/m.pixelLength)][round(p.z/m.pixelLength)]*m.diff);
    }
    return 500;
  }
  
  boolean colliding(Player p, Map m){
    return false;
  }
}