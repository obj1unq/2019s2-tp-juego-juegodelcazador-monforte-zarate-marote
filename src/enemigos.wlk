import cazador.*
import armas.*
import wollok.game.*

class Enemigo {
	var property vida //Posible cambio por diferentes valores de cada enemigo
	var property position 
	const property poderDanio //Posible cambio por diferentes valores de cada enemigo 
	
	method muere() { return vida == 0 }

    method atacar() { cazador.recibirAtaque(self) }
}

object dracula inherits Enemigo{ 
    const property image = "dracula.png"
	var property ballesta = new Ballesta()
	var property armaDePlata = new ArmaDePlata()
	var property estaca = new EstacaYMartillo()
	
	method recibirAtaqueCon(arma) {
		if(arma == armaDePlata) {
			vida = 0
		} else if (arma == estaca){
			vida -= 3
		} else if(arma == ballesta) { 
			vida -= 1
		}
	}
	//method irA(nuevaPosicion) { position = nuevaPosicion }
}
	
class Bruja inherits Enemigo{ 
	const property image = "bruja.png" 
	var property ballesta = new Ballesta()
	var property armaDePlata = new ArmaDePlata()
	var property estaca = new EstacaYMartillo()
	
	method recibirAtaqueCon(arma) {
		if(arma == ballesta) {
			vida -= 3 
		} else if (arma == armaDePlata){
			vida -= 2
		} else { vida -= 1}
	}
	//method irA(nuevaPosicion) { position = nuevaPosicion } 
}

class Fantasma inherits Enemigo{
	const property image = "fantasma.png"
	var ajo = new Ajo()

	method recibirAtaqueCon(arma) { 
	   if(arma == ajo and cazador.cantDe(arma) == 1) 
		  self.muere()
	}  
}

class FantasmaPoderoso inherits Enemigo{
	const property image = "fantasma2.png"
	var ajo = new Ajo()

    method recibirAtaqueCon(arma) {
		if(arma == ajo and cazador.cantDe(arma) == 5) 
		   self.muere() 
	}
}

class Murcielago inherits Enemigo{
	const property image = "murcielago.png"
	var property ballesta = new Ballesta()
	var property armaDePlata = new ArmaDePlata()
	
    method recibirAtaqueCon(arma) {
		if(arma == ballesta) 
			vida = vida -2      
	}
  //method irA(nuevaPosicion) { position = nuevaPosicion } 	
}
