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
		hp = 0
	}
	
	method recibirAtaqueCon(objeto) {	
		//objeto.dispararA(self)
		hp = hp - objeto.danio()
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
    
    method crear(posicion) {
		// Genera un pared en el tablero.
		game.addVisualIn(self, posicion)	
	}
}

object dracula inherits Enemigo{ 
    const property image = "dracula.png"
	const property atk = 4
		
	override method hp() = 10	
		
    //method moverse(nuevaPosicion) {}
    
    method malherido() {
    	return hp == 1
    }
}
	
class Bruja inherits Enemigo{ 
	const property image = "bruja.png" 
	const property atk = 2

    override method hp() = 5
    
	//method moverse(nuevaPosicion) {}
}

class Fantasma inherits Enemigo{
	const property image = "fantasma.png"
	const property atk = 1
	
	override method hp() = 1
	
	override method recibirAtaqueCon(objeto) {
		if(objeto == sal) {
		   self.muere() 
	   }else{
	   	   self.atacar()
	   }
	}
	
	//method moverse(nuevaPosicion) {}
	
	method patrullar(){
		game.onTick(300, "fantasmaMoving", { => cazador.position().y(0.randomUpTo(2)) })	
	}
}

object fantasmaBoss inherits Enemigo {
	const property image = "fantasma2.png"
	const property atk = 3
	const property cantSalQueAfecta = 5
	
	override method recibirAtaqueCon(objeto) {
		if(objeto == sal) {
		   self.muere() 
	   }else{
	   	   self.atacar()
	   }
	}
}


class Murcielago inherits Enemigo{
	const property image = "murcielago.png"
	const property atk = 1

    override method hp() = 1
    
  //method moverse(nuevaPosicion) {} 	
}
const murcielago = new Murcielago()

