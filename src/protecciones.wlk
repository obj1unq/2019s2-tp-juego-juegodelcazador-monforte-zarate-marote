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

class Vida inherits Proteccion {
	const property image = "hp.png"	

	override method esVida() = true
	override method sePuedeAgarrar() = true
}