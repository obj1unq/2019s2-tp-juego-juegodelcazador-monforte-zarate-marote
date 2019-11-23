import wollok.game.*
import personaje.*
import cosasExtras.*
import enemigos.*


class Proteccion inherits Colisionable{
	const property position

    method colisionarCon(cazador) { 
	//	cazador.recoger(self)
	}
	override method sePuedeAgarrar() = true
	
	
}

class Ajo inherits Proteccion {
	const property image = "ajo.png" 
	
	method tiempoQueProteje(){
		return 10
	}
	override method sePuedeAgarrar() = true
}
const ajo = new Ajo()
