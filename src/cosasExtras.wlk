import personaje.*
import wollok.game.*
import direcciones.*
import enemigos.*

class NoColisionable {
	
	method esColisionable() = false
	
	method esAtacable() = false
	
	method esMunicion() = false

    method puedeSoltarse() = false

    method sePuedeAgarrar() = false
    
}

class Colisionable {
	
	method esMunicion() = false
	
	method esColisionable() = true
	
	method esAtacable() = false
	
	method puedeSoltarse() = true
	
	method sePuedeAgarrar() = false
	
	method esVida() = false
	
	method esCazador() = false
	
	method esSal() = false
	
	method desaparecer() {
		game.removeVisual(self)
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