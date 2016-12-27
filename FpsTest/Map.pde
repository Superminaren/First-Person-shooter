class Map{
  float cx = 0;
  float cz = 0;
  Player p;
  
  CollisionDetector cd = new CollisionDetector();
  public PShape hmap = null;
  public PShape temp = null;
  //adds 256 vertex parts to one huge shape
  ArrayList<PShape> parts = new ArrayList<PShape>();
  int maxVertices = 256; //256 vertices per part
  int vertC = 0;
  
  
  int pixelLength = 50; //pixel width
  float diff = 9.0; //Height Diff
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
    p = new Player(random(0,cx),0,random(0,cx));
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
    
    //translate(cx,cz);
    //p.y = -cd.heightCollision(p,this);
    p.update(0.1,0.1);
    //translate(width/2,height/2);
    
    
    
    
  }
  
  
   
   
  private void generate(){
    if(heightmap!=null){
      temp = createShape();
      hmap = createShape();
      temp.beginShape(TRIANGLE);
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
        temp.noStroke();
        temp.fill(color(255,hs[counter][z],hs[counter][z]));
        
        //First part of cube
        temp.vertex(counter*pixelLength,hs[counter][z],z*pixelLength);
        temp.vertex((counter+1)*pixelLength,hs[counter+1][z+1],(z+1)*pixelLength);
        temp.vertex((counter+1)*pixelLength,hs[counter+1][z],z*pixelLength);
        //Second part
        temp.vertex(counter*pixelLength,hs[counter][z],z*pixelLength);
        temp.vertex((counter+1)*pixelLength,hs[counter+1][z+1],(z+1)*pixelLength);
        temp.vertex((counter)*pixelLength,hs[counter][z+1],(z+1)*pixelLength);
        vertC+=2;
        if(vertC>maxVertices){
          vertC = 0;
          temp.endShape(CLOSE);
          parts.add(temp);
          temp=createShape();
          temp.beginShape(TRIANGLE);
          
        }
        
      }
      println("Progress : "+ counter +" vertices out of " + heightmap.width);
      counter+=1;
      if(counter>(heightmap.width-2)){
        println("Done loading " + heightmap.width+" vertices.");
        temp.endShape(CLOSE);
        done = true;
        return true;
      }
      return false;
  }
  private void generateHeightMap(){
    
  }
  
}