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
	var property vida = 10	
	var property orientacion = arriba
	var property position = game.at(14,0)
	//var previousPosition = position
	var property tiempoProtegido
	var property ajo = new Ajo()
	var property itemEquipado
	



///----------------------------------------------------------
///---------------------- LOOTEO ------------------------
///----------------------------------------------------------
	
	method recoger(objeto) { 
		if( objeto.esColisionable())
			inventario.add(objeto)
		    objeto.colisionarCon(self)			
	}
	
	method cantDe(unArma) { return inventario.count( { arma => arma == unArma })}    	
	     	
	method recogerVida() {
	   	  vida = (vida +1).min(10) 
	}
	
	
	method equipar(obj){
		if (inventario.contains(obj)){
		itemEquipado = obj}
		else{game.say(self, "No posees el/la"+obj.toString())}
	}
	
///----------------------------------------------------------
///---------------------- INTERACCIÓN -----------------------
///----------------------------------------------------------
	
	method recibirAtaque(enemigo) { 
		vida -= enemigo.atk()
	}
	
		
	method tiempoDeProteccionConAjo() {
		 tiempoProtegido += (ajo.tiempoQueProteje() * self.cantDe(ajo))
		 // se tiene que ir descontando el tiempo
	}
	
	method atacarEnemigoConArma(enemigo, arma) { 
		enemigo.recibirAtaqueCon(arma)
	}
///----------------------------------------------------------
///---------------------- CAMBIO DE NIVEL ------------------------
///----------------------------------------------------------
	method cambiarDeEscenario(puertaDeCastillo) {	
	      //trabajar duro en esto
	 }
	
	method estaSituadoEnCambioDeEscenario() {
		// usar onCollideDo(visual, action)
		//trabajar duro en esto
	}  
	
	
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
	
	method estaVivo(){
		return vida > 0
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
	
 	method cazadorMuerto(){
 		return vida < 0
 	}
	
	method ganaElJuego() { return dracula.muere() }
	
	method perdiste() { game.say(cazador, "El mal seguirá latente") }
}
