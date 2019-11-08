import cazador.*
import cosasExtras.*
import enemigos.*
import wollok.game.*

class Arma inherits Colisionable {
	var property municiones 
	const property position
	
	method cantDeMuniciones() {
        return municiones.size()		
	}
	
	method agregar(municion) {
		if (municion.esColisionable())
		    municiones.add(municion)
	}
	
	method dispararConMunicion() {
		// implementar
	}
	
	method esUsadaCon(enemigo) {
    	cazador.atacarEnemigoConArma(enemigo, self)  	
    }
    
    method colisionarCon(cazador) { 
		game.removeVisual(self)
	}
}

object estacaYMartillo inherits Arma {
	const property image = "estacaYMartillo.png" 
    var property danio = 1
    
    override method esUsadaCon(enemigo){ 
        if (dracula.malherido())
    	   cazador.atacarEnemigoConArma(dracula, self) 
    }
} 

object ballesta inherits Arma {
	const property image = "ballesta.png" 
	var property danio = 2
	
}

object revolverDePlata inherits Arma {
	const property image = "armaPlata.png" 
	var property danio = 4
	    
}

class Municion inherits Colisionable{
	const property position
	
	
	method esUsadaEn(arma) {
    	arma.dispararConMunicion()  	
    }
	
	method colisionarCon(cazador) { 
		game.removeVisual(self)
	}
}

class Bala inherits Municion {
	const property imagen = "bala.png"
}

class Flecha inherits Municion {
	const property imagen = "flecha.png"
}