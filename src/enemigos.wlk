import cazador.*
import armas.*
import wollok.game.*

object dracula { 
    const property image = ".png"
	const property poderDanio = 6
	var vida = 10
	var property position
	var property ballesta = new Ballesta()
	var property rifleDePlata = new RifleDePlata()
	var property estaca = new Estaca()
	
	method recibirAtaqueCon(arma) {
		if(arma == rifleDePlata) {
			vida = 0
		} else if (arma == estaca){
			vida -= 3
		} else { vida -= 1}
	}
	
	method muere(){ return vida == 0 }
    
	//method irA(nuevaPosicion) { position = nuevaPosicion }
}
	
class Bruja { 
	const property image 
	const property poderDanio = 4
	var property vida
	var property position 
	var property ballesta = new Ballesta()
	var property rifleDePlata = new RifleDePlata()
	var property estaca = new Estaca()
	
	method image() { return image }
	
	method recibirAtaqueCon(arma) {
		if(arma == ballesta) {
			vida -= 3 
		} else if (arma == rifleDePlata){
			vida -= 2
		} else { vida -= 1}
	}
	
	method muere(){ return vida == 0 }
	
	//method irA(nuevaPosicion) { position = nuevaPosicion } 
}

class Fantasma {
	const property image = "fantasma.png"
	const property poderDanio = 1
	var property vida
	var property position 
	
	method recibirAtaqueCon() { 
		if(cazador.cantDeSales() == 1) {
			self.muere()
		}
	}  
	
	method muere(){ return vida == 0 } 
}

object fantasmaFinal {
	const property image = "fantasma2.png"
	const property poderDanio = 2
	var property vida 
	var property position = game.at(12, 12)
	var ajo = new Ajo()
	
	method muere(){ return vida == 0 }

    method recibirAtaqueCon(arma) {
		if(arma == ajo and cazador.cantDeSales() == 5) {
			self.muere() 
		} else {
		}
	}
}

class Murcielago {
	const property image = "murcielago.png"
	const property poderDanio = 3
	var property vida
	var property position 
	var property ballesta = new Ballesta()
	var property rifleDePlata = new RifleDePlata()
	
    method recibirAtaqueCon(arma) {
		if(arma == ballesta) {
			vida = vida -2  
	    }
	}

    method muere(){ return vida == 0 }
	
  //method irA(nuevaPosicion) { position = nuevaPosicion } 	
}
