import wollok.game.*


class Direccion {
	var property imagen = self.imagenDelPersonaje()
	method posicionAl(jugador)  //Usado para comprobar los objetos que existen en esa direccion (relativa al jugador)
	method imagenDelPersonaje()	//Usado junto con el metodo personaje.puedeMoverAl(dir)
}

object izquierda inherits Direccion { 

	override method imagenDelPersonaje() = "cazadorLeft.png"

	override method posicionAl(jugador) = jugador.position().left(1)
	
	method opuesto() = derecha
}

object derecha inherits Direccion { 
	
	override method imagenDelPersonaje()= "cazadorRight.png" 

	override method posicionAl(jugador) = jugador.position().right(1)

	method opuesto() = izquierda
}

object abajo inherits Direccion { 
	
	override method imagenDelPersonaje()= "cazadorDown.png"

	override method posicionAl(jugador) = jugador.position().down(1)
	
	method opuesto() = arriba
}

object arriba inherits Direccion { 
	
	override method imagenDelPersonaje()= "cazadorUp.png"
	
	override method posicionAl(jugador) = jugador.position().up(1)
	
	method opuesto() = abajo
}
 