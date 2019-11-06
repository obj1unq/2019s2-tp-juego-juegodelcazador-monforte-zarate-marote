import wollok.game.*
import enemigos.*
import cosasExtras.*
import armas.*
import escenarios.*

object cazador {
	const property image = "cazador.png"
	const property inventario = []
	var property vida = 500	
	var property position
	
	method recogerArmaOProteccion(arma) { 
			//Preguntar si es colisionable
			inventario.add(arma)
		  //  game.removeVisual(arma)	//Con esto da error en los test de recoger
	}
	
	method cantDe(unArma) { return inventario.filter( { arma => arma == unArma }).size()}
	
	method tiempoDeProteccionConAjo() {
		 return ajo.tiempoQueProteje() * self.cantDe(ajo)
	}
	
	method atacarEnemigoConArma(enemigo, arma) { enemigo.recibirAtaqueCon(arma)  }    	
	     	
	method recogerVida() {
	   	  vida = (vida +10).min(500) 
	}
	
	
	method recibirAtaque(enemigo) { vida -= enemigo.poderDanio() } //ver poder danio
	
	method cambiarDeEscenario(puertaDeCastillo) {	
	     if(self.estaSituadoEnCambioDeEscenario(puertaDeCastillo)) {
	     	game.clear()
	        segundoEscenario.iniciar() //trabajar duro en esto
	     }
	 }
	
	method estaSituadoEnCambioDeEscenario(puertaDeCastillo) {
		return position == puertaDeCastillo.position()
	}  // usar onCollideDo(visual, action)
	 
	method irA(nuevaPosicion) { 
		//   self.colisionaEn(nuevaPosicion)
		     position = nuevaPosicion
}	
	method colisionaConEn(posicion) {
    	return posicion == parteDePasto.position()
    }  // usar onCollideDo(visual, action)
	
	method ganaElJuego() { return dracula.muere() }
	
	method pierdeElJuego() { return vida == 0 }
}