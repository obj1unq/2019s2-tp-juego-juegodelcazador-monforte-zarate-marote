import wollok.game.*


class Direccion {
	method posicionAl(jugador)  //Usado para comprobar los objetos que existen en esa direccion (relativa al jugador)
	method imagenDelPersonaje(nombre)	//Usado junto con el metodo personaje.puedeMoverAl(dir)
}

object izquierda inherits Direccion { 

	override method imagenDelPersonaje(nombre) = nombre + "Left.png"

	override method posicionAl(jugador) = jugador.position().left(1)
	
	method opuesto() = derecha
}

object derecha inherits Direccion { 
	
	override method imagenDelPersonaje(nombre)= nombre + "Right.png" 

	override method posicionAl(jugador) = jugador.position().right(1)

	method opuesto() = izquierda
}

object abajo inherits Direccion { 
	
	override method imagenDelPersonaje(nombre)= nombre + "Down.png"

	override method posicionAl(jugador) = jugador.position().down(1)
	
	method opuesto() = arriba
	
}

object arriba inherits Direccion { 
	
	override method imagenDelPersonaje(nombre)= nombre + "Up.png"
	
	override method posicionAl(jugador) = jugador.position().up(1)
	
	method opuesto() = abajo
}
 