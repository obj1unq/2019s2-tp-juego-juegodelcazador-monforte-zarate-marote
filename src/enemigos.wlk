import cazador.*
import armas.*

class VampiroFinal { 
    const property image
	var property vida
	var property position
	
	method image() { return image }
	
	method atacar() {}
	
	method esAtacadoCon(arma) {}
	
	method muere(){
        if(self.esAtacadoCon(RifleDePlata)) {
            vida =  0     	
        }	   
    }
    
	method irA(nuevaPosicion) {
		position = nuevaPosicion
	}
}
	
class Bruja { 
	const image 
	var property vida
	var property position 
	
	method image() { return image }
	
	method atacar() {}
	
	method irA(nuevaPosicion) {
		position = nuevaPosicion
	} 
}

class Fantasma {
	const property image = "fantasma1.png"
	var property vida
	var property position 
	
	method image() { return image }
	
	method atacar() {}
	
	method irA(nuevaPosicion) {
		position = nuevaPosicion
	} 
}

class Murcielago {
	const image 
	var property vida
	var property position 
	
	method image() { return image }
	
	method atacar() {}
	
	method irA(nuevaPosicion) {
		position = nuevaPosicion
	} 	
}