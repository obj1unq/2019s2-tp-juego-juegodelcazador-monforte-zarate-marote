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
	var property vidaUtil
	var property danio

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