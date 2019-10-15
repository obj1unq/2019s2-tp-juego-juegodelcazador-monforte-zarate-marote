import cazador.*

class Estaca {
	const property image = ".png" 
    var property vidaUtil
    var property danio
    
    method esUsada() {   	
    }
} 

class Ballesta {
	const property image = "ballesta.png" 
	var property vidaUtil
	var property danio
	const property position

    method esUsada() {    	
    }
}

class RifleDePlata {
	const property image = ".png" 
	var property vidaUtil
	var property danio
    
    method esUsada() {	
    }
}

class Ajo {
	const property image = ".png" 
	var property vidaUtil
	var property danio

    method esUsada() {
       cazador.tiempoDeProteccion(10) 	
    }
}
 
class Sal {
	const property image = "sal.png" 
    var property vidaUtil
	var property danio	
}