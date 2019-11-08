import cazador.*
import wollok.game.*

class NoColisionable {
	method esColisionable() = false
}

class Colisionable {
	method esColisionable() = true
}

object castillo inherits NoColisionable {
	const property image = "castillo.gif"
	const property position = 0
}

class Pared inherits NoColisionable {
	const property position
	const property image = "laberinto1.png"
	
	method mover(direccion) {
		throw new Exception(message = "No puedes mover las paredes.")
	}
	
	method crear(posicion) {
		// Genera un pared en el tablero.
		game.addVisualIn(self, posicion)    // poder usarlo en escenarios para crear	
	}
}