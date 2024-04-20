class Player extends Animacion{
  int vida,estado,timer;
  boolean enPlataforma,enPiso;
  PImage[] irDer, irIzq,saltoDer,saltoIzq;
  ArrayList<Sprite> sombra;
  Player(PImage imagen){
    super(imagen);
    sombra = new ArrayList<Sprite>();
    vida = 3;
    timer = 0;
    direccion = derecha;
    enPlataforma = false;
    enPiso = false;
    irDer = new PImage[2];
    irIzq = new PImage[2];
    moverDer = new PImage[8];
    moverIzq = new PImage[8];
    saltoDer = new PImage[1];
    saltoIzq = new PImage[1];
    cargarEstado();
    actual = saltoDer;
  }
  void mostrarSombra(){
    if(timer < 30){
      tint(120,100);
      if(frameCount % 4== 0){
        sombra.add(0,new Sprite(img,center.x,center.y));
        timer++;
      }
      if(sombra.size()>5)
      sombra.remove((sombra.size()-1));
      
      for(Sprite g: sombra)
         g.mostrar();
       noTint();
    }
    else{
      if(sombra.size()>0)
         sombra.removeAll(sombra);
    }
  }
  void cargarEstado(){
    timer = 0;
    if(estado == 0){
      saltoDer[0] = personaje[2];
      saltoIzq[0] = personaje[26];
      irIzq[0] = personaje[24];
      irIzq[1] = personaje[25];
      irDer[0] = personaje[0];
      irDer[1] = personaje[1];
      moverDer[0] = personaje[4];
      moverDer[1] = personaje[5];
      moverDer[2] = personaje[6];
      moverDer[3] = personaje[7];
      moverDer[4] = personaje[8];
      moverDer[5] = personaje[9];
      moverDer[6] = personaje[10];
      moverDer[7] = personaje[11];
      moverIzq[0] = personaje[28];
      moverIzq[1] = personaje[29];
      moverIzq[2] = personaje[30];
      moverIzq[3] = personaje[31];
      moverIzq[4] = personaje[32];
      moverIzq[5] = personaje[33];
      moverIzq[6] = personaje[34];
      moverIzq[7] = personaje[35];
    }
  }
  @Override
  void actualizar(){
    enPlataforma = estaEnPlataforma(this,plataforma);
    enPiso = cambio.x == 0 && cambio.y == 0;
    super.actualizar();
  }
  @Override
  void seleccionarDireccion(){
    if(cambio.x > 0)
       direccion = derecha;
    else if(cambio.x < 0)
       direccion= izquierda;
  }
  @Override
  void seleccionarImagenActual(){
    if(direccion == derecha){
      if(enPiso)
        actual = irDer;
      else if(!enPlataforma)
        actual = saltoDer;
      else
        actual = moverDer;
    }
    if(direccion == izquierda){
      if(enPiso)
        actual = irIzq;
      else if(!enPlataforma)
        actual = saltoIzq;
      else
        actual = moverIzq;
    }
  }
}
