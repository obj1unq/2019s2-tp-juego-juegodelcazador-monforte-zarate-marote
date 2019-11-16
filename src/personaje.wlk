import enemigos.*
import cosasExtras.*
import armas.*
import niveles.*
import wollok.game.*
import protecciones.*
import direcciones.*
import municion.*

object cazador inherits Colisionable {
	const property inventario = [ballesta]
	var property hp = 5
	var property orientacion = arriba
	var property position = game.at(14, 1)
	var property itemEquipado = ballesta
	var property cantFlechas = 0
	var property cantBalas = 0
	var property cantSal = 0
	method image() = orientacion.imagenDelPersonaje() // orientacion.imagenDelPersonaje()

///----------------------------------------------------------
///---------------------- LOOTEO ------------------------
///----------------------------------------------------------
	method recoger(objeto) {
		if (objeto.esColisionable() && objeto.sePuedeAgarrar()) 
		inventario.add(objeto)
		objeto.colisionarCon(self)
	    self.convertirAMunicion(objeto)		 			
	}

	method convertirAMunicion(objeto){
		if(objeto.esMunicion())
			self.convertir(objeto)
	}
	
	method convertir(objeto){
		if(objeto.esBala()){
			cantBalas = (cantBalas + objeto.cant()).min(15)
			inventario.remove(objeto)
		}else if (objeto.esFlecha()){
			cantFlechas = (cantFlechas + objeto.cant()).min(15)
			inventario.remove(objeto)
		}else{
			cantSal = (cantSal + objeto.cant()).min(15)
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

	method cantDe(unObjeto) {
		return inventario.count({ objeto => objeto == unObjeto })
	}

	method recogerVida() {
		hp = (hp + 1).min(10)
	}

	method tiene(objeto) {
		return inventario.contains(objeto)
	}

	method equipar(objeto) {
		if (self.tiene(objeto) or objeto.esSal()) {
			itemEquipado = self.encontrarObjetoEnBolsa(objeto)
			game.addVisualIn(objeto, game.at(21,0))
		} else {
			game.say(self, "No posees la " + objeto.nombre())
		}
	}

	method encontrarObjetoEnBolsa(objeto) {
		return inventario.find({ obj => obj.nombre() == objeto.nombre() })
	}

///----------------------------------------------------------
///---------------------- INTERACCIÓN -----------------------
///----------------------------------------------------------
	method recibirAtaque(enemigo) {
		hp -= enemigo.atk()
	}

	method ataqueA() {
		//if (itemEquipado.esArmaADistancia()){
			itemEquipado.disparar(itemEquipado, self.position(), orientacion)
		//}else{
		//self.enemigo().recibirAtaqueCon(itemEquipado)
		//}
	}

	method enemigo() = game.getObjectsIn(orientacion.posicionAl(self)).head()

	method restarMunicion(arma){
		if(arma.esBallesta()){
			self.restarFlechas()
		}else if(arma.esPistola()){
			self.restarBalas()
		}else{
			self.restarSal()
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
			new Sal().crear(self.position(), "sal.png")
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
	    hp = hp -1 
	}

	method estaVivo() = hp > 0

	method ganaElJuego() = not dracula.estaVivo()

	method muere() { return  hp == 0 }

	method perdiste() { game.say(self, "El mal seguirá latente") }
}