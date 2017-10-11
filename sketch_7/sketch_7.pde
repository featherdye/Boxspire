import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
ArrayList<Particle> particles;
ArrayList<Boundary> boundaries;
float d=100,b,c,a=100;
int t=1;

void setup() {
  size(1000,1000); 
  smooth();
  box2d = new Box2DProcessing(this);
  boundaries = new ArrayList<Boundary>();
  box2d.createWorld();
  box2d.setGravity(4, -10);
  particles = new ArrayList<Particle>(); 
  boundaries = new ArrayList<Boundary>();
  boundaries.add(new Boundary(width,height/2,20,1000));
  boundaries.add(new Boundary(width/2,height,1000,40));
  boundaries.add(new Boundary(0,height/2,20,1000));
  //scale(.3);
}

void draw() {
  
  scale(t);
  background(225);
  noStroke();
  box2d.step();
  colorMode(HSB);
  fill(255-(2.4*d),255-(2.4*d),255-(2.4*d));
  rect(mouseX/t,mouseY/t,d,d);
  for (int i = 0; i < particles.size(); i++ ) { 
    Particle p = (Particle) particles.get(i);
    p.display();
  }
  
 text("Click mouse to add boxes.",10,height-10);
 
}