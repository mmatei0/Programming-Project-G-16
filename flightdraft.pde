Table table;

void setup()
{
  size(1200, 700);
  table = loadTable("flights2k.csv", "header");
  println(table.getString(4, 9));
  
}


void draw()
{
  background(255);
  fill(0);
  for (int d=1; d < table.getRowCount(); d++)
  {
    text(table.getString(d,4), 100, 25+ d*30);
  }


}
