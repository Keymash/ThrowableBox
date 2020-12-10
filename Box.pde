class Box
{
  PVector pos;
  PVector dim;
  boolean dragging;
  PVector offset;
  PVector vel;
  PVector acc;

  Box(float x, float y, float dimx, float dimy)
  {
    pos = new PVector(x, y);
    dim = new PVector(dimx, dimy);
    dragging = false;
    offset = new PVector(0, 0);
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
  }

  Box(float x, float y)
  {
    pos = new PVector(x, y);
    dim = new PVector(defBox, defBox);
    dragging = false;
    offset = new PVector(0, 0);
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
  }

  void show()
  {
    if (dragging)
    {
      pos = new PVector(mouseX - offset.x, mouseY - offset.y);
      vel.mult(0);
    } else
    {
      acc.y += gravity;
      vel.add(acc);
      pos.add(vel);
    }
    acc.mult(0);
    boundaryCheck();
    fill(255);
    rect(pos.x, pos.y, dim.x, dim.y);
  }

  void clickCheck()
  {
    if (mouseX > pos.x && mouseX < pos.x + dim.x)
    {
      if (mouseY > pos.y && mouseY < pos.y + dim.y)
      {
        dragging = true;
        offset = new PVector(mouseX - pos.x, mouseY - pos.y);
      }
    }
  }
  
  void AddForce(PVector force)
  {
    acc.add(force);
  }

  void boundaryCheck()
  {
    if (pos.x < 0) {
      pos.x = 0;
      vel.x *= -0.5f;
    }
    if (pos.x + dim.x > width) {
      pos.x = width - dim.x;
      vel.x *= -0.5f;
    }
    if (pos.y < 0) {
      pos.y = 0;
      vel.y *= -0.4f;
    }
    if (pos.y + dim.y > height) {
      pos.y = height - dim.y;
      vel.y *= -0.4f;
      vel.x *= 0.99f;
      if (abs(vel.x) < 0.2f)
      {
        vel.x = 0;
      }
    }
  }
}
