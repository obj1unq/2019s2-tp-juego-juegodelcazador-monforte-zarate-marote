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
		if (not game.getObjectsIn(position).isEmpty()){ 
		var objeto = game.colliders(self).first()
		if (objeto.sePuedeAgarrar()){ 
		    inventario.add(objeto)
		   	game.removeVisual(objeto)
	        self.convertirAMunicion(objeto) 
	        self.recogerSiEsVida(objeto)
	        self.colocarObjetoEnEncabezado(objeto)
	    } else {
	    	game.say(self, "No hay nada para recoger")
	    }
	  }
	 }
	
	method colocarObjetoEnEncabezado(obj){
		if((!obj.esMunicion() and !obj.esVida()) or (obj.esArmaDeCazador()))
		self.buscarEspacioLibre(obj, game.at(0,15))
	}
	
	method buscarEspacioLibre(obj, pos){
		if(game.getObjectsIn(pos).isEmpty() or 
		   game.getObjectsIn(pos).first() == obj){
			game.addVisualIn(obj, pos)
		}else{self.buscarEspacioLibre(obj, pos.right(1))
		}
	}
	
	method recogerSiEsVida(obj){
		if(obj.esVida())
			self.agregarVida()
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

	method equipar(objeto) {
		if (self.tiene(objeto)) {
			itemEquipado = self.encontrarObjetoEnBolsa(objeto)
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
	     position = game.at(15,1)	
	}
	
	method ataqueA() {
		if (itemEquipado.esArmaADistancia() and itemEquipado.estaCargada()){
			itemEquipado.disparar(itemEquipado, self.position(), orientacion)
			self.restarMunicion(itemEquipado)
		}else if (itemEquipado.esEstaca()){
		self.enemigo().recibirAtaqueCon(itemEquipado.dmg())
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
	
	
///---------------------- MOVIMIENTO ------------------------

	method mover(nuevaPosicion, dir) {
		// Puede mover si no hay un objeto no colisionable en direccion dir
		if (self.puedeJugar() and self.puedeMoverAl(dir) and self.estaOrientado(dir)) {
			self.position(nuevaPosicion)
			self.sonidoDePasos()			
		}else{
			orientacion = dir
		}
	}
	
	method estaOrientado(dir) = orientacion == dir
	 
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
	    // self.recoger(objeto)    
	}

	method ganaElJuego() = not dracula.estaVivo()

	method perdiste() {
		if(!game.hasVisual(gameOver)){
			game.say(self, "EL MAL SEGUIRA LATENTE")
			game.sound("moriste.mp3")
			game.addVisual(gameOver)
			game.schedule(4000, {game.stop()})}		
	}
	method ganaste(){
		//game.addVisual()
	}
}