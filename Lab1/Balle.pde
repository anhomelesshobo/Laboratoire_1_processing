class Balle
{
  PVector location;
  PVector velocity;
  PVector acceleration;

   
  float topSpeed;
  float mass;
  
  Balle(float m, float x, float y) {
    mass = m;
    location = new PVector (random(width),random(height) );
    this.topSpeed = 100;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void display () {
    stroke (0);
    fill (0, 0, 0, 200);
    
    ellipse (location.x, location.y, mass*16, mass*16); // Dimension à l'échelle de la masse
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
  
 
  boolean isInside(Liquid l) {
  if (location.x>l.x && location.x<l.x+l.w && location.y>l.y && location.y<l.y+l.h)
  {
    return true;
  } else {
    return false;
  }
}

void drag(Liquid l) {
 
    float speed = velocity.mag();

    float dragMagnitude = l.c * speed * speed;
 
    PVector drag = velocity.get();
    drag.mult(-1);

    drag.normalize();

    drag.mult(dragMagnitude);

    applyForce(drag);
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
  
   void applyForce (PVector force) {
    PVector f = force;
    f.div(mass); 
    this.acceleration.add(f);
  }
}
