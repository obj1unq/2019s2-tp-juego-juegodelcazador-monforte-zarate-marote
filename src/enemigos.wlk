import cazador.*
import armas.*
import wollok.game.*
import cosasExtras.*
import protecciones.*

class Enemigo inherits NoColisionable {
	var hp
	//var property imagen = orientacion.imagenDelPersonaje()
	var property position 
	//var property orientacion = derecha
 	 
    method hp() = hp

	method muere() { 
		return hp == 0
	}
	
	method recibirAtaqueCon(arma) {	
		arma.dispararA(self)
		hp = hp - arma.danio()
		self.estaVivo()
		self.desaparecer()		
	}
	
	method estaVivo() = hp > 0
	
	method desaparecer() {
		game.removeVisual(self)
	}

    method atacar() { 
    	cazador.recibirAtaque(self)
    }
}

object dracula inherits Enemigo{ 
    const property image = "dracula.png"
	const property atk = 4
		
	override method hp() = 10	
		
    method irA(nuevaPosicion) { 
    	//modificar
    }
    
    method malherido() {
    	return hp == 1
    }
}
	
class Bruja inherits Enemigo{ 
	const property image = "bruja.png" 
	const property atk = 2

    override method hp() = 5
    
	//method irA(nuevaPosicion) { position = nuevaPosicion } 
}

class Fantasma inherits Enemigo{
	const property image = "fantasmaDerecha.png"
	var sal = new Sal()
	const property atk = 1
	
	override method hp() = 1
	
	override method recibirAtaqueCon(arma) {   //esto creo que hiria mejor para el vampiro o murcielago, no tanto con los fantasmas
		if(arma == sal and cazador.cantDe(arma) == 1) 
		   self.muere()
	}
	
	method patrullar(){
		game.onTick(300, "fantasmaMoving", { => self.position().right(1) })	
	}
}

class Murcielago inherits Enemigo{
	const property image = "murcielago.png"
	const property atk = 1

    override method hp() = 1
    
  //method irA(nuevaPosicion) { position = nuevaPosicion } 	
}

