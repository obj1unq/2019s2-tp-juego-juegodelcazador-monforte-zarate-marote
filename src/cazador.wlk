import wollok.game.*
import enemigos.*
import cosasExtras.*
import armas.*

object cazador {
	const property image = "cazador.png"
	var property vida = 5
	var property armasEncontradas = []
	var property position = new Position(x = 12, y = 0)
	var property tiempoDeProteccion 
	var property cantSales 
    var property ballesta = new Ballesta()
	var property rifleDePlata = new RifleDePlata()
	var property estaca = new Estaca()
	var property sal = new Sal()
	
	method recogerArmaOProteccion(arma) { 
		if ( arma == ballesta or arma == rifleDePlata or arma == estaca ) {
			armasEncontradas.add(arma)
			game.removeVisual(arma)
		} else if ( arma == sal) {
			cantSales += 1
			game.removeVisual(arma)
		   } else {
		      tiempoDeProteccion += 10	
		      game.removeVisual(arma)
		    }
	}
	
	method atacar(enemigo, arma) {
	var fantasma = new Fantasma() 	
		if (enemigo == fantasma and fantasma.puedeSerAtacado()) {
			game.removeVisual(enemigo)
		} else if(arma) {}
		/// modificar
		
	}
	     	
	method recogerVida() {
	   if(vida == 5) {
	   	 self.error("Tengo las vidas completas")
	   } else {
	   	   vida += 1 
	   }
	}
	
	method cambiarDeEscenario() {	
	}
	
	method estaSituadoEnCambioDeEscenario(puertaDeCastillo) {
		return position == puertaDeCastillo.position()
	} 
	 
	method irA(nuevaPosicion) { position = nuevaPosicion }
	
	method ganaElJuego() {
	   return dracula.murio()
	}
	
	method pierdeElJuego() { return vida == 0 }
}