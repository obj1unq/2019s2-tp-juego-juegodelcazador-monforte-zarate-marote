import enemigos.*
import cosasExtras.*
import armas.*
import niveles.*
import wollok.game.*
import protecciones.*
import direcciones.*

object cazador {

	const property inventario = []
	var property hp = 5
	var property orientacion = arriba
	var property position = game.at(14, 1)
	// var previousPosition = position
	var property tiempoProtegido
	var property itemEquipado
	var property cantFlechas = 0
	var property cantBalas = 0


	method image() = orientacion.imagenDelPersonaje() // orientacion.imagenDelPersonaje()

///----------------------------------------------------------
///---------------------- LOOTEO ------------------------
///----------------------------------------------------------
	method recoger(objeto) {
		if (objeto.esColisionable()) 
		inventario.add(objeto)
		objeto.colisionarCon(self)
	// self.distribuirMunicion()		 			
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

	method equipar(objeto, nombre) {
		if (self.tiene(objeto) or inventario.contains({ obj => obj.id() == 4 })) {
			itemEquipado = self.encontrarObjetoEnBolsa(objeto)
			game.addVisualIn(objeto, game.at(21,0))
		} else {
			game.say(self, "No posees la " + nombre)
		}
	}

	method encontrarObjetoEnBolsa(objeto) {
		return inventario.find({ obj => obj.id() == objeto.id() })
	}

///----------------------------------------------------------
///---------------------- INTERACCIÓN -----------------------
///----------------------------------------------------------
	method recibirAtaque(enemigo) {
		hp -= enemigo.atk()
	}

	method ataqueA() {
		// Ataque solo funciona con un enemigo en orientacion 
		self.enemigo().recibirAtaqueCon(itemEquipado)
	}

	method enemigo() = game.getObjectsIn(orientacion.posicionAl(self)).head()

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
	   // Respeta el polimorfismo.
	}

	method estaVivo() = hp > 0

	method ganaElJuego() = not dracula.estaVivo()

	method muere() { return  hp == 0 }

	method perdiste() { game.say(self, "El mal seguirá latente") }
}