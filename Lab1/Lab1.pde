int nbBalles = 50;
Ballon ballon;
Balle[] balles;
Liquid liquid;
void setup()
{
  size (800, 600);
  balles = new Balle[nbBalles];
  ballon = new Ballon(6,400,300);
  
  for (int i = 0; i < balles.length; i++) {
    balles[i] = new Balle(random(1,5),0,0);
  }
   liquid = new Liquid(0, 300, width, random(0.1*height,0.4*height), random(1.5,3));
}

void draw () {

        
 updateballon();
 updateballe();
 
 background (255);
 
 for (int i = 0; i < balles.length; i++) {
    
    balles[i].display();
  }
 
  ballon.display();
  liquid.display();
}

void updateballon()
{
  
    float m = ballon.mass;
    
    PVector helium = new PVector (0, -0.05 * m);

   
   
   ballon.applyForce(helium);
   ballon.applyForce(getfriction(ballon.velocity.get())); 
   ballon.update();
   ballon.checkEdges();
  
}

void updateballe()
{
    for (int i = 0; i < balles.length; i++) {
     
        if (balles[i].isInside(liquid)) {
          balles[i].drag(liquid);
        }
     
        float m = balles[i].mass;

        PVector gravity = new PVector(0, 0.1*m);
        balles[i].applyForce(gravity);
        balles[i].applyForce(getfriction(balles[i].velocity.get())); 
        balles[i].update();
        
        balles[i].display();
        balles[i].checkEdges();
      }
  
}

PVector getfriction(PVector velocity)
{
   float c = 0.10;
   PVector friction = velocity;
   friction.mult(-1);
   friction.normalize();
   friction.mult(c);
   
   return friction;
}
