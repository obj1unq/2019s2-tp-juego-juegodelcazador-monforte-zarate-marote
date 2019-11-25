import wollok.game.*
import cosasExtras.*
import enemigos.*
import armas.*
import personaje.*
import protecciones.*
import municion.*
import objetosVisuales.*
import direcciones.*
import menu.*

class Nivel {

	method cargar() {
		self.controles()
		self.visuales()
		self.cazador()
		self.cartel()
		self.cargarObjetos()
	}

	method cazador() {
		// Personaje
		game.addVisual(cazador)
		// Colisiones 
		game.whenCollideDo(cazador, { 
			objeto => objeto.colisionarCon(cazador)
		})
	}
	
	 method cargarObjetos(){
    	cazador.inventario().forEach({objeto => cazador.buscarEspacioLibre(objeto, game.at(0,15))})
    }
    
	method sound()
	
	method controles() {
		
	  keyboard.up().onPressDo{ cazador.mover(cazador.position().up(1), arriba)}
	  keyboard.down().onPressDo{ cazador.mover(cazador.position().down(1), abajo)}
	  keyboard.left().onPressDo{ cazador.mover(cazador.position().left(1), izquierda)}
	  keyboard.right().onPressDo{ cazador.mover(cazador.position().right(1), derecha)}
	  keyboard.t().onPressDo({ cazador.trampaDeSal()})
      keyboard.r().onPressDo({ cazador.recoger()})
      //keyboard.e().onPressDo({ cazador.soltar()})
      keyboard.a().onPressDo({ cazador.ataqueA()})
	  keyboard.num1().onPressDo({ cazador.equipar(ballesta) })
      keyboard.num2().onPressDo({ cazador.equipar(estaca) })
      keyboard.num3().onPressDo({ cazador.equipar(pistolaDePlata) })
      keyboard.space().onPressDo({ self.siguienteNivel()})
	}

	method visuales()  // cada nivel maneja su propio visuales / fondo, enemigos y objetos

	method ganaste(){} 
	 
	method siguienteNivel() {}
	 
	method posicionDeReinicio()
	 
	method siguienteNivel(nivel)
	
	method perdiste(){
		game.onTick(1000,"self",{
			game.clear()
		})
	}
	
	method cartel(){ 
 		game.addVisual(encabezadoInventario)
 		game.addVisual(encabezadoVidas)
 		game.errorReporter(cazador)
 	}
}

object menu inherits Nivel{
	
	override method cargar() {
		self.controles()
		self.visuales()
	}
	
	override method siguienteNivel(){
		self.siguienteNivel(nivel1)
	}
	
	override method siguienteNivel(nivel) {
		game.sound("risaMalvada.mp3")
		game.schedule(2000, { nivel.cargar()} )
		game.schedule(4000, { nivel.sound() })
	}
	
	override method visuales(){
		suelo.crear(game.at(0,0), "menuInicial.jpg" ) 
        game.addVisual(iniciarJuego)
        game.addVisual(salirJuego)   
	}
	
	override method posicionDeReinicio() {}
	
	override method controles(){
        keyboard.enter().onPressDo({self.siguienteNivel(configuracionTeclado)})
        keyboard.q().onPressDo({game.stop()})	
	}
	
	override method sound(){}	
}

object configuracionTeclado inherits Nivel{	
	
	override method cargar() {
		game.clear()
		self.visuales()	
		self.siguienteNivel()
	}
	
	override method siguienteNivel(){
		self.siguienteNivel(nivel1)
	}
	
	override method posicionDeReinicio() {}
	
	override method siguienteNivel(nivel) {
		game.schedule(5000, { nivel.cargar()} )
	}
	
	override method visuales() {
		//Fondo
		suelo.crear(game.at(0,0), "controles.jpg" ) 
		
		//Teclas
		game.addVisual(teclaUp)
		game.addVisual(teclaDown)
		game.addVisual(teclaLeft)
		game.addVisual(teclaRight)
        game.addVisual(tecla1)
		game.addVisual(tecla2)
		game.addVisual(tecla3)
		game.addVisual(teclaR)
		game.addVisual(teclaA)
		game.addVisual(teclaT)
		game.addVisual(teclaSpace)
		
		//Definicion
		game.addVisual(atacar)
		game.addVisual(recoger)
		game.addVisual(equipar)
		game.addVisual(arrojar)
		game.addVisual(movimientos)
	
	}
	
	override method sound() {}
}

object nivel1 inherits Nivel{
	
