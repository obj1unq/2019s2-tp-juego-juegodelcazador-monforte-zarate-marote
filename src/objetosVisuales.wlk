import wollok.game.*
import cosasExtras.*
import enemigos.*
import niveles.*

object castillo inherits NoColisionable {
	const property image = "castillo.png"
	const property position = 0
}

object puerta inherits Colisionable {
    var property image = "puerta.png"
	const property position = 0

    method colisionarCon(cazador) {}

    override method colisionasteCon(cazador, nivel) { 
		self.cambioDeEscenario(nivel)
	}
	
	method cambioDeEscenario(nivel) {
		game.schedule(2000, { nivel.cargar()})
	}
	
	method crear(posicion,imagen) {	
		// Genera una puerta en el tablero.
		image = imagen
		game.addVisualIn(self, posicion)
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

object encabezado{
	var property image = "encabezado.png" 
	var property position = (-1 -> 15)

}

// OBJETOS DE MENU

object iniciarJuego {
	const property position = game.at(2,4)
	const property image = "jugar.png"	
}

object configuracion {
    const property position = game.at(2,3)
    const property image = "botonConfig.png"	
}

object salirJuego {
	const property position = game.at(2,2)
	const property image = "botonSalir.png"	
}

object cargaDelJuego {
    const property image = "cargando2.png"	
}

object volverAlMenu {
	const property position = game.at(17,1)
    const property image = "volverAlMenu.png"	
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
    const property position = game.at(8,6)
	const property image = "gameOver.png"	
}

object vidasDeJuego {
	var property contador = 3

    method descontar() { 
    	contador -= 1
    }
    
    method sumar() {
        contador +=1	
    }
    
}