import cazador.*
import armas.*
import wollok.game.*
import cosasExtras.*
import protecciones.*

class Enemigo inherits NoColisionable {
	//var property imagen = orientacion.imagenDelPersonaje()
	var property hp //Posible cambio por diferentes valores de cada enemigo
	var property position 
	//var property orientacion = derecha
	const property atk //Posible cambio por diferentes valores de cada enemigo 
	
	method muere() { 
		return hp == 0
	}
	
	method recibirAtaqueCon(arma) {	
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
		
    method irA(nuevaPosicion) { 
    	//modificar
    }
    
    method malherido() {
    	return hp == 1
    }
}
	
class Bruja inherits Enemigo{ 
	const property image = "bruja.png" 

	//method irA(nuevaPosicion) { position = nuevaPosicion } 
}

class Fantasma inherits Enemigo{
	const property image = "fantasmaDerecha.png"
	var ajo = new Ajo()
	
	override method recibirAtaqueCon(arma) {   //esto creo que hiria mejor para el vampiro o murcielago, no tanto con los fantasmas
		if(arma == ajo and cazador.cantDe(arma) == 1) 
		   self.muere()
	}
	
	method patrullar(){
		game.onTick(300, "fantasmaMoving", { => self.position().right(1) })	
	}
	 
}

class Murcielago inherits Enemigo{
	const property image = "murcielago.png"

  //method irA(nuevaPosicion) { position = nuevaPosicion } 	
}
