import enemigos.*
import cosasExtras.*
import armas.*
import niveles.*
import wollok.game.*
import protecciones.*
import direcciones.*
import municion.*
import objetosVisuales.*

object cazador inherits Colisionable {
	const property inventario = []
	var property orientacion = izquierda
	var property position = game.at(15, 1)
	var property itemEquipado
	var property cantFlechas = 0
	var property cantBalas = 0
	var property cantSal = 0
	
	method nombre() = "cazador"
	
	override method esCazador() = true
	
	method image() = orientacion.imagenDelPersonaje(self.nombre()) // orientacion.imagenDelPersonaje()

///---------------------- LOOTEO ------------------------

	method recoger() {
		if (not game.colliders(self).isEmpty()){ 
		var objeto = game.colliders(self).first()
		if (objeto.sePuedeAgarrar()){ 
		    inventario.add(objeto)
		   	game.removeVisual(objeto)
		   	
		   	//TODO: Ojo con romper el polimorfismo
	        self.convertirAMunicion(objeto) 
	        self.recogerSiEsVida(objeto)
	        self.colocarObjetoEnEncabezado(objeto)
	        //self.colocarVidaEnEncabezado(objeto)
	    } else {
	    	//TODO: Usar excepciones
	    	game.say(self, "No hay nada para recoger")
	    }
	  }
	}
	
	method colocarObjetoEnEncabezado(obj){
		if((!obj.esMunicion() and !obj.esVida()) or (obj.esArmaDeCazador()))
		self.buscarEspacioLibre(obj, game.at(0,15))
	}
	
	method colocarVidaEnEncabezado(obj){
		if(obj.esVida())
		self.buscarEspacioLibre(obj, game.at(0,14))
	}
	
	method buscarEspacioLibre(obj, pos){
		if(game.getObjectsIn(pos).isEmpty() or 
		    game.getObjectsIn(pos).first() == obj){
			game.addVisualIn(obj, pos)
		}else{
			self.buscarEspacioLibre(obj, pos.right(1))
		}
	}
	
	method recogerSiEsVida(obj){
		if(obj.esVida())
			self.agregarVida()
			self.colocarVidaEnEncabezado(obj)
			inventario.remove(obj)
	}

	method convertirAMunicion(objeto){
		if(objeto.esMunicion())
			self.convertir(objeto)
	}
	
	method convertir(objeto){
		if(objeto.esBala()){
			cantBalas = (cantBalas + objeto.cantidad()).min(15)//objeto.cant()).min(15)
			inventario.remove(objeto)
		}else if (objeto.esFlecha()){
			cantFlechas = (cantFlechas + objeto.cantidad()).min(15)//objeto.cant()).min(15)
			inventario.remove(objeto)
		}else{
			cantSal = cantSal + objeto.cant()
			inventario.remove(objeto)
		}
	}
    
    method agregarVida() {
		vidasDeJuego.sumar()
	}

	method tiene(objeto) {
		return inventario.contains(objeto)
	}

	//TODO: POLIMORFISMO
	//TODO: Esto tiene sentido?
	method equipar(objeto) {
		if(objeto.esBallesta()) {
			itemEquipado = ballesta			
		  }else if(objeto.esPistola()) {
		  	itemEquipado = pistolaDePlata
		  }else if(objeto.esEstaca()) {
		  	itemEquipado = estaca
		  } else {
			game.say(self, "No posees la " + objeto.nombre())
		}
	}

	method encontrarObjetoEnBolsa(objeto) {
		return inventario.find({ obj => obj.nombre() == objeto.nombre() })
	}

///---------------------- INTERACCIÓN -----------------------

	method recibirAtaque(atk) {
		self.comprobarVida()
	}

	method comprobarVida(){
		vidasDeJuego.descontar()
        if(vidasDeJuego.contador() > 0) {
			self.reiniciarUbicacion()			
		  } else { 
			self.perdiste()
		}
	}	
	
	method reiniciarUbicacion() {
	     position = game.at(15,1) //Posicion inicial de nivel revisar	
	}
	
	method ataqueA() {
		if (itemEquipado.esArmaADistancia() and itemEquipado.estaCargada()){
			itemEquipado.disparar(itemEquipado, self.position(), orientacion)
			self.restarMunicion(itemEquipado)
		}else if (itemEquipado.esEstaca()){
	     	self.enemigo().recibirAtaque(itemEquipado.dmg())
		}else{}
	}

	method enemigo() = game.getObjectsIn(orientacion.posicionAl(self)).head()

	method restarMunicion(arma){
		if(arma.esBallesta()){
			self.restarFlechas()
		}else{
			self.restarBalas()
		}
	}
	
	method restarFlechas(){
		cantFlechas = (cantFlechas - 1).max(0)
	}
	
	method restarBalas(){
		cantBalas = (cantBalas - 1).max(0)
	}
	
	method restarSal(){
		cantSal = (cantSal - 1).max(0)
	}
	
	method trampaDeSal(){
		if (cantSal > 0){
			new Sal().crear(self.position())
			self.restarSal()
			self.removerSalDeEncabezado(game.at(0, 15))
		}
	}
	
	method removerSalDeEncabezado(pos){
		if(!game.getObjectsIn(pos).isEmpty() and
			game.getObjectsIn(pos).head().esSal()){
			game.removeVisual(game.getObjectsIn(pos).head())
		}
		else{
			self.removerSalDeEncabezado(pos.right(1))		
		}
	}
	
	method removerVidaDeEncabezado(pos){
		if(!game.getObjectsIn(pos).isEmpty() and
			game.getObjectsIn(pos).head().esVida()){
			game.removeVisual(game.getObjectsIn(pos).head())
		}
		else{
			self.removerVidaDeEncabezado(pos.right(1))		
		}
	}
	
///---------------------- MOVIMIENTO ------------------------

	method mover(nuevaPosicion, dir) {
		// Puede mover si no hay un objeto no colisionable en direccion dir
		orientacion = dir
		if (self.puedeJugar() and self.puedeMoverAl(dir)) {
			self.position(nuevaPosicion)
			//self.sonidoDePasos()			
		}
	}
	
	//method estaOrientado(dir) = orientacion == dir
	 
	method puedeJugar() = vidasDeJuego.contador() > 0
	
	method sonidoDePasos(){
		game.sound(["paso1.mp3","paso2.mp3","paso3.mp3","paso4.mp3", "paso5.mp3"].anyOne())
	}
	method puedeMoverAl(dir) {
		// Puede mover si no hay ningun obj en direccion dir o si el obj es colisionable
		// Todos los obj entienden el mensaje esColisionable()
		return game.getObjectsIn(dir.posicionAl(self)).isEmpty() or game.getObjectsIn(dir.posicionAl(self)).all{ obj => obj.esColisionable() }
	}

	method colisionarCon(objeto) {
	}

	method ganaElJuego() = ! dracula.estaVivo()

	method perdiste() {
		if(!game.hasVisual(gameOver)){
			game.say(self, "EL MAL SEGUIRA LATENTE")
			game.sound("moriste.mp3")
			game.addVisual(gameOver)
			game.schedule(4000, {game.stop()})
		}		
	}
	method ganaste(){
		if(!game.hasVisual(youWin)){
		   game.say(self, "NO FUISTE UNA AMENAZA")  // agregar
		   game.addVisual(youWin)	
		   game.schedule(6000, {game.stop()})
		}
	}
}