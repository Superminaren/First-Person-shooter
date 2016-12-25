class Map{
  float cx = 0;
  float cz = 0;
  Player p;
  
  
  public PShape hmap = null;
  int pixelLength = 100; //pixel width
  float diff = 5.0; //Height Diff
  float roty = 0;
  
  int col = 0;
  int[][] hs = new int[2][2];
  PImage heightmap = null;
  
  
  
  int counter = 0;
  boolean done = false;
  //Generates from auto
  Map(){
    
  }
  //Heightmap image to generate from
  Map(PImage heightmap){
    
  }
  //Link to heightmap image
  Map(String linkToHeightMap){
    try{
      heightmap = loadImage(linkToHeightMap);
    }catch( Exception e){}
    generate();
    p = new Player(random(0,cx),random(0,cx),random(0,cx));
  }
  
  //Finished map
  Map(PShape fmap){
    
  }
  void update(){
    if(!done){
      return;
    }
    roty+=0.01;
    
    println("drawing");
    pushMatrix();
    //translate(cx,cz);
    
    p.update(0.1,0.1);
    //translate(width/2,height/2);
    
    
    
    popMatrix();
  }
  
  
   
   
  private void generate(){
    if(heightmap!=null){
      hmap = createShape();
      hmap.beginShape(TRIANGLE);
      cx = (heightmap.width*pixelLength)/2.0;
      cz = (heightmap.height*pixelLength)/2.0;
      hs = new int[heightmap.width][heightmap.height];
      for(int x = 0; x<heightmap.width; x++){
        for(int z = 0; z<heightmap.height; z++){
          hs[x][z] = (int)(red(heightmap.get(x,z))*diff);
        }
      }
      
      
    }else{
      generateHeightMap();
    }
    
    
    
  }
  public boolean load(){
      if(done){
        return true;
      }
      
      for(int z = 0; z<(heightmap.height-1); z++){
        //hmap.stroke(color(0,255,255));
        hmap.noStroke();
        hmap.fill(color(255,hs[counter][z],hs[counter][z]));
        
        //First part of cube
        hmap.vertex(counter*pixelLength,hs[counter][z],z*pixelLength);
        hmap.vertex((counter+1)*pixelLength,hs[counter+1][z+1],(z+1)*pixelLength);
        hmap.vertex((counter+1)*pixelLength,hs[counter+1][z],z*pixelLength);
        //Second part
        hmap.vertex(counter*pixelLength,hs[counter][z],z*pixelLength);
        hmap.vertex((counter+1)*pixelLength,hs[counter+1][z+1],(z+1)*pixelLength);
        hmap.vertex((counter)*pixelLength,hs[counter][z+1],(z+1)*pixelLength);
      }
      println("Progress : "+ counter +" vertices out of " + heightmap.width);
      counter+=1;
      if(counter>(heightmap.width-2)){
        println("Done loading " + heightmap.width+" vertices.");
        hmap.endShape(CLOSE);
        done = true;
        
        return true;
      }
      return false;
  }
  private void generateHeightMap(){
    
  }
  
}