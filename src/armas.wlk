import cazador.*

class Arma {
	const property position
	
	method esUsadaCon(enemigo) {
    	cazador.atacarEnemigoConArma(enemigo, self)  	
    }
}

class EstacaYMartillo inherits Arma {
	const property image = "estacaYMartillo.png" 
    var property vidaUtil
    var property danio    
 
} 

class Ballesta inherits Arma {
	const property image = "ballesta.png" 
	var property vidaUtil
	var property danio
	
}

class ArmaDePlata inherits Arma {
	const property image = "armaPlata.png" 
	var property vidaUtil
	var property danio
	    
}

class Ajo inherits Arma {
	const property image = "ajo.png" 
	var property vidaUtil
	const property tiempoQueProteje = 10 

}
 
class Sal inherits Arma {
	const property image = "sal.png" 
    var property vidaUtil
	var property danio	

}