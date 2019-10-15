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
	var property fantasma = new Fantasma()
	var property murcielago = new Murcielago()
	var property bruja = new Bruja()
	
	method recogerArmaOProteccion(arma) { 
		if ( arma == ballesta or arma == rifleDePlata or arma == estaca ) {
			armasEncontradas.add(arma)
			game.removeVisual(arma)
		} else if ( arma == sal) {
			cantSales = cantSales +1
			game.removeVisual(arma)
		   } else {
		      tiempoDeProteccion = tiempoDeProteccion +10	
		      game.removeVisual(arma)
		    }
	}
	
	method atacarEnemigoConArma(enemigo, arma) { 	
		enemigo.recibirAtaqueCon(arma)
	}
	     	
	method recogerVida() {
	   if(vida == 10) {
	   	 self.error("Tengo las vidas completas")
	   } else {
	   	   vida = vida + 1 
	   }
	}
	
	method recibirAtaque(enemigo) {
		if( enemigo == fantasma) {
			vida = vida - 1
		} else if( enemigo == fantasmaFinal) {
			vida = vida - 2
		} else if( enemigo == murcielago) {
			vida = vida - 3
		} else if( enemigo == bruja) {
			vida = vida - 4
		} else {
			vida = vida - 6
		}
	}
	
	method cambiarDeEscenario(puertaDeCastillo) {	
	     if(self.estaSituadoEnCambioDeEscenario(puertaDeCastillo)) {
	     	/////
	     }
	 }
	
	method estaSituadoEnCambioDeEscenario(puertaDeCastillo) {
		return position == puertaDeCastillo.position()
	} 
	 
	method irA(nuevaPosicion) { position = nuevaPosicion }
	
	method ganaElJuego() {
	   return dracula.muere()
	}
	
	method pierdeElJuego() { return vida == 0 }
}