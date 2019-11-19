import enemigos.*
import cosasExtras.*
import armas.*
import niveles.*
import wollok.game.*
import protecciones.*
import direcciones.*
import municion.*
import menu.*
import objetosVisuales.*

object cazador inherits Colisionable {
	const property inventario = []
	var property hp = 10
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

	method recoger(objeto) {
		if (not game.getObjectsIn(position).isEmpty() and objeto.sePuedeAgarrar()){ 
		    inventario.add(objeto)
		    objeto.colisionarCon(self)
	        self.convertirAMunicion(objeto) 
	        self.tomarSiEsVida(objeto)
	        self.buscarEspacioLibre(objeto, game.at(0,15))
	    } else {
	    	game.say(self, "No hay nada para recoger")
	    }
	}
	
	method tomarSiEsVida(obj){
		if(obj.esVida())
			self.curarse()
		
	}

	method convertirAMunicion(objeto){
		if(objeto.esMunicion())
			self.convertir(objeto)
	}
	
	method convertir(objeto){
		if(objeto.esBala()){
			cantBalas = (cantBalas + 1).min(15)//objeto.cant()).min(15)
			inventario.remove(objeto)
		}else if (objeto.esFlecha()){
			cantFlechas = (cantFlechas + 1).min(15)//objeto.cant()).min(15)
			inventario.remove(objeto)
		}else{
			cantSal = cantSal + objeto.cant()
			inventario.remove(objeto)
		}
	}
	
    method soltar() {
    	const objeto = inventario.head()
    	if(objeto.puedeSoltarse()) {
    	    objeto.esArrojado()
            inventario.remove(inventario.head())	
    	} 		
    }

	method curarse() {
		hp = (hp + 1).min(10)
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
	
	method buscarEspacioLibre(obj, pos){
		if(game.getObjectsIn(pos).isEmpty()or game.getObjectsIn(pos).contains(obj)){
			game.addVisualIn(obj, pos)
		}else{self.buscarEspacioLibre(obj, pos.right(1))
		}
	}
	

	method encontrarObjetoEnBolsa(objeto) {
		return inventario.find({ obj => obj.nombre() == objeto.nombre() })
	}

///---------------------- INTERACCIÓN -----------------------

	method recibirAtaque(atak) {
		hp = (hp - atak).min(0)
		self.comprobarVida()
	}

	method comprobarVida(){
		if (hp == 0){
			self.perdiste()
		}
	}
	method ataqueA() {
		if (itemEquipado.esArmaADistancia()){
			itemEquipado.atacar(itemEquipado, self.position(), orientacion)
			self.restarMunicion(itemEquipado)
		}else{
		self.enemigo().recibirAtaqueCon(itemEquipado)
		}
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
		}
	}
///----------------------------------------------------------
///---------------------- MOVIMIENTO ------------------------
///----------------------------------------------------------
	method mover(nuevaPosicion, dir) {
		// Puede mover si no hay un objeto no colisionable en direccion dir
		orientacion = dir
		if (self.estaVivo() and self.puedeMoverAl(dir)) {
			self.position(nuevaPosicion)
		}
	}

	method puedeMoverAl(dir) {
		// Puede mover si no hay ningun obj en direccion dir o si el obj es colisionable
		// Todos los obj entienden el mensaje esColisionable()
		return game.getObjectsIn(dir.posicionAl(self)).isEmpty() or game.getObjectsIn(dir.posicionAl(self)).all{ obj => obj.esColisionable() }
	}

	method colisionarCon(enemigo) {
	     self.recibirAtaque(enemigo)
	     self.perdiste()
	}

	method estaVivo() = hp > 0

	method ganaElJuego() = not dracula.estaVivo()

	method muere() { return  hp == 0 }

	method perdiste() { 
		game.say(self, "EL MAL SEGUIRA LATENTE")
		game.sound("moriste.mp3")
		game.addVisual(gameOver)
		game.schedule(8000, {game.stop()})		
	}
}