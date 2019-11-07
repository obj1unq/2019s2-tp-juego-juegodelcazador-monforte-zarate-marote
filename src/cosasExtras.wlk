import cazador.*
import wollok.game.*

class NoColisionable {
	const puedeColisionar = false
}

class Colisionable {
	const puedeColisionar = true
}

object castillo inherits NoColisionable {
	const property image = "castillo.gif"
	const property position = 0
}

class Pared inherits NoColisionable {
	const property position
	var property image 
	
	method mover(direccion) {
		throw new Exception(message = "No puedes mover las paredes.")
	}
	
	method crear(posicion) {
		// Genera un pared en el tablero.
		game.addVisualIn(self, posicion)	
	}
}