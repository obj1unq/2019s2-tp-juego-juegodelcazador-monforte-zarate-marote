import personaje.*
import wollok.game.*
import direcciones.*
import enemigos.*

class NoColisionable {
	
	method esColisionable() = false
	
	method esEnemigo() = false

    method puedeSoltarse() = false

    method sePuedeAgarrar() = false
    
    method esVida() = false
    
    method esCazador() = false
    
    method esSal() = false
    
    method obtenerObjetoDelLugar(elQuePida) = game.getObjectsIn(elQuePida.position())
    
    method crear(posicion,imagen) {	
		// Polimorfismo
	}
    
}

class Colisionable {
	
	method esMunicion() = false
	
	method esColisionable() = true
	
	method esEnemigo() = false
	
	method puedeSoltarse() = true
	
	method sePuedeAgarrar() = false
	
	method esVida() = false
	
	method esCazador() = false
	
	method esSal() = false
	
	method desaparecer() {
		game.removeVisual(self)
	}
	
	method colisionasteCon(ob1, obj2) {}
	
	method obtenerObjetoDelLugar(elQuePida) = game.getObjectsIn(elQuePida.position())
	
	method crear(posicion,imagen) {	
		// Polimorfismo
	}
}
 
class Encabezado {
	var property image  
	var property position 
	
	constructor (imagen, posicion){
		image = imagen
		position = posicion
	}
}