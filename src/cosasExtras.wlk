import cazador.*
import wollok.game.*
import direcciones.*

class NoColisionable {
	method esColisionable() = false
}

class Colisionable {
	method esColisionable() = true
}
//////////////////
class ObjetoMovible {
	var property position
	
	method direccion()
	
	method moverse(direccion_){	
			if (self.noHayObstaculoAdelante()){
				self.position(self.adelante())
			}
	}	
	
	method listaDeObjetosAdelante() = game.getObjectsIn(self.adelante())

	method adelante() = direccionRep.adelante(self.position(), self.direccion())
	
	method noHayObstaculoAdelante(){
		return  (self.listaDeObjetosAdelante().isEmpty() || self.objetosSonTraspasables(self.listaDeObjetosAdelante()))
	}
	
	method objetosSonTraspasables(listaDeObjetos){
		return listaDeObjetos.all{objeto => objeto.esTraspasable()}
	}
}
/////////////
object castillo inherits NoColisionable {
	const property image = "castillo.gif"
	const property position = 0
}

class Pared inherits NoColisionable {
	const property position
	const property image = "laberinto1.png"
	
	method mover(direccion) {
		throw new Exception(message = "No puedes mover las paredes.")
	}
	
	method crear(posicion) {
		// Genera un pared en el tablero.
		game.addVisualIn(self, posicion)    // poder usarlo en escenarios para crear	
	}
}