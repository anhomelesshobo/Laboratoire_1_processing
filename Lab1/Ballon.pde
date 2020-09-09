class Ballon
{
  PVector location;
  PVector velocity;
  PVector acceleration;

   
  float topSpeed;
  float mass;
  
 Ballon() {
    
    this.location = new PVector (random (width), random (height));    
    this.velocity = new PVector (0, 0);
    this.acceleration = new PVector (0 , 0);
    this.topSpeed = 100;
    this.mass = 1;
  } 
  
  Ballon(float m, float x, float y) {
    mass = m;
    location = new PVector (x, y);
    this.topSpeed = 100;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  
  void display () {
    stroke (0);
    fill (300, 0, 0, 350);
    
    ellipse (location.x, location.y, mass * 16, mass * 16); // Dimension à l'échelle de la masse
  }
  
  void applyForce (PVector force) {
    PVector f = force;
    f.div(mass); 
    this.acceleration.add(f);
  }
  
  void update () {
    
    velocity.add(acceleration);
    
     if(velocity.mag()>topSpeed)
     {
       velocity.normalize();
       velocity.mult(topSpeed);
     }
     
    location.add (velocity);

    acceleration.mult (0);
  }
  
   void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }
    
    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    } else if (location.y < 0) {
      velocity.y *= -1;
      location.y = 0;
    }
  }
}
