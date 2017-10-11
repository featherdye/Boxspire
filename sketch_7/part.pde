class Particle {
  Body body;
  float x;
  float y;
  //float xspeed;
  //float yspeed;
  float size;
  
  Particle(float s) {
    x = mouseX/t;
    y = mouseY/t;
    size = s;
    makeBody(new Vec2(x,y),size,size);
  }
  
  void display() {
    stroke(0);
    //fill(random (0,255),random (0,255),random (0,255));
    
    Vec2 pos = box2d.getBodyPixelCoord(body);
    
    float a = body.getAngle();
     pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    rectMode(CENTER);
    colorMode(HSB);
    fill(255-(2.4*size),255-(2.4*size),255-(2.4*size));
    noStroke();
    rect(0,0,size,size);
    popMatrix();
}

 void makeBody(Vec2 center, float w_, float h_) {

    // Define a polygon (this is what we use for a rectangle)
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);

    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    // Parameters that affect physics
    fd.density = 999999999;
    fd.friction = 1;
    fd.restitution = 0;

    // Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.bullet = true;
    bd.linearDamping = 1;
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));

    body = box2d.createBody(bd);
    body.createFixture(fd);
    //body.setMassFromShapes();

    // Give it some initial random velocity
    //body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    //body.setAngularVelocity(random(-5, 5));
  }


}