	override method siguienteNivel(){
		self.siguienteNivel(nivel2)
	}
	
	override method siguienteNivel(nivel){
		game.sound("aperturaPuerta.mp3")
		game.onCollideDo(cazador, {puerta => puerta.cambioDeEscenario(nivel)})
		game.schedule(3000, { game.sound("cierrePuerta.mp3") })
		game.schedule(4000, {game.sound("Nivel1.mp3") })
	}
	
	override method cargar() {
		game.clear()
		//game.onTick(6000, "nivel1 song", {self.sound()})
		super()
	}
	
	override method posicionDeReinicio() {
		return game.at(15,1)
	}
	
	override method sound() = game.sound("Nivel1.mp3")
	
	override method visuales() {
	
	//Fondo	
	suelo.crear(game.at(0,0), "nivel1.jpg" )  
		
	//Laberinto
    const ancho = game.width() - 1
    const largo = game.height() - 5
    
    var posBordes = []
    (0 .. ancho).forEach{ n => posBordes.add(game.at(n, 0))} // borde abajo
    (0 .. largo).forEach{ n => posBordes.add(game.at(0, n))} // borde izquierdo
    (0 .. largo).forEach{ n => posBordes.add(game.at(ancho, n))} // borde derecho	
		
    const posCentro = [game.at(1,0),game.at(1,2),game.at(1,4),game.at(1,5),game.at(1,11),game.at(2,0),game.at(2,2),game.at(2,5),game.at(2,7),
    	               game.at(2,8),game.at(2,9),game.at(2,11),game.at(3,0),game.at(3,2),game.at(3,3),game.at(3,7),game.at(3,9),game.at(3,11),
    	               game.at(4,0),game.at(4,3),game.at(4,5),game.at(4,6),game.at(4,7),game.at(4,11),game.at(5,0),game.at(5,1),game.at(5,6),
    	               game.at(5,9),game.at(5,10),game.at(5,11),game.at(6,0),game.at(6,1),game.at(6,2),game.at(6,3),game.at(6,4),game.at(6,6),
    	               game.at(6,7),game.at(6,9),game.at(6,11),game.at(7,0),game.at(7,4),game.at(7,6),game.at(7,11),game.at(8,0),game.at(8,2),
    	               game.at(8,6),game.at(8,7),game.at(8,8),game.at(8,9),game.at(8,11),game.at(9,0),game.at(9,2),game.at(9,3),game.at(9,4),
    	               game.at(9,6),game.at(9,9),game.at(9,11),game.at(10,0),game.at(10,4),game.at(10,5),game.at(10,6),game.at(10,8),game.at(10,9),
    	               game.at(10,11),game.at(10,12),game.at(11,0),game.at(11,1),game.at(11,2),game.at(11,6),game.at(11,8),game.at(11,13),game.at(12,0),
    	               game.at(12,4),game.at(12,6),game.at(12,8),game.at(12,9),game.at(12,11),game.at(12,12),game.at(13,0),game.at(13,2),game.at(13,3),
    	               game.at(13,4),game.at(13,9),game.at(13,10),game.at(13,11),game.at(14,0),game.at(14,2),game.at(14,4),game.at(14,5),game.at(14,6),
    	               game.at(14,7),game.at(14,11),game.at(15,0),game.at(15,2),game.at(15,4),game.at(15,6),game.at(15,7),game.at(15,9),game.at(15,11),
    	               game.at(16,0),game.at(16,1),game.at(16,2),game.at(16,9),game.at(16,11),game.at(17,0),game.at(17,2),game.at(17,4),game.at(17,5),
    	               game.at(17,6),game.at(17,7),game.at(17,9),game.at(17,10),game.at(17,11),game.at(18,0),game.at(18,2),game.at(18,3),game.at(18,4),
    	               game.at(18,6),game.at(18,11),game.at(19,0),game.at(19,2),game.at(19,4),game.at(19,6),game.at(19,8),game.at(19,10),game.at(19,11),
    	               game.at(20,0),game.at(20,8),game.at(20,11)]
                            
    posBordes.forEach({ posicion => new Pared().crear(posicion, "laberinto1.png")})                       
    posCentro.forEach({posicion => new Pared().crear(posicion, "laberinto1.png")})
  
    //Castillo	
	game.addVisualIn(castillo, game.at(2,12))
	//Puerta
	game.addVisualIn(puerta, game.at(11,12))
	
	//Fantasmas
    const fantasmasPos = [game.at(3, 4),game.at(6, 5), game.at(6, 10), game.at(11, 7),  game.at(16, 8)]
    fantasmasPos.forEach({pos => new Fantasma().crearFantasma(pos)})
    var fantasmaTrap = new Fantasma(position = game.at(1, 9), hp = 1, orientacion = arriba)
    var fantasmaTrap2 = new Fantasma(position = game.at(7, 1), hp = 1)
    game.addVisual(fantasmaTrap)
    fantasmaTrap.patrullar()
    game.addVisual(fantasmaTrap2)
    fantasmaTrap2.patrullar()
    game.onTick(10000, "activar fantasmatrap", { if(!game.hasVisual(fantasmaTrap2) and !game.hasVisual(fantasmaBoss)){fantasmaBoss.iniciarEvento()}})
	   
    //Sales
    const salesPos = [ game.at(1,1),game.at(9,8),game.at(15,5),game.at(17,1),game.at(18,5),game.at(20,10),game.at(18,10)]           
    salesPos.forEach({pos => new Sal().crear(pos)}) 
    //Flechas
    const flechasPos = [game.at(1,3),game.at(14,3),game.at(16,10)]
    flechasPos.forEach({pos => new Flecha().crear(pos)}) 	
    }
}

