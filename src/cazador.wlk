import enemigos.*
import cosasExtras.*
import armas.*
import escenarios.*
import wollok.game.*
import protecciones.*
import direcciones.*

object cazador {
	var property image = arriba.imagenDelPersonaje()      //orientacion.imagenDelPersonaje()
	const property inventario = []
	var property hp = 10	
	var property orientacion = arriba
	var property position = game.at(14,0)
	//var previousPosition = position
	var property tiempoProtegido
	var property itemEquipado
	var property ajo = new Ajo()
	var property fantasma = new Fantasma()
	var property cantFlechas = 0
	var property cantFal = 0
	var property cantBalas = 0
	
///----------------------------------------------------------
///---------------------- LOOTEO ------------------------
///----------------------------------------------------------
	
	method recoger(objeto) { 
	  if( objeto.esColisionable())
		 inventario.add(objeto)
		 objeto.colisionarCon(self)
		 //self.distribuirMunicion()
		 			
	}
	
	
	method cantDe(unArma) { 
		return inventario.count( { arma => arma == unArma })
	}    	
	     	
	method recogerVida() {
	   	  hp = (hp +1).min(10) 
	}
	
	method tiene(objeto) {
		return inventario.contains(objeto)
	}
	
	method equipar(objeto, nombre){
		if (self.tiene(objeto)){
		    itemEquipado = objeto 
		} else {
			game.say(self, "No posees el/la"+nombre)
		}
	}
	
///----------------------------------------------------------
///---------------------- INTERACCIÓN -----------------------
///----------------------------------------------------------
	
	method recibirAtaque(enemigo) { 
		hp -= enemigo.atk()
	}
			
	method tiempoDeProteccionConAjo() {
		 tiempoProtegido += (ajo.tiempoQueProteje() * self.cantDe(ajo))
		 game.onTick(100, "Cuenta regresiva protección",{ => self.descontarTiempoDeProteccion()})
		 // se tiene que ir descontando el tiempo
	}
	
	method descontarTiempoDeProteccion(){
		if(tiempoProtegido == 0){
			game.removeTickEvent("Cuenta regresiva protección")
			game.removeVisual("ajoProteccion.png")
		}else{
			game.addVisualIn("ajoProteccion.png", (10->10))
			tiempoProtegido -= 1
		}	
	}
	
	method atacarACon(enemigo) { 
		enemigo.recibirAtaqueCon(itemEquipado)
	}
	
	method ataqueA() {
		// Ataque solo funciona con un enemigo en orientacion 
		self.enemigo().recibirAtaqueCon(itemEquipado)
	}
	
	method enemigo() = game.getObjectsIn(orientacion.posicionAl(self))
	

	
///----------------------------------------------------------
///---------------------- MOVIMIENTO ------------------------
///----------------------------------------------------------
	method mover(nuevaPosicion, dir) {
		// Puede mover si no hay un obj no colisionable en direccion dir
		orientacion = dir
		self.actualizarImagen()
		if (self.estaVivo() and self.puedeMoverAl(dir)) {
			self.position(nuevaPosicion)		
		}
	}
	

	
	method puedeMoverAl(dir) {
		// Puede mover si no hay ningun obj en direccion dir o si el obj es colisionable
		// Todos los obj entienden el mensaje esColisionable()
	
		return game.getObjectsIn(dir.posicionAl(self)).isEmpty() or
		      game.getObjectsIn(dir.posicionAl(self)).all{ obj => obj.esColisionable() }
	}
   
        method actualizarImagen() {
		image = orientacion.imagenDelPersonaje()
	}
	
        method colisionarCon(enemigo) {
	    // Respeta el polimorfismo.
	}
	
		method estaVivo(){
		return hp > 0
	}
	
	method ganaElJuego() { return dracula.muere() }
	
	method perdiste() { game.say(self, "El mal seguirá latente") }
}
