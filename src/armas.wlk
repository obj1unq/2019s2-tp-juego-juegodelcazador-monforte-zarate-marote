import cazador.*

class Estaca {
    var property vidaUtil
    var property danio
    
    method esUsada() {   	
    }
} 

class AguaBendita {
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
	var property vidaUtil
	var property danio
    
    method esUsada() {	
    }
}

class Ajo {
	var property vidaUtil
	var property danio

    method esUsada() {
       Cazador.tiempoDeProteccion(10) 	
    }
}
 
class Cofre {
    const property elementosContenidos = []	

    method sacarElemento(elemento) {
    } 
}