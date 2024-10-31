boolean ballsTouching;
float touchX, touchY;

class Particle
{
  double myX, myY, myAngle, mySpeed, mySize, myColor;
  
  Particle()
  {    
   myX = touchX;
   myY = touchY;
   myAngle = Math.random()*2 * Math.PI;
   mySpeed = Math.random()*15+2;
   mySize = 15;
   myColor = color(255,0,255);
  }
  
  void move()
  {
    myX += Math.cos(myAngle) * mySpeed;
    myY += Math.sin(myAngle) * mySpeed;
  }
  
  void show()
  {
    myColor = (int)(Math.random()*255)+1;
    fill((int)myColor,0,(int)myColor);
    ellipse ((float)myX,(float)myY,(float)mySize,(float)mySize);
  }
}

class Infinity 
{
float angle, radius, centerX, centerY;
float x1, y1, x2, y2, distance; 

  Infinity()
  { 
   angle = 0;
   radius = 400;
   centerX = mouseX;
   centerY = mouseY;
   x1 = 0;
   x2 = 0;
   y1 = 0;
   y2 = 0;
   ballsTouching = false;
  }
  
  void move()
  { 
   centerX = mouseX;
   centerY = mouseY;
   
   if (mousePressed)
   {
     radius = min(300, radius - 5);
   }  else {
     radius = min(300, radius + 5);
   }
   x1 = centerX + cos(angle) * radius;
   y1 = centerY + sin(angle) * radius;
   x2 = centerX + cos(angle + PI) * radius;
   y2 = centerY + sin(angle + PI) * radius;
   angle += 0.05;   
   distance = dist(x1, y1, x2, y2);   
    if (distance <= 1 && !ballsTouching) {
      ballsTouching = true; 
      touchX = mouseX;
      touchY = mouseY;
      for (int i = 0; i < 10; i++){ 
        particle[i] = new OddballParticle();
      }
      for (int i = 10; i < particle.length; i++){ 
        particle[i] = new Particle();
      }
    }
  }
  
  void show()
  {
    if (!ballsTouching) {
    fill(255, 0, 0);
    ellipse(x1, y1, 75, 75);
    fill(0, 0, 255);
    ellipse(x2, y2, 75, 75);
    }
  }  
}

Particle [] particle;
Infinity infinity;
void setup()
{
  size(800,800);
  noStroke();
  particle = new Particle[500];
  for (int i = 0; i < 10; i++){ 
    particle[i] = new OddballParticle();
  }
  for (int i = 10; i < particle.length; i++){ 
    particle[i] = new Particle();
  }
  infinity = new Infinity();
}
void draw()
{
   background(0);
   if(ballsTouching){
     for (int i = 0; i < particle.length; i++){
       particle[i].move();
       particle[i].show();
     }
   }
   infinity.show();
   infinity.move();
}

void keyPressed() {
  ballsTouching = false;
  infinity = new Infinity(); 
  for (int i = 0; i < 10; i++){ 
    particle[i] = new OddballParticle();
  }
  for (int i = 10; i < particle.length; i++){ 
    particle[i] = new Particle();
  }
}

class OddballParticle extends Particle e
{
  OddballParticle(){
   myX = touchX;
   myY = touchY;
   myAngle = Math.random()*2 * Math.PI;
   mySpeed = Math.random()*30+2;
   mySize = 80;
   myColor = (int)(Math.random()*200)+56;
  }
  
  void show()
  {
    fill((int)myColor,0,(int)myColor);
    ellipse ((float)myX,(float)myY,(float)mySize,(float)mySize/2);
  }
}

