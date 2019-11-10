import wollok.game.*
import cazador.*
import cosasExtras.*
import enemigos.*


class Proteccion inherits Colisionable{
	const property position

    method colisionarCon(cazador) { 
		game.removeVisual(self)
	}
}

class Ajo inherits Proteccion {
	const property image = "ajo.png" 
	
	method tiempoQueProteje(){
		return 10
	}
}


class Vida inherits Proteccion {
	const property image = "hp.png"	
}