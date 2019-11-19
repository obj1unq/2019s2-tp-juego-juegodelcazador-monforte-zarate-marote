import personaje.*
import armas.*
import wollok.game.*
import cosasExtras.*
import protecciones.*
import direcciones.*
import wollok.game.*
import municion.*

class Enemigo inherits Colisionable {
	var hp
	var property position 
	var property orientacion = derecha
 	 
 	override method puedeSoltarse() = false 
 	
 	override method esAtacable() = true
    
    method hp() = hp

	method muere() { 
		hp = 0
		game.schedule(100, game.say(self, "RIP"))
	    self.desaparecer()
	}
	
	method estaVivo() = hp > 0

    method recibirAtaqueCon(arma){
    	hp -= arma.danio()
    }
    
    method colisionasteCon(cazador) {
    	cazador.recibirAtaque(self.atk())
    }
    
    method atacar() {
    	
    }
    
    method crear(posicion, imagen) {
		// Genera un enemigo en el tablero.
		game.addVisualIn(self, posicion)	
	}
	
	method colisionandoCon(objeto) { 
		
	}
	
///---------------------- MOVIMIENTO ------------------------
	
	method mover(nuevaPosicion, dir) {
		// Puede mover si no hay un obj no colisionable en direccion dir
		orientacion = dir
		if (self.estaVivo() and self.puedeMoverAl(dir)) {
			self.position(nuevaPosicion)
		}else{orientacion = orientacion.opuesto()}
	}

	method puedeMoverAl(dir) {
		// Puede mover si no hay ningun obj en direccion dir o si el obj es colisionable
		// Todos los obj entienden el mensaje esColisionable()
		return game.getObjectsIn(dir.posicionAl(self)).isEmpty() or game.getObjectsIn(dir.posicionAl(self)).all{ obj => obj.esColisionable() }
	}
}

object dracula inherits Enemigo{ 
    const property image = "dracula.png"
	const property atk = 4	
	//posee 10 de vida
    
    method malherido() {
    	return hp == 1
    }
    override method hp() = 5   
    
    override method mover(nuevaPosicion, dir) {
		 position = game.at(cazador.position().x(),cazador.position().y())
	}
}
	
class Bruja inherits Enemigo{ 
	const property atk = 3
	const property image = "bruja.png" 
    override method recibirAtaqueCon(arma){
    	hp -= arma.danio()
    }
    
    method patrullar(){
		game.onTick(500, "brujaMoving", { => self.mover(orientacion.posicionAl(self), orientacion) })	
	}
	
	override method atacar() {}
}

class Fantasma inherits Enemigo{
	const property atk = 1
	method esSal() = false
	method image() = orientacion.imagenDelPersonaje(self.nombre())
	method nombre() = "fantasma"
	
	override method recibirAtaqueCon(objeto) {}
	
	method morirSiEsSal(){
	   if(game.getObjectsIn(self.position()).any({obj => obj.esSal()})){
	   self.desaparecer()
	   game.getObjectsIn(self.position()).find({obj => obj.esSal()}).desaparecer()
	   }else if(game.getObjectsIn(self.position()).any({obj => obj.esCazador()})){
		cazador.recibirAtaque(atk)
		}else{}
	}
	
	override method atacar() {}
	
	 override method mover(nuevaPosicion, dir){
		// Puede mover si no hay un obj no colisionable en direccion dir
		if (self.puedeMoverAl(dir)) {
			self.position(nuevaPosicion)
			self.morirSiEsSal()
		}else{orientacion = orientacion.opuesto()}
	}	
	
	method patrullar(){
		game.onTick(500, "fantasmaMoving", { => self.mover(orientacion.posicionAl(self), orientacion) })	
	}
}

object fantasmaBoss inherits Enemigo {
	const property image = "fantasma2.png"
	const property atk = 4
	
	override method recibirAtaqueCon(objeto) {
		//if(objeto.puedeMatarFantasma()) {
		   self.muere() 
	   //}else{
	   	   self.atacar()
	  // }
	}
	
	
	override method mover(nuevaPosicion, dir){
		position = game.at(cazador.position().x(),cazador.position().y())
		//self.morirSiHaySal()
	}	

}

class Murcielago inherits Enemigo{
	const property image = "murcielago.png"
	const property atk = 1

    override method hp() = 1
    
    method patrullar(){
		game.onTick(500, "murcielagoMoving", { => self.mover(orientacion.posicionAl(self), orientacion) })	
	}	
	
	override method atacar() {}
}