object nivel2 inherits Nivel{
    
    override method siguienteNivel(){
		self.siguienteNivel(nivel3)
	}
    
    override method siguienteNivel(nivel){
      	game.sound("aperturaPuerta.mp3")
		game.onCollideDo(cazador, {puerta => puerta.cambioDeEscenario(nivel)})
		game.schedule(2000, { game.sound("cierrePuerta.mp3") })
		game.schedule(4000, { nivel3.sound() })
	}
    
    override method cargar() {
		game.clear()
		//game.onTick(6000, "nivel2 song", {self.sound()})
		super()
		self.cargarObjetos()		
	}
	
	override method posicionDeReinicio() {
		return game.at(11,12)
	}
	
    override method sound() = game.sound("Nivel2.mp3")
	
    override method visuales() {
    	
    //Fondo
    suelo.crear(game.at(0,0), "nivel2.jpg" )  
    //Puerta
    game.addVisualIn(puerta, game.at(15,2))

    //Paredes
    const ancho = game.width() - 1
    const largo = game.height() - 3
    
    var posBordes = []
    (0 .. ancho).forEach{ n => posBordes.add(game.at(n, 0))} // borde abajo
    (0 .. ancho).forEach{ n => posBordes.add(game.at(n, largo))} // borde arriba
    (0 .. largo).forEach{ n => posBordes.add(game.at(0, n))} // borde izquierdo
    (0 .. largo).forEach{ n => posBordes.add(game.at(ancho, n))} // borde derecho

    const posCentro = [game.at(1,0),game.at(1,8),game.at(2,0),game.at(2,8),game.at(3,0),game.at(3,3),game.at(3,4),game.at(3,5),game.at(3,8),
    	               game.at(4,0),game.at(4,1),game.at(4,2),game.at(4,3),game.at(4,7),game.at(4,8),game.at(4,9),game.at(4,10),game.at(4,11),
    	               game.at(5,0),game.at(5,3),game.at(5,7),game.at(5,10),game.at(6,0),game.at(6,3),game.at(7,0),game.at(7,7),game.at(7,10),game.at(8,0),
    	               game.at(8,3),game.at(8,4),game.at(8,6),game.at(8,7),game.at(8,9),game.at(8,10),game.at(8,12),game.at(9,0),game.at(9,3),
    	               game.at(9,7),game.at(9,10),game.at(10,0),game.at(10,3),game.at(10,7),game.at(10,10),game.at(11,0),game.at(11,3),game.at(11,7),
    	               game.at(11,10),game.at(12,0),game.at(12,1),game.at(12,2),game.at(12,3),game.at(12,7),game.at(12,10),game.at(13,0),game.at(13,3),
    	               game.at(13,5),game.at(13,6),game.at(13,7),game.at(13,8),game.at(13,10),game.at(13,12),game.at(14,0),game.at(14,3),game.at(14,6),
    	               game.at(14,10),game.at(15,0),game.at(15,3),game.at(15,6),game.at(15,10),game.at(16,0),game.at(16,3),game.at(16,6),game.at(16,10),
    	               game.at(16,11),game.at(17,0),game.at(17,6),game.at(17,10),game.at(18,0),game.at(18,3),game.at(18,4),game.at(18,5),game.at(18,6),
    	               game.at(18,7),game.at(18,8),game.at(18,9),game.at(18,10),game.at(19,0),game.at(19,5),game.at(19,8),game.at(20,0),game.at(20,5)]
    
    posBordes.forEach({ posicion => new Pared().crear(posicion, "muroCastillo1.jpg")})                        
    posCentro.forEach({ posicion => new Pared().crear(posicion, "muroCastillo1.jpg")})
    
    //Brujas
    const brujasPos = [game.at(7, 2), game.at(2, 6), game.at(13, 4), game.at(6, 8), game.at(17, 12), game.at(4, 12)]
	brujasPos.forEach({pos => new Bruja().crearBruja(pos)})
    //Flechas
    const flechasPos = [game.at(3,1),game.at(15,11),game.at(13,9)]
    flechasPos.forEach({pos => new Flecha().crear(pos)})
    //Balas
    const balasPos = [game.at(1,10),game.at(19,4)]
    balasPos.forEach({pos => new Bala().crear(pos)})
    //Vida
    game.addVisualIn(new Vida(), game.at(11,1))
    //Ballesta
    game.addVisualIn(ballesta, game.at(19,6))    
    }
}

