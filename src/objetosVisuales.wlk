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
}

class Pared inherits NoColisionable {
	const property position
	var property image
	
    override method crear(posicion,imagen) {	
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

object encabezadoInventario{
	var property image = "encabezado.png" 
	var property position = (-1 -> 15)
}

object encabezadoVidas{
	var property image = "encabezado.png" 
	var property position = (-1 -> 14)
}

object suelo {
	const property position = 0
	var property image
	
    method crear(posicion,imagen) {	
		//parametros respetan polimorfismo
		image = imagen
		game.addVisualIn(self, posicion)
	}
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

// OBJETOS DE MENU

object iniciarJuego {
	const property position = game.at(2,4)
	const property image = "jugar.png"	
}

object salirJuego {
	const property position = game.at(2,2)
	const property image = "botonSalir.png"	
}

object teclaDown {
	const property position = game.at(2,3)
    var property image = "teclaDown.png"
}

object teclaUp {
	const property position = game.at(2,4)
    var property image = "teclaUp.png"
}

object teclaLeft {
	const property position = game.at(1,3)
    var property image = "teclaLeft.png"
}

object teclaRight {
	const property position = game.at(3,3)
    var property image = "teclaRight.png"
}

object tecla1 {
	const property position = game.at(1,10)
    var property image = "tecla1.png"
}

object tecla2 {
	const property position = game.at(2,10)
    var property image = "tecla2.png"
}

object tecla3 {
	const property position = game.at(3,10)
    var property image = "tecla3.png"
}

object teclaA {
	const property position = game.at(2,14)
    var property image = "teclaA.png"
}

object teclaR {
	const property position = game.at(2,12)
    var property image = "teclaR.png"
}

object teclaT {
	const property position = game.at(2,6)
    var property image = "teclaT.png"
}

object teclaSpace {
	const property position = game.at(1,8)
    var property image = "teclaSpace.png"
}

object movimientos {
	const property position = game.at(6,3)
    var property image = "movimientos.jpg"
}

object recoger {
	const property position = game.at(6,12)
    var property image = "recoger.jpg"
}

object equipar {
	const property position = game.at(6,10)
    var property image = "equipar.jpg"
}

object atacar {
	const property position = game.at(6,14)
    var property image = "atacar.jpg"
}

object arrojar {
	const property position = game.at(6,6)
    var property image = "arrojar.jpg"
}


object gameOver {
    const property position = game.at(8,6)
	const property image = "gameOver.png"	
}

object youWin {
    const property position = game.at(8,6)
	const property image = "youWin.png"	
}

