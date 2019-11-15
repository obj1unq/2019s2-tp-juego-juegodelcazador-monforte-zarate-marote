import personaje.*
import wollok.game.*
import direcciones.*
import enemigos.*

class NoColisionable {
	method esColisionable() = false
	
	method esAtacable() = false

    method puedeSoltarse() = false

    method sePuedeAgarrar() = false
}


class Colisionable {
	method esColisionable() = true
	
	method esAtacable() = true
	
	method puedeSoltarse() = true
	
	method sePuedeAgarrar() = false
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
	var property image
	
	
	method crear(posicion,imagen) {	
		// Genera una pared en el tablero.
		image = imagen
		game.addVisualIn(self, posicion)
	}
}

class Trampa inherits Colisionable {
	const property position
	var property image = "camino1.png"
	
	method colisionarCon(cazador) {
		self.activarBoosFinal()
	}
	
	method activarBoosFinal() {
		game.addVisualIn(fantasmaBoss, game.at(11,10))
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
	method image() {
		return parteDelMarcador.entrada().toString().charAt(numeroDeHoja - 1)+".png"
	}	
}
	
class Marcador inherits Cartel{

		override method entrada() { return cazador.hp()}
}