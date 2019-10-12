import cazador.*
import armas.*
import wollok.game.*

object dracula { 
    const property image = ".png"
	var property vida
	var property position
	
	method image() { return image }
	
	method atacar(arma) {}
	
	method esAtacadoCon() {}
	
	method murio(){
       	   return vida == 0
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
	const property image = "fantasma.png"
	var property vida
	var property position 
	
	method puedeSerAtacado() {}
	
	method atacar() {}
}

object fantasmaFinal {
	const property image = "fantasma2.png"
	var property vida 
	var property position = game.at(12, 12)
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