import cazador.*
import cosasExtras.*
import enemigos.*
import wollok.game.*

class Arma inherits Colisionable {
	
	var property position
    
    method colisionarCon(cazador) { 
		game.removeVisual(self)
	}
}

object estacaYMartillo inherits Arma {
	const property image = "estacaYMartillo.png" 
    var property danio = 1
    
    var property id = 2
  /*   override method esUsadaCon(enemigo){ 
        if (dracula.malherido())
    	   cazador.atacarACon(dracula, self) 
    }*/
}

class ArmaADistancia inherits Arma{
	var property municiones = 1
	
	method agregar(municion) {
		if (municion.esColisionable())
		    municiones = (municiones + municion.cant()).min(15)
	}
	
	method dispararA(enemigo) {
		if (municiones > 0) {
			self.esUsadaCon(enemigo)
			municiones -= 1
		}else{game.say(cazador,"¡No tengo mas municiones!")}
	}
}

object ballesta inherits ArmaADistancia {
	const property image = "ballesta.png" 
	var property danio = 2	
	var alcance = 5
	var property id = 1
	
	method municionQueUsa() = cazador.cantFlechas()
}

object pistolaDePlata inherits ArmaADistancia {
	const property image = "armaPlata.png" 
	var property danio = 4
	var alcance = 8   
	
	var property id = 3
}

class Sal inherits Proyectil {
	var property image = "sal.png"
	var alcance = 1
	var property id = 4
	method imagenDeProyectil(){
		image = "salExplosion.png"
	}
	
}
const sal = new Sal()

class Proyectil inherits Municion{
	
	var property orientacion = cazador.orientacion()
	//var alcance
	
	/*method crearProyectil(arma) {
	//new Proyectil (position = cazador.position(), alcance = arma.alcance())
	}
	
	method buscaObjetivo(){
		game.onTick(100, "Proyectil avanzando", { => arma.tipoDeMunicion().mover(orientacion.posicionAl(cazador), orientacion)})
			
	}
	
	method mover(nuevaPosicion, dir) {
		
		orientacion = dir
		if (self.puedeMoverAl(dir) and self.elProyectilLlega()) {
			self.position(nuevaPosicion)
			arma.tipoDeMunicion().imagenDeProyectil()
			game.addVisualIn(self, nuevaPosicion)
			alcance -= 1		
		}else{
			
		}
	}
	
	
	
	method elProyectilLlega() = (alcance != 0)
	
	method puedeMoverAl(dir) {
		// Puede mover si no hay ningun obj en direccion dir o si el obj es colisionable
		// Todos los obj entienden el mensaje esColisionable()
	
		return game.getObjectsIn(dir.posicionAl(self)).isEmpty() or
		      game.getObjectsIn(dir.posicionAl(self)).all{ obj => obj.esColisionable() }
	}
	
	*/
} 


class Municion inherits ArmaADistancia{
	
	method esUsadaEn(arma) {
    	arma.dispararConMunicion()  	
    }
	
}

class Balas inherits Proyectil {
	var property image = "balas.png"
	const property cant = 5
	
	method imagenDeProyectil(){
		image = "imagenDeBalaVolando.png"
	}
	
	
}

class Flechas inherits Proyectil {
	var property image = "flechas.png"
	const property cant = 3
	
	method imagenDeProyectil(){
		image = "imagenDeFlechaVolando.png"
	}
}
