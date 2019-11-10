import cazador.*
import wollok.game.*
import direcciones.*

class NoColisionable {
	method esColisionable() = false
}

class Colisionable {
	method esColisionable() = true
}

object castillo inherits NoColisionable {
	const property image = "castillo.png"
	const property position = 0
}

object puerta inherits Colisionable {
    const property image = "puerta.png"
	const property position = 0

    method colisionarCon(cazador) { 
		//implementar
	}
}

class Pared inherits NoColisionable {
	const property position
	const property image = "laberinto2.png"
	
	method crear(posicion) {
		// Genera un pared en el tablero.
		game.addVisualIn(self, posicion)
	}
}

class GraficaParaCartel {
	var property image
	var property position
	constructor (imagen, posicion){
		image = imagen
		position = posicion
	}
}

class Cartel inherits Colisionable{
	var property cantidadDeCifras
	var property posicionInicial
	var property hojas = []
	constructor(nroCifras,_posicionInicial){
		cantidadDeCifras = nroCifras
		posicionInicial = _posicionInicial
	}
	method entrada() { return 0 }
	method hojasNecesarias() {
		return self.entrada().toString().size()
	}
	method agregarHojaSiFalta() {
		if (self.hojasNecesarias() > hojas.size() ) {
			hojas.add(new Hoja(self,self.hojasNecesarias()))
			game.addVisual(hojas.get(self.hojasNecesarias() -1))
		}
	}
}

class Hoja {
	var parteDelMarcador
	const numeroDeHoja

	constructor (marcador, hojaNro){
		parteDelMarcador = marcador
		numeroDeHoja = hojaNro
	}
	method position(){
		return game.at(parteDelMarcador.posicionInicial().x()+numeroDeHoja, parteDelMarcador.posicionInicial().y())
	}
	method chocasteConPacman(pacman, fantasmas) {}
	method chocarCon(alguien){}
	method image() {
		return parteDelMarcador.entrada().toString().charAt(numeroDeHoja - 1)+".png"
	}	
}
	
class Marcador inherits Cartel{

		override method entrada() { return cazador.hp()}
}	

object tablero {
///----------------------------------------------------------
///---------------------- CAMBIO DE NIVEL -------------------
///----------------------------------------------------------

	method cazadorSituadoEnCambioDeEscenario(puerta) {	
	   	 //implementar
	   	 }
	
	method cambioDeEscenario(puerta) {
	
		game.clear()
	    //implementar	
	}  
		
}
