import cazador.*
import armas.*
import wollok.game.*

class Enemigo {
	var property hp //Posible cambio por diferentes valores de cada enemigo
	var property position 
	const property atk //Posible cambio por diferentes valores de cada enemigo 

	
	method muere() { return hp == 0 }

    method atacar() { cazador.recibirAtaque(self) }
}

object dracula inherits Enemigo{ 
    const property image = "dracula.png"
	var property ballesta = new Ballesta()
	var property armaDePlata = new ArmaDePlata()
	var property estaca = new EstacaYMartillo()
	
	method recibirAtaqueCon(arma) {
		if(arma == armaDePlata) {
			hp = 0
		} else if (arma == estaca){
			hp -= 3
		} else if(arma == ballesta) { 
			hp -= 1
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
		if(arma == ballesta) {hp -= 3}
		else if (arma == armaDePlata){hp -= 2} 
		else { hp -= 1}
	}
	//method irA(nuevaPosicion) { position = nuevaPosicion } 
}

class Fantasma inherits Enemigo{
	const property image = "fantasma.png"
	var ajo = new Ajo()
	
	method recibirAtaqueCon(arma) {   if(arma == ajo and cazador.cantDe(arma) == 1) 
		  								self.muere()
	}  
}

class Murcielago inherits Enemigo{
	const property image = "murcielago.png"
	var property ballesta = new Ballesta()
	var property armaDePlata = new ArmaDePlata()
	
    method recibirAtaqueCon(arma) {	if(arma == ballesta)	hp = hp -2}
  //method irA(nuevaPosicion) { position = nuevaPosicion } 	
}