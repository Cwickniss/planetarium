// Gravitational Attraction (3D) 
// Daniel Shiffman <http://www.shiffman.net>

// A class for an orbiting Planet

class Planet {
  
  // Basic physics model (location, velocity, acceleration, mass)
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  PShape sphere;

  Planet(float m, float x, float y, float z) {
    mass = m;
    location = new PVector(x,y,z);
    velocity = new PVector(1,0);   // Arbitrary starting velocity
    acceleration = new PVector(0,0);    
    sphere = createShape(SPHERE, mass*8);
    sphere.setStroke(false);
    sphere.setFill(color(255));
  }
  
  // Newton's 2nd Law (F = M*A) applied
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }

  // Our motion algorithm (aka Euler Integration)
  void update() {
    velocity.add(acceleration); // Velocity changes according to acceleration
    location.add(velocity);     // Location changes according to velocity
    acceleration.mult(0);
  }

  // Draw the Planet
  void display() {
    pushMatrix();
    translate(location.x,location.y,location.z);
    shape(sphere);
    popMatrix();
  }
}
