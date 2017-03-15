class Line
{
  ArrayList<PVector> history;
  float noise_x;
  float noise_y;
  float noise_z;
  color body_color;
  
  Line(color c)
  {
    history = new ArrayList<PVector>();
    
    noise_x = random(10);
    noise_y = random(10);
    noise_z = random(10);
    
    body_color = c;
  }
  
  void update()
  {
    float x = map(noise(noise_x), 0, 1, -200, 200);
    float y = map(noise(noise_y), 0, 1, -200, 200);
    float z = map(noise(noise_z), 0, 1, -200, 200);
    noise_x += 0.05;
    noise_y += 0.05;
    noise_z += 0.05;
  
    PVector direction = PVector.sub(new PVector(0, 0, 0), new PVector(x, y, z));
    direction.normalize();
    direction.mult(300);
  
    x = direction.x;
    y = direction.y;
    z = direction.z;
   
    history.add(new PVector(x, y, z));
  }
  
  void display()
  {
    stroke(body_color);
    strokeWeight(3);
    
    line(0, 0, 0, history.get(history.size() - 1).x, history.get(history.size() - 1).y, history.get(history.size() - 1).z);
    for(int i = history.size() - 1; i > 0; i--)
    {
      line(history.get(i).x, history.get(i).y, history.get(i).z, history.get(i - 1).x, history.get(i -1).y, history.get(i - 1).z);     
    }
  }
}