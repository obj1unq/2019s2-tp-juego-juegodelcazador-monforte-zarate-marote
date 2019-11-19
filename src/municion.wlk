import personaje.*
import cosasExtras.*
import enemigos.*
import wollok.game.*
import armas.*

class Municion inherits ArmaADistancia{
	
	method esUsadaEn(arma) {
    	arma.dispararConMunicion()  	
    }
    
	override method esMunicion() = true
	
	override method sePuedeAgarrar() = true
	
	method esBala() = false
	method esFlecha() = false
	
	method colisionasteCon(fantasma) {}
}

class Proyectil inherits Municion{
	var property orientacion = cazador.orientacion()
	var property cant = 1
	
	var alcance = self.alcance()
	method alcance()

	method crear(posicion) {
		return game.addVisualIn(self, posicion)
	}
	
		method mover(nuevaPosicion, dir) {
		// Puede mover si no hay un obj no colisionable en direccion dir
		orientacion = dir
		if (self.elProyectilTieneAlcance() and self.puedeMoverAl(dir)) {
			self.position(nuevaPosicion)
		}else{orientacion = orientacion.opuesto()}
	}

	method puedeMoverAl(dir) {
		// Puede mover si no hay ningun obj en direccion dir o si el obj es colisionable
		// Todos los obj entienden el mensaje esColisionable()
		return game.getObjectsIn(dir.posicionAl(self)).isEmpty() or 
			  game.getObjectsIn(dir.posicionAl(self)).all{ obj => obj.esColisionable() }
	
	}
	
	method elProyectilTieneAlcance() = (alcance > 0)
	
} 

class Sal inherits Proyectil {
	var property image = "sal.png"
	
	override method alcance() = 1
	
	override method puedeSoltarse() = true
	
	override method esArrojado() {
	   game.addVisualIn(self, cazador.position())	
	}
	
	override method esSal() = true 
	
	override method nombre() = "sal"
	
}


class Bala inherits Proyectil {
	
	method image() = orientacion.imagenDelPersonaje(self.nombre())
	
	override method nombre() = "bala"
	
	override method alcance() = 6
	
	override method esBala() = true
	
}

class Flecha inherits Proyectil {
	
	method image() = orientacion.imagenDelPersonaje(self.nombre())
	
	override method nombre() = "flecha"
	
	override method alcance() = 4
	
	override method esFlecha() = true
	
}