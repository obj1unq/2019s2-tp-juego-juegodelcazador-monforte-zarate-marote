import cazador.*
import armas.*
import wollok.game.*
import cosasExtras.*

class Enemigo inherits NoColisionable {
	var property hp //Posible cambio por diferentes valores de cada enemigo
	var property position 
	const property atk //Posible cambio por diferentes valores de cada enemigo 

	
	method muere() { 
		return hp == 0
	}
	
	method recibirAtaqueCon(arma) {	
		hp = hp - arma.danio()
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
}
	
class Bruja inherits Enemigo{ 
	const property image = "bruja.png" 

	//method irA(nuevaPosicion) { position = nuevaPosicion } 
}

class Fantasma inherits Enemigo{
	const property image = "fantasma.png"
	var ajo = new Ajo()
	
	method recibirAtaqueCon(arma) {   
		if(arma == ajo and cazador.cantDe(arma) == 1) 
		   self.muere()
	} 
}

class Murcielago inherits Enemigo{
	const property image = "murcielago.png"

  //method irA(nuevaPosicion) { position = nuevaPosicion } 	
}