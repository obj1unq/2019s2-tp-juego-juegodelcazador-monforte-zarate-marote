import cazador.*
import armas.*
import wollok.game.*

object dracula { 
    const property image = ".png"
	var vida = 10
	var property position
	var property ballesta = new Ballesta()
	var property rifleDePlata = new RifleDePlata()
	var property estaca = new Estaca()
	
	method atacar() {}
	
	method recibirAtaqueCon(arma) {
		if(arma == rifleDePlata) {
			vida = 0
		} else if (arma == estaca){
			vida -= 3
		} else { vida -= 1}
	}
	
	method muere(){ return vida == 0 }
    
	method irA(nuevaPosicion) { position = nuevaPosicion }
}
	
class Bruja { 
	const image 
	var property vida
	var property position 
	var property ballesta = new Ballesta()
	var property rifleDePlata = new RifleDePlata()
	var property estaca = new Estaca()
	
	method image() { return image }
	
	method atacar() {}
	
	method recibirAtaqueCon(arma) {
		if(arma == ballesta) {
			vida -= 3 
		} else if (arma == rifleDePlata){
			vida -= 2
		} else { vida -= 1}
	}
	
	method muere(){ return vida == 0 }
	
	method irA(nuevaPosicion) {
		position = nuevaPosicion
	} 
}

class Fantasma {
	const property image = "fantasma.png"
	var property vida
	var property position 
	
	method puedeSerAtacado() { 
		if(cazador.cantSales() == 1) {
			self.muere()
		} else {
			vida  
		}
	}  
	
	method atacar() {}
	
	method muere(){ return vida == 0 }
}

object fantasmaFinal {
	const property image = "fantasma2.png"
	var property vida 
	var property position = game.at(12, 12)
	var ajo = new Ajo()
	
	method muere(){ return vida == 0 }

    method recibirAtaqueCon(arma) {
		if(arma == ajo and cazador.cantSales() == 5) {
			self.muere() 
		} else {
			vida
		}
	}
}

class Murcielago {
	const image 
	var property vida
	var property position 
	var property ballesta = new Ballesta()
	var property rifleDePlata = new RifleDePlata()
	
	method image() { return image }
	
	method atacar() {
		cazador.recibirAtaque(self)
	}

    method recibirAtaqueCon(arma) {
		if(arma == ballesta) {
			vida -= 2 
		} else if (arma == rifleDePlata){
			vida -= 1
		} else { 
			vida
		}
	}

    method muere(){ return vida == 0 }
	
	method irA(nuevaPosicion) {
		position = nuevaPosicion
	} 	
}
