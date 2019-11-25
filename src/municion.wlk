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

	var alcance = self.alcance()
	method alcance()
	method dmg()
	
	method crear(dir) {
		 game.addVisual(self)
	}
	
	 
	 method trayectoria(municion, pos, dir){
	 	orientacion = dir
	 	municion.crear(dir)
	 	game.onTick(100, "trayectoria", {
	 		municion.mover(dir.posicionAl(self),dir)
	 		municion.impactar()
	 	})
	 }
	 
	 method impactar(){
	 	if(!self.obtenerObjetoDelLugar(self).isEmpty() and self.obtenerObjetoDelLugar(self).first().esEnemigo())
	 		self.obtenerObjetoDelLugar(self).first().recibirAtaque(self.dmg())
	 }
	 
	method mover(nuevaPosicion,dir) {
		// Puede mover si no hay un obj no colisionable en direccion dir
		
		if (self.elProyectilTieneAlcance() and self.puedeMoverAl(dir)) {
			self.position(nuevaPosicion)
			alcance--
		}else{
			self.desaparecer()
			game.removeTickEvent("trayectoria")
		}
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
	
	method cant() = 1
	
	override method dmg(){}
	
	override method alcance() = 1
	
	override method esArrojado() {
	   game.addVisualIn(self, cazador.position())	
	}
	
	override method esSal() = true 
	
	override method nombre() = "sal"
	
}


class Bala inherits Proyectil {
	var tipo
	
	method image() = tipo.image()
	
	override method nombre() = "bala"
	
	override method alcance() = 6
	
	override method esBala() = true
	
	override method dmg() = 4
}

class Flecha inherits Proyectil {
	var tipo
	
	method image() = tipo.image()
	
	override method nombre() = "flecha"
	
	override method alcance() = 4
	
	override method esFlecha() = true
	
	override method dmg() = 2
}
// estas son de proyectil

object flecha inherits Flecha{
	
	override method image() = orientacion.imagenDelPersonaje(self.nombre())	
}

object bala inherits Bala{
	
	override method image() = orientacion.imagenDelPersonaje(self.nombre())
}

// estas son para el loot
object carcaj inherits Flecha{
	
	override method image() = "flechas.png"
}
object cargador inherits Bala{
	
	override method image() = "balas.png"
}

