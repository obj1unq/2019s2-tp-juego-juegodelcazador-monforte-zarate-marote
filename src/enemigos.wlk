import personaje.*
import armas.*
import wollok.game.*
import cosasExtras.*
import protecciones.*
import direcciones.*
import wollok.game.*

class Enemigo inherits Colisionable {
	var hp
	var property position 
	var property orientacion = derecha
 	 
    method hp() = hp

	method muere() { 
		hp = 0
		game.schedule(100, game.say(self, "RIP"))
	    self.desaparecer()
	}
	
	method recibirAtaqueCon(arma)	
	
	method estaVivo() = hp > 0
	
	method desaparecer() {
		game.removeVisual(self)
	}

    method atacar() { 
    	cazador.recibirAtaque(self)
    }
    
    method crear(posicion, imagen) {
		// Genera un enemigo en el tablero.
		game.addVisualIn(self, posicion)	
	}
	
	method colisionarCon(sal) {}
	
	method colisionandoCon(objeto) { }
	
///----------------------------------------------------------
///---------------------- MOVIMIENTO ------------------------
///----------------------------------------------------------
	
	method mover(nuevaPosicion, dir) {
		// Puede mover si no hay un obj no colisionable en direccion dir
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
    
    override method recibirAtaqueCon(arma){
    	hp -= arma.danio()
    }
       
}
	
class Bruja inherits Enemigo{ 
	const property image = "bruja.png" 
	const property atk = 2
    override method recibirAtaqueCon(arma){
    	hp -= arma.danio()
    }
	
}

class Fantasma inherits Enemigo{
	const property image = "fantasmaDerecha.png"
	const property atk = 1
	
	override method recibirAtaqueCon(objeto) {}
	
	override method colisionandoCon(objeto) {
	    objeto.colisionandoCon(self)   
	}
	
	override method colisionarCon(sal) {
	   self.desaparecer()
	}
	
	method patrullar(){
		game.onTick(600, "fantasmaMoving", { => self.mover(orientacion.posicionAl(self), orientacion) })	
	}
}

object fantasmaBoss inherits Enemigo {
	const property image = "fantasma2.png"
	const property atk = 3
	const property cantSalQueAfecta = 5
	
	override method recibirAtaqueCon(objeto) {
		//if(objeto.puedeMatarFantasma()) {
		   self.muere() 
	   //}else{
	   	   self.atacar()
	  // }
	}

}


class Murcielago inherits Enemigo{
	const property image = "murcielago.png"
	const property atk = 1

    override method hp() = 1
    
  override method recibirAtaqueCon(arma){
    	hp -= arma.danio()
    }
    
    method patrullar(){
		game.onTick(500, "murcielagoMoving", { => self.mover(orientacion.posicionAl(self), orientacion) })	
	}	
}

