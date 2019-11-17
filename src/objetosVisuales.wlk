import wollok.game.*
import cosasExtras.*
import enemigos.*

object castillo inherits NoColisionable {
	const property image = "castillo.png"
	const property position = 0
}

object puerta inherits Colisionable {
    const property image = "puerta.png"
	const property position = 0

    method colisionarCon(cazador) { 
		//implementar
	}
}

class Pared inherits NoColisionable {
	const property position
	var property image
	
    method crear(posicion,imagen) {	
		// Genera una pared en el tablero.
		image = imagen
		game.addVisualIn(self, posicion)
	}
}

class Trampa inherits Colisionable {
	const property position
	var property image = "camino1.png"
	
	method colisionarCon(cazador) {
		return self.activarBossFinal()
	}
	
	method activarBossFinal() {
		return game.addVisualIn(fantasmaBoss, game.at(11,10))
	}
}

// OBJETOS DE MENU

object iniciarJuego {
	const property position = game.at(2,4)
	const property image = "iniciarJuego.png"	
}

object configuracion {
    const property position = game.at(2,3)
    const property image = "configuracion.png"	
}

object salirJuego {
	const property position = game.at(2,2)
	const property image = "salirJuego.png"	
}

object cargaDelJuego {
    const property image = "cargando2.png"	
}

object teclaDown {
	const property position = game.at(3,11)
    var property image = "teclaDown.png"
}

object teclaUp {
	const property position = game.at(3,12)
    var property image = "teclaUp.png"
}

object teclaLeft {
	const property position = game.at(2,11)
    var property image = "teclaLeft.png"
}

object teclaRight {
	const property position = game.at(4,11)
    var property image = "teclaRight.png"
}

object tecla1 {
	const property position = game.at(2,9)
    var property image = "tecla1.png"
}

object tecla2 {
	const property position = game.at(3,9)
    var property image = "tecla2.png"
}

object tecla3 {
	const property position = game.at(4,9)
    var property image = "tecla3.png"
}

object tecla4 {
	const property position = game.at(5,9)
    var property image = "tecla4.png"
}

object teclaR {
	const property position = game.at(3,7)
    var property image = "teclaR.png"
}

object teclaE {
	const property position = game.at(3,5)
    var property image = "teclaE.png"
}

object teclaS {
	const property position = game.at(3,3)
    var property image = "teclaS.png"
}

object teclaA {
	const property position = game.at(3,1)
    var property image = "teclaA.png"
}

object gameOver {
    const property position = game.at(11,8)
	const property image = "gameOver.png"	
}