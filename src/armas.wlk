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
	
	method esArrojado() {}
	
	method esArmaADistancia() = false
	
	method esBallesta() = false
	
	method esPistola() = false
	
	method nombre()
	
	method esEstaca() = false
	
	
}

object estaca inherits Arma {
	const property image = "estacaYMartillo.png" 
    var property danio = 99999999
    var property id = 2
    
    method dmg() = danio
    override method esEstaca() = true
	override method nombre() = "estaca"
	override method esArmaDeCazador() = true
}

class ArmaADistancia inherits Arma{
	override method esArmaADistancia() = true
	
	method disparar(arma, pos, dir){
		var flechas = new Flecha(orientacion = cazador.orientacion(), tipo = flecha, position = dir.unaPosicionA(cazador.position()))
		var balas = new Bala(orientacion = cazador.orientacion(), tipo = bala, position = dir.unaPosicionA(cazador.position()))
		
		if(arma.esBallesta() && self.validarPuedeDisparar(dir)){
			
			flechas.trayectoria(flechas, pos, dir)
		}else if(arma.esPistola() && self.validarPuedeDisparar(dir)){
			
			balas.trayectoria(balas, pos, dir)
		}		
	}
	method validarPuedeDisparar(dir) = cazador.puedeMoverAl(dir)
}

object ballesta inherits ArmaADistancia {
	const property image = "ballesta.png" 
	var property danio = 2	
		
	override method nombre() = "ballesta"
	
	override method esBallesta() = true 
	
	method estaCargada() = cazador.cantFlechas() > 0
	
	override method esArmaDeCazador() = true
}

object pistolaDePlata inherits ArmaADistancia {
	const property image = "armaPlata.png" 
	var property danio = 4 
	
	override method nombre() = "pistola de plata"
	
	override method esPistola() = true 
	
	method estaCargada() = cazador.cantBalas() > 0
	
	override method esArmaDeCazador() = true
}