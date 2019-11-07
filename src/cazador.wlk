import enemigos.*
import cosasExtras.*
import armas.*
import escenarios.*
import wollok.game.*

object cazador {
	const property image = "cazador.png"
	const property inventario = []
	var property vida = 500	
	var property position = game.at(14,0)
	var property tiempoProtegido
	var property ajo = new Ajo()
	
	method recogerArmaOProteccion(arma) { 
			//Preguntar si es colisionable
			inventario.add(arma)
		    arma.colisionarCon(self)
	}
	
	method cantDe(unArma) { return inventario.filter( { arma => arma == unArma }).size()}
	
	method tiempoDeProteccionConAjo() {
		 tiempoProtegido += (ajo.tiempoQueProteje() * self.cantDe(ajo))
		 // se tiene que ir descontando el tiempo
	}
	
	method atacarEnemigoConArma(enemigo, arma) { 
		enemigo.recibirAtaqueCon(arma)
	}    	
	     	
	method recogerVida() {
	   	  vida = (vida +10).min(500) 
	}
	
	method recibirAtaque(enemigo) { 
		vida -= enemigo.atk()
	}
	
	method cambiarDeEscenario(puertaDeCastillo) {	
	      //trabajar duro en esto
	 }
	
	method estaSituadoEnCambioDeEscenario() {
		// usar onCollideDo(visual, action)
		//trabajar duro en esto
	}  
	 
	method irA(nuevaPosicion) { 
		     position = nuevaPosicion
    }	

	method mover(nuevaPosicion) {
		// Puede mover si no hay un obj no colisionable en direccion dir
		 // Actualiza la variable del personaje
		if (self.puedeMoverAl(nuevaPosicion)) {
			position = nuevaPosicion		
		}
	}
	
	method puedeMoverAl(dirNueva) {
		// Puede mover si no hay ningun obj en direccion dir o si el obj es colisionable
		// Todos los obj entienden el mensaje esColisionable()
		return /*game.getObjectsIn(dirNueva.posicionAl(self)).isEmpty() or */
		      game.getObjectsIn(dirNueva.posicionAl(self)).all{ obj => obj.esColisionable() }
	}
   
    method colisionarCon(enemigo) {
	    // Respeta el polimorfismo.
	}
	
	method ganaElJuego() { return dracula.muere() }
	
	method pierdeElJuego() { return vida == 0 }
}