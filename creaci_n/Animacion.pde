class Animacion extends Sprite{
  PImage[] actual, quieto, moverIzq, moverDer;
  int direccion, index, frame;
  Animacion(PImage img){
    super(img,0);
    direccion = normal;
    index = 0;
    frame = 0;
  }
  void actualizar(){
    frame++;
    if (frame % 8 == 0){
      seleccionarDireccion();
      seleccionarImagenActual();
      AvanzaImagen();
    }
  }
  void seleccionarDireccion(){
    if(cambio.x > 0)
      direccion = derecha;
    else if(cambio.x < 0)
      direccion = izquierda;
    else
    direccion = normal;
  }
  void seleccionarImagenActual(){
    if(direccion == izquierda)
       actual= moverIzq;
    else if(direccion == derecha)
       actual = moverDer;
    else
       actual = quieto;
  }
  void AvanzaImagen(){
    index++;
    if(index >= actual.length)
       index = 0;
     img = actual [index];  
  }
}
