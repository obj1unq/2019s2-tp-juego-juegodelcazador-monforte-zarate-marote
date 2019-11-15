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
	
	method esSal() = false
	
	method esDisparablePor(arma) = false
}

object estacaYMartillo inherits Arma {
	const property image = "estacaYMartillo.png" 
    var property danio = 1
    
    var property id = 2
  /*   override method esUsadaCon(enemigo){ 
        if (dracula.malherido())
    	   cazador.atacarACon(dracula, self) 
    }*/
    

}

class ArmaADistancia inherits Arma{
	var property municiones = 1
	
	method agregar(municion) {
		if (municion.esColisionable())
		    municiones = (municiones + municion.cant()).min(15)
	}
	
	/*method dispararA(enemigo) {
		if (municiones > 0) {
			self.esUsadaCon(enemigo)
			municiones -= 1
		}else{game.say(cazador,"¡No tengo mas municiones!")}
	}*/
	
	override method esArmaADistancia() = true
	
	method disparar(arma, pos, dir) {
		//if (cazador.cantFlechas() > 0 and cazador.tiene(arma)){
		(cazador.inventario().find({obj => obj.esMunicion() && obj.esDisparablePor(arma)})).buscaObjetivo(pos, dir)
		//cazador.restarMunicion(arma)
		//}else{
			cazador.error("No poseo balas")
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
}




