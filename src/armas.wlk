import wollok.game.*
import cazador.*
import cosasExtras.*
import enemigos.*

class Arma inherits Colisionable {
	const property position
	
	method esUsadaCon(enemigo) {
    	cazador.atacarEnemigoConArma(enemigo, self)  	
    }
    
    method colisionarCon(cazador) { 
		game.removeVisual(self)
	}
}

class EstacaYMartillo inherits Arma {
	const property image = "estacaYMartillo.png" 
    var property danio = 1
    
    /*method armaDefinitiva(){ ***VER IDEA DE ARMA DEFINITIVA
    	if (game. == dracula){
    		dracula.muere()
    	}
    }*/
 
} 

class Ballesta inherits Arma {
	const property image = "ballesta.png" 
	var property danio = 2
	
}

class RevolverDePlata inherits Arma {
	const property image = "armaPlata.png" 
	var property danio = 5
	    
}

class Ajo inherits Arma {
	const property image = "ajo.png" 
}
 
class Sal inherits Arma {
	const property image = "sal.png" 
}
