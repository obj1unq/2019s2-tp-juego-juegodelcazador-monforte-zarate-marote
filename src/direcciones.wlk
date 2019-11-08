import wollok.game.*
class Direccion {
	var property imagen = self.imagenDelPersonaje()
	method posicionAl(jugador)  //Usado para comprobar los objetos que existen en esa direccion (relativa al jugador)
	method imagenDelPersonaje()	//Usado junto con el metodo personaje.puedeMoverAl(dir)
}

object izquierda inherits Direccion { 

override method imagenDelPersonaje() = "cazadorIzquierda.png"

override method posicionAl(jugador) = jugador.position().left(1)
}

object derecha inherits Direccion { 
	
override method imagenDelPersonaje()= "cazadorDerecha.png" 

	override method posicionAl(jugador) = jugador.position().right(1)
}

object abajo inherits Direccion { 
	
override method imagenDelPersonaje()= "cazadorAbajo.png" 

override method posicionAl(jugador) = jugador.position().down(1)
}

object arriba inherits Direccion { 
	
override method imagenDelPersonaje()= "cazadorArriba.png"
	override method posicionAl(jugador) = jugador.position().up(1)
}