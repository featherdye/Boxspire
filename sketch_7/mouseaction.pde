void mousePressed()
{
  particles.add(new Particle(d)); 
}

void mouseWheel(MouseEvent event) {
  b = event.getCount();
  c=b+c;
  if(c>0)
  {d=a/c;}
  println("d");
 }
 
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      //translate();
      t++;
      
    } else if (keyCode == DOWN && t>1) {
      t--;
    } 
  } else {
    t=1;
  }
}