object nivel3 inherits Nivel{
	
	override method siguienteNivel() {}
	
	override method siguienteNivel(nivel) {}
    
    override method posicionDeReinicio() {
		return game.at(15,2)
	}
    
    override method cargar() {
		game.clear()
		game.onTick(8000, "dracula song", {self.sound()})
		super()	
	}
    
    override method sound() = game.sound("draculaSong.mp3")
    
    override method visuales() {
    
    //Fondo	
    suelo.crear(game.at(0,0), "nivel3.jpg" )  
    
    //Paredes
    const ancho = game.width() - 1
    const largo = game.height() - 3
    
    var posBordes = []
    (0 .. ancho).forEach{ n => posBordes.add(game.at(n, 0))} // borde abajo
    (0 .. ancho).forEach{ n => posBordes.add(game.at(n, largo))} // borde arriba
    (0 .. largo).forEach{ n => posBordes.add(game.at(0, n))} // borde izquierdo
    (0 .. largo).forEach{ n => posBordes.add(game.at(ancho, n))} // borde derecho
       
    const posCentro = [game.at(1,0),game.at(2,0),game.at(3,0),game.at(3,5),game.at(3,8),game.at(4,0),game.at(4,3),game.at(4,4),
    	               game.at(4,5),game.at(4,8),game.at(4,9),game.at(4,10),game.at(5,0),game.at(5,3),game.at(5,10),game.at(6,0),
    	               game.at(7,0),game.at(7,6),game.at(7,7),game.at(8,0),game.at(9,0),game.at(9,3),game.at(10,0),game.at(10,3),
    	               game.at(11,0),game.at(11,3),game.at(12,0),game.at(12,3),game.at(13,0),game.at(14,0),game.at(14,6),game.at(14,7),
    	               game.at(15,0),game.at(16,0),game.at(16,3),game.at(16,10),game.at(17,0),game.at(17,3),game.at(17,4),game.at(17,5),
    	               game.at(17,8),game.at(17,9),game.at(17,10),game.at(18,0),game.at(18,5),game.at(18,8),game.at(19,0),game.at(20,0)]
    
    posBordes.forEach({ posicion => new Pared().crear(posicion, "muroCastillo1.jpg")})                        
    posCentro.forEach({posicion => new Pared().crear(posicion, "muroCastillo1.jpg")})       
       
    //Murcielagos
    const murcielagosPos = [game.at(7, 2), game.at(16, 1), game.at(11, 5), game.at(3, 7), game.at(17, 6), game.at(14, 12), game.at(12, 8)] 
	murcielagosPos.forEach({pos => new Murcielago().crearMurcielago(pos)})
    //Balas
    const balasPos = [game.at(18,4),game.at(3,4),game.at(20,12),game.at(8,12)]  
    balasPos.forEach({pos => new Bala().crear(pos)})
    //Vida
    game.addVisual(new Vida(position = game.at(18,9))) 
    //Estaca 
    game.addVisualIn(estaca, game.at(3,9))
    //Pistola
    game.addVisualIn(pistolaDePlata, game.at(20,1))
    
    game.onTick(500, "activar final", { if(game.hasVisual(pistolaDePlata) and !game.hasVisual(dracula)){dracula.iniciarEvento()}})    
    }	
}