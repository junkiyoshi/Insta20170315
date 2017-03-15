ArrayList<Line> lines;

void setup()
{
  size(512, 512, P3D);
  frameRate(30);
  blendMode(ADD);
  
  lines = new ArrayList<Line>();
  
  lines.add(new Line(color(255, 0, 0)));
  lines.add(new Line(color(255, 255, 0)));
  lines.add(new Line(color(0, 255, 0)));
  lines.add(new Line(color(0, 255, 255)));
  lines.add(new Line(color(0, 0, 255)));
  lines.add(new Line(color(255, 0, 255)));
}


void draw()
{
  background(0);
  translate(width / 2, height / 2, 0);
  
  float angle = frameCount % 360;
  float camera_x = 800 * cos(radians(angle));
  float camera_z = 800 * sin(radians(angle));   
  camera(camera_x, 0, camera_z, 
         0, 0, 0, 
         0, 1, 0);
   
  for(Line line : lines)
  {
    line.update();
    line.display();
  }
  
  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 1800)
  {
     exit();
  }
  */
}