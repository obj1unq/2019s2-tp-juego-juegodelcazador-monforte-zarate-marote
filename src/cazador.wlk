import wollok.game.*
import enemigos.*
import cosasExtras.*
import armas.*

object cazador {
	const property image = "cazador.png"
	var property vida = 5
	var property inventario = []
	var property position = new Position(x = 12, y = 0)
    var property ballesta = new Ballesta()
	var property rifleDePlata = new RifleDePlata()
	var property estaca = new Estaca()
	var property sal = new Sal()
	var property fantasma = new Fantasma()
	var property murcielago = new Murcielago()
	var property bruja = new Bruja()
	var property parteDePasto = new ParteDePasto()
	var property ajo = new Ajo() 
	
	method recogerArmaOProteccion(arma) { 
			self.validarQueEsArma(arma)
			inventario.add(arma)
		    game.removeVisual(arma)	
	}
	
	method validarQueEsArma(arma) {
		//////
	}
	
	method cantDeSales() { return inventario.map( { arma => arma /* */ }).size()}
	
	method tiempoDeProteccionConAjo() {
		 return self.cantDeAjos() * ajo.tiempoQueProteje()
	}
	
	method cantDeAjos() {
		return inventario.map( { arma => arma == ajo}).sum()}
	
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
		vida = vida - enemigo.poderDanio()
	}
	
	
	method cambiarDeEscenario(puertaDeCastillo) {	
	     if(self.estaSituadoEnCambioDeEscenario(puertaDeCastillo)) {
	     	/////
	     }
	 }
	
	method estaSituadoEnCambioDeEscenario(puertaDeCastillo) {
		return position == puertaDeCastillo.position()
	} 
	 
	method irA(nuevaPosicion) { 
		//if( not self.colisionaEn(nuevaPosicion)) {
		     position = nuevaPosicion
	//} else {
		//self.error("Solo me puedo mover por el camino")
		 //    position
	//}
}	
	method colisionaConEn(posicion) {
    	return posicion == parteDePasto.position()
    }
	
	method ganaElJuego() {
	   return dracula.muere()
	}
	
	method pierdeElJuego() { return vida == 0 }
}
