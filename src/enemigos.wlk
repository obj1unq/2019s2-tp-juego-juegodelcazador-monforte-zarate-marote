import personaje.*
import armas.*
import wollok.game.*
import cosasExtras.*
import protecciones.*
import direcciones.*
import wollok.game.*
import municion.*

class Enemigo inherits Colisionable {
	var property position 
	var property orientacion = derecha
 	var property hp
 	override method puedeSoltarse() = false 
 	
 	override method esAtacable() = true
    
	method acechar(){
		game.onTick(1000, "persiguiendo al cazador", { => self.acercarse()})
	}
	
	method acercarse(){
		
		var otraPosicion = cazador.position()
		var newX = position.x() + if(otraPosicion.x() > position.x()) 1 else -1
		var newY = position.y() + if(otraPosicion.y() > position.y()) 1 else -1
		
		//EVITAR QUE SE POSICIONEN FUERA DEL TABLERO
		
		newX = newX.max(0).min(game.width() - 1)
		newY = newY.max(0).min(game.height() - 1)
		
		position = game.at(newX, newY)
		
	}

	method escapar(){
		game.onTick(500, "salvese quien pueda", { => self.huir()})
	}
	
	method huir(){
		var otraPosicion = cazador.position()
		var newX = position.x() + if(otraPosicion.x() > position.x()) -1 else 1
		var newY = position.y() +  if(otraPosicion.y() > position.y()) -1 else 1
		

		newX = newX.max(0).min(game.width() - 1)
		newY = newY.max(0).min(game.height() - 1)
		
		position = game.at(newX, newY)
		
	}
	
	method estaVivo() = hp > 0

    method recibirAtaqueCon(arma){
    	hp -= arma.danio()
    }
    
    method colisionarCon(cazador) {
    	cazador.recibirAtaque(self.atk())
    }
    method atk()
    
    method crearFantasma(posicion) {
		var fantasmin = new Fantasma(position = posicion, hp = 1)
		game.addVisual(fantasmin)
		fantasmin.patrullar()
	}
	
	method crearBruja(posicion) {
		var bruji = new Bruja(position = posicion, hp = 1)
		game.addVisual(bruji)
		bruji.patrullar()
	}
	
	method crearMurcielago(posicion) {
		var murci = new Murcielago(orientacion = arriba, position = posicion, hp = 1)
		game.addVisual(murci)
		murci.patrullar()
	}
	
	
///---------------------- MOVIMIENTO ------------------------
	
	method mover(nuevaPosicion, dir) {
		// Puede mover si no hay un obj no colisionable en direccion dir
		orientacion = dir
		if (self.estaVivo() and self.puedeMoverAl(dir)) {
			self.position(nuevaPosicion)
		}else{orientacion = orientacion.opuesto()}
	}

	method puedeMoverAl(dir) {
		// Puede mover si no hay ningun obj en direccion dir o si el obj es colisionable
		// Todos los obj entienden el mensaje esColisionable()
		return game.getObjectsIn(dir.posicionAl(self)).isEmpty() or game.getObjectsIn(dir.posicionAl(self)).all{ obj => obj.esColisionable() }
	}
}

object dracula inherits Enemigo{ 
    const property image = "dracula.png"
	const property atk = 4
	var property hp = 10
    
    override method position() = game.at(11,10)
    
    override method atk() {
    	game.say(self, ["La sangre me otorga más PODER!",
    					"EL MAL PREVALECERÁ!",
    					"NO PUEDES CONTRA MI INSECTO!"].anyOne())
    	self.curarse(atk)
    	return atk
    } 
    
    method curarse(vida){
    	hp = hp+vida
    }
    
    method malherido() {
    	return hp < 5
    }
    override method hp() = 	10

	
	method elVerdaderoDesafio(){
		game.onTick(500, "sedDeSangre", { => self.cazarOSerCazado()})
	}
	
	
	method cazarOSerCazado(){
		if (!self.malherido()){
			self.acercarse()
		}else{
			self.huir()
		}
		
	}	
	
}
	
class Bruja inherits Enemigo{ 
	const property atk = 3
	const property image = "bruja.png" 
    override method recibirAtaqueCon(arma){
    	hp -= arma.danio()
    }
    
    override method atk() = atk
    
    method patrullar(){
		game.onTick(500, "brujaMoving", { => self.mover(orientacion.posicionAl(self), orientacion) })	
	}

}

class Fantasma inherits Enemigo{
	const property atk = 1
	
	method image() = orientacion.imagenDelPersonaje(self.nombre())
	method nombre() = "fantasma"
	
	override method atk() = atk
	
	method morirSiEsSal(){
	   if(game.getObjectsIn(self.position()).any({obj => obj.esSal()})){
	   self.desaparecer()
	   game.getObjectsIn(self.position()).find({obj => obj.esSal()}).desaparecer()
	   }
	   
	}
	
	override method desaparecer(){
		super()
		game.sound("fantasmaMuere.mp3")
	}
	
	 override method mover(nuevaPosicion, dir){
		// Puede mover si no hay un obj no colisionable en direccion dir
		if (self.puedeMoverAl(dir)) {
			self.position(nuevaPosicion)
			self.morirSiEsSal()
			
		}else{orientacion = orientacion.opuesto()}
	}	
	
	method patrullar(){
		game.onTick(500, "fantasmaMoving", { => self.mover(orientacion.posicionAl(self), orientacion) })	
	}
}

object fantasmaBoss inherits Fantasma {
	var resistenciaALaSal = 1
	
	override method image() = "fantasma2.png"
	
	override method atk() = atk + 3
	
	method iniciarEvento(){
		self.position(game.at(11, 11))
		game.addVisual(self)
		self.acecharOHuir()
	}
		
	method acecharOHuir(){
		game.onTick(1000, "persiguiendo al cazador", { => 
			if (self.todaviaResiste()){
				self.acechar()
			}else{
				self.huir()
			}	
		})
	}
	
	method resistirSal() {
		resistenciaALaSal--
	}
	
	method todaviaResiste() = resistenciaALaSal > 0 
	
	
	override method acechar(){
		self.huirSiEsSal()
		self.acercarse()
	}
	
	method huirSiEsSal(){
	   if(game.getObjectsIn(self.position()).any({obj => obj.esSal()})){
	   		self.resistirSal()
	   game.getObjectsIn(self.position()).find({obj => obj.esSal()}).desaparecer()
	   }
	}	

}

class Murcielago inherits Enemigo{
	const property image = "murcielago.png"
	const property atk = 1

    override method hp() = 1
    
    method patrullar(){
		game.onTick(500, "murcielagoMoving", { => self.mover(orientacion.posicionAl(self), orientacion) })	
	}	
	
	override method atk() = atk
}

