import wollok.game.*

object cazador {
	const property image = "cazador.png"
	var property vida = 5
	var property armasEncontradas
	var property position = new Position(x = 12, y = 0)
	var property tiempoDeProteccion
	
	method atacarConArma(arma) {}
	  
	method guardarArma() {}
	    	
	method recogerVida() {
	   if(vida == 5 ) {
	   	self.error("Vidas completas")
	   	   vida += 1 
	   }
	}
	 
	method irA(nuevaPosicion) {
		position = nuevaPosicion
	}
}