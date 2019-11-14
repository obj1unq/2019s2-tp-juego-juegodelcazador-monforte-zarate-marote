import personaje.*
import cosasExtras.*
import enemigos.*
import wollok.game.*
import armas.*



class Municion inherits ArmaADistancia{
	
	method esUsadaEn(arma) {
    	arma.dispararConMunicion()  	
    }
    
    method crear(posicion) {
		game.addVisualIn(self, posicion)
	}
	
	override method esMunicion() = true
	
	
}


class Proyectil inherits Municion{
	
	var property orientacion = cazador.orientacion()
	var alcance = self.alcance()
	
	method alcance()
	

	method imagenDeProyectil(orient)

	method buscaObjetivo(pos, dir){
		game.addVisualIn(self, pos)
		game.onTick(100, "Proyectil avanzando", { self.mover(pos, dir)})		
	}
	
	method mover(nuevaPosicion, dir) {
		orientacion = dir
		if (self.puedeMoverAl(dir) and self.elProyectilTieneAlcance()) {
			self.position(nuevaPosicion)
			self.imagenDeProyectil("orientacion")
			alcance -= 1		
		}else{
		}
	}
	
	method elProyectilTieneAlcance() = (alcance != 0)
	
	method puedeMoverAl(dir) {
		// Puede mover si no hay ningun obj en direccion dir o si el obj es colisionable
		// Todos los obj entienden el mensaje esColisionable()
		return game.getObjectsIn(dir.posicionAl(self)).isEmpty() or
		      game.getObjectsIn(dir.posicionAl(self)).all{ obj => obj.esColisionable() }
	}
} 

class Sal inherits Proyectil {
	
	var property image = "sal.png"
	
	override method imagenDeProyectil(orient){
		image = orient+"salExplosion.png"
	}
	
	override method alcance() = 1
	
	override method puedeSoltarse() = true
	
	override method esArrojado() {
	   game.addVisualIn(self, cazador.position())	
	}
	
	override method colisionandoCon(fantasma) {
		fantasma.muere()
	}
	
	override method esSal() = true 
	
}

class Balas inherits Proyectil {
	var property image = "balas.png"
	const property cant = 5
	
	override method alcance() = 6
	
	override method imagenDeProyectil(orient){
		image = orient+"imagenDeBalaVolando.png"
	}
	override method esDisparablePor(arma) = arma == pistolaDePlata
	
}

class Flechas inherits Proyectil {
	var property image = "flechas.png"
	const property cant = 3
	
	override method alcance() = 4
	
	override method imagenDeProyectil(orient){
		image = orient+"imagenDeFlechaVolando.png"
	}
	override method esDisparablePor(arma) = arma == ballesta
}