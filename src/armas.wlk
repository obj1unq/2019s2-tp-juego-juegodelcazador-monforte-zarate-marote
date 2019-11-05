import cazador.*

class Arma {
	const property position
	
	method esUsadaCon(enemigo) {
    	cazador.atacarEnemigoConArma(enemigo, self)  	
    }
}

class EstacaYMartillo inherits Arma {
	const property image = "estacaYMartillo.png" 
    var property danio    
 
} 

class Ballesta inherits Arma {
	const property image = "ballesta.png" 
	var property danio
	
}

class ArmaDePlata inherits Arma {
	const property image = "armaPlata.png" 
	var property danio
	    
}

class Ajo inherits Arma {
	const property image = "ajo.png" 
}
 
class Sal inherits Arma {
	const property image = "sal.png" 
	var property danio	
}
