class Fondo{
  PImage mySprite[], bgFondo;
  float sizeSprite;
  Fondo(String name, String tilemap, float size){
    sizeSprite = size;
    mySprite = new LeerArchivo(8,5,tilemap).getHoja();
    plataforma = new ArrayList<Sprite>();
    
    bgFondo = loadImage("BG.png");
    crearPlataforma(name);
  }
  void mostrar(){
    image(bgFondo,view_x+width/2,height/2-130);
    
    for(Sprite p: plataforma)
       p.mostrar();
  }
  void crearPlataforma(String archivo){
    String[] lineas = loadStrings (archivo);
    for(int row = 0; row < lineas.length; row++){
      String[] valores = split (lineas[row],";");
      for(int col = 0; col < valores.length; col++){
        int num = obtenerNum(valores[col]);
        if(num < 13){
          Sprite s = new Sprite (mySprite[num],num);
          s.center.x = sizeSprite/2 + col * sizeSprite;
          s.center.y = sizeSprite/2 + row * sizeSprite;
          plataforma.add(s);
        }
        else if(num == 31){
          Sprite s = new Sprite (mySprite[13],num);
          s.center.x = sizeSprite/2 + col * sizeSprite;
          s.center.y = sizeSprite/2 + row * sizeSprite;
          plataforma.add(s);
        }
      }
    }
  }
  int obtenerNum(String txt){
    int num= 0;
    num= Integer.valueOf(txt);
    return num;
  }
}
