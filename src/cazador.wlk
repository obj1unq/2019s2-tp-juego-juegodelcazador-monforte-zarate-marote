import wollok.game.*
import enemigos.*
import cosasExtras.*
import armas.*
import escenarios.*

object cazador {
	const property image = "cazador.png"
	const property inventario = []
	var property vida = 3
	var property energia = 100	
	var property position
    var property ballesta = new Ballesta()
	var property armaDePlata = new ArmaDePlata()
	var property estaca = new EstacaYMartillo()
	var property sal = new Sal()
	var property fantasma = new Fantasma()
	var property murcielago = new Murcielago()
	var property bruja = new Bruja()
	var property parteDePasto = new ParteDePasto()
	var property ajo = new Ajo() 
	
	method recogerArmaOProteccion(arma) { 
			self.validarQueEsArma(arma)
			inventario.add(arma)
		  //  game.removeVisual(arma)	//Con esto da error en los test de recoger
	}
	
	method validarQueEsArma(arma) {
		//////
	}
	
	method cantDe(unArma) { return inventario.filter( { arma => arma == unArma }).size()}
	
	method tiempoDeProteccionConAjo() {
		 return ajo.tiempoQueProteje() * self.cantDe(ajo)
	}
	
	method atacarEnemigoConArma(enemigo, arma) { enemigo.recibirAtaqueCon(arma)  }    	
	     	
	method recogerEnergia() {
	   if(vida < 100) {
	   	   energia = (energia +10).min(100) 
	   } else {
	   	   self.error("Tengo la energia completa")
	   }
	}
	
	method recogerVida() {
	   if(vida < 3) {
	   	   vida += 1 
	   }else {
	   	   self.error("Tengo las vidas completas")
	   }
	}
	
	method recibirAtaque(enemigo) { energia -= enemigo.poderDanio() }
	
	method cambiarDeEscenario(puertaDeCastillo) {	
	     if(self.estaSituadoEnCambioDeEscenario(puertaDeCastillo)) {
	     	game.clear()
	        segundoEscenario.iniciar()
	     }
	 }
	
	method estaSituadoEnCambioDeEscenario(puertaDeCastillo) {
		return position == puertaDeCastillo.position()
	}  // usar onCollideDo(visual, action)
	 
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
    }  // usar onCollideDo(visual, action)
	
	method ganaElJuego() { return dracula.muere() }
	
	method pierdeVida() { 
		 if( energia > 0)
		   vida -= 1
	}
	
	method pierdeElJuego() { return vida == 0 }
}