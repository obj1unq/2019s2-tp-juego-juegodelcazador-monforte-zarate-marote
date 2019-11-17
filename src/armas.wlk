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
	
	method colisionandoCon(fantasma) {}
	
	method esArrojado() {}
	
	method esArmaADistancia() = false
	
	method esBallesta() = false
	
	method esPistola() = false
	
	method nombre()
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
		arma.disparar(arma.tipoDeMunicion(dir), pos, dir)
	}	
}

object ballesta inherits ArmaADistancia {
	const property image = "ballesta.png" 
	var property danio = 2	


	method disparar(municion, pos, dir){
		game.onTick(100, "Proyectil avanzando", {municion.mover(municion.positionAl(municion), dir)})		
	}
	
	method tipoDeMunicion(dir){ 
		return if (cazador.cantFlechas() > 0){
		 	new Flecha().crear(dir.posicionAl(self))
		}else{
		 game.say(cazador,"No poseo flechas")
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
			game.say(cazador,"No poseo balas")
		}
	}
	override method nombre() = "pistola de plata"
	
	override method esPistola() = true 
	
}