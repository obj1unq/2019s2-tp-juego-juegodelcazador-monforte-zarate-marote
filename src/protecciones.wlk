import wollok.game.*
import personaje.*
import cosasExtras.*
import enemigos.*

class Proteccion inherits Colisionable{
	const property position

    method colisionarCon(cazador) { 
		game.removeVisual(self)
	}
	
	override method sePuedeAgarrar() = true
}

class Ajo inherits Proteccion {
	const property image = "ajo.png" 
	
	method tiempoQueProteje(){
		return 10
	}
}
const ajo = new Ajo()


class Vida inherits Proteccion {
	const property image = "hp.png"	
}
const vida = new Vida()