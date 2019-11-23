import personaje.*
import cosasExtras.*
import enemigos.*
import wollok.game.*
import municion.*
import niveles.*

class Arma inherits Colisionable {
	var property position
    
   method colisionarCon(cazador) { 
		//cazador.recoger(self)
	}

    override method puedeSoltarse()= false
	
	override method sePuedeAgarrar() = true
	
	override method esAtacable() = false 
	
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
		arma.tipoDeMunicion(pos, dir)
		arma.disparar(flecha, pos, dir)
	}	
}

object ballesta inherits ArmaADistancia {
	const property image = "ballesta.png" 
	var property danio = 2	


	method disparar(municion, pos, dir){
		game.onTick(100, "Proyectil avanzando", {municion.mover(municion.position(), dir)})		
	}
	
	method tipoDeMunicion(pos, dir){ 
		return if (cazador.cantFlechas() > 0){
		 	flecha.avanzarYSpawnear(pos, dir)
		 	return flecha
		}else{
		 game.error("No poseo flechas")
		}
		
	}
	override method nombre() = "ballesta"
	
	override method esBallesta() = true 
}

object flecha inherits Flecha{
	var property image = "flechaLeft.png"
	
	override method position() = position
	method avanzarYSpawnear(pos, dir){
		position = dir.unaPosicionA(pos)
		game.addVisualIn(self, position)
	}
	
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