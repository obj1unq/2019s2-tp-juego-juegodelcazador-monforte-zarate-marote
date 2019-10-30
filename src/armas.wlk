import cazador.*

class Arma {
	const property position
}

class EstacaYMartillo inherits Arma {
	const property image = "estacaYMartillo.png" 
    var property vidaUtil
    var property danio
    
    
    method esUsada() {  	
    }
} 

class Ballesta  inherits Arma {
	const property image = "ballesta.png" 
	var property vidaUtil
	var property danio
	

    method esUsada() {    	
    }
}

class ArmaDePlata  inherits Arma {
	const property image = "armaPlata.png" 
	var property vidaUtil
	var property danio
	
    
    method esUsada() {	
    }
}

class Ajo  inherits Arma {
	const property image = "ajo.png" 
	var property vidaUtil
	const property tiempoQueProteje = 10 
	

    method esUsada() {}
}
 
class Sal  inherits Arma {
	const property image = "sal.png" 
    var property vidaUtil
	var property danio	

    method esUsada() {}

}