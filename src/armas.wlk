import personaje.*
import cosasExtras.*
import enemigos.*
import wollok.game.*
import municion.*
import niveles.*

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
	
	method esArmaADistancia() = false
	
	method esBallesta() = false
	
	method esPistola() = false
	
	method nombre()
	method esFlecha() = false
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
	
	override method esArmaADistancia() = true
	method atacar(arma, pos, dir) {
		arma.disparar(arma.tipoDeMunicion(pos), pos, dir)
	}
	
}

object ballesta inherits ArmaADistancia {
	const property image = "ballesta.png" 
	var property danio = 2	


	method disparar(municion, pos, dir){
		game.addVisualIn(municion, dir.posicionAl(municion))
		game.onTick(100, "Proyectil avanzando", {municion.mover(municion.position.up(1), dir)})		
	}
	
	method tipoDeMunicion(pos){ 
		return if (cazador.cantFlechas() > 0){
		 cazador.inventario().find({obj => obj.esFlecha()})
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
	
		}else{
			cazador.error("No poseo balas")
		}
	}
	override method nombre() = "pistola de plata"
	
	override method esPistola() = true 
	
}




