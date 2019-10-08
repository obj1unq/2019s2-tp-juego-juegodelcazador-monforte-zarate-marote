class Cazador {
	const property image 
	var property vida = 5
	var property armasEncontradas
	var property position 
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