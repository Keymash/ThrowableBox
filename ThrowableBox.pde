float defBox = 50;
Box box;
float gravity = 0.1f;

void setup()
{
  size(500, 500);
  background(0);
  stroke(255);
  box = new Box(width/2, height/2);
}

void mousePressed()
{
  box.clickCheck();
}

void mouseReleased()
{
  if (box.dragging)
  {
    box.dragging = false;
    box.AddForce(new PVector(mouseX - pmouseX, mouseY - pmouseY).mult(5));
  }
}

void draw()
{
  background(0);
  stroke(255);
  fill(255);
  box.show();
}
