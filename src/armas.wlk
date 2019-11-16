import personaje.*
import cosasExtras.*
import enemigos.*
import wollok.game.*

class Arma inherits Colisionable {
	
	var property position
    
    method colisionarCon(cazador) { 
		game.removeVisual(self)
	}

    override method puedeSoltarse()= false
	
	override method sePuedeAgarrar() = true
	
	override method esAtacable() = false 
	
	method esMunicion() = false
	
	method colisionandoCon(fantasma) {}
	
	method esArrojado() {}
	
	method crear(posicion, imagen) {
		// Genera un enemigo en el tablero.
		game.addVisualIn(self, posicion)	
	}
	method esArmaADistancia() = false
	
	method esBallesta() = false
	
	method esPistola() = false
	
	method esDisparablePor(arma) = false
	
	method nombre() = ""
}

object estacaYMartillo inherits Arma {
	const property image = "estacaYMartillo.png" 
    var property danio = 1
    
    var property id = 2
  /*   override method esUsadaCon(enemigo){ 
        if (dracula.malherido())
    	   cazador.atacarACon(dracula, self) 
    }*/
    
	override method nombre() = "estaca y el martillo"
}

class ArmaADistancia inherits Arma{
	
	method agregar(municion) {
		if (municion.esColisionable())
		    municiones = (municiones + municion.cant()).min(15)
	}
	
	
	override method esArmaADistancia() = true
	
	method disparar(arma, pos, dir) {
		//if (cazador.cantFlechas() > 0 and cazador.tiene(arma)){
		(cazador.inventario().find({obj => obj.esMunicion() && obj.esDisparablePor(arma)})).buscaObjetivo(pos, dir)
		cazador.restarMunicion(arma)
		//}else{
			cazador.error("¡No tengo mas municiones!")
		//}
	}
	
}

object ballesta inherits ArmaADistancia {
	const property image = "ballesta.png" 
	var property danio = 2	
	
	method tipoDeMunicion(){
		if (cazador.cantFlechas() > 0){
		cazador.inventario().find({obj => obj.esMunicion() && obj.disparablePor(self)})
		}else{
			cazador.error("No poseo flechas")
		}
	}
	override method nombre() = "ballesta"
	
	override method esBallesta() = true 
}

object pistolaDePlata inherits ArmaADistancia {
	const property image = "armaPlata.png" 
	var property danio = 4 
	
	method tipoDeMunicion(){
		if (cazador.cantBalas() > 0){
		cazador.inventario().find({obj => obj.esMunicion() && obj.disparablePor(self)})
		}else{
			cazador.error("No poseo balas")
		}
	}
	override method nombre() = "pistola de plata"
	
	override method esPistola() = true 
}




