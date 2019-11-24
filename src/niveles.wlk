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
	}

	method cazador() {
		// Personaje
		game.addVisual(cazador)
		// Colisiones 
		game.whenCollideDo(cazador, { 
			objeto => objeto.colisionarCon(cazador)
		})
	}
	
	method sound()
	
	method controles() {
		
	  keyboard.up().onPressDo{ cazador.mover(cazador.position().up(1), arriba)}
	  keyboard.down().onPressDo{ cazador.mover(cazador.position().down(1), abajo)}
	  keyboard.left().onPressDo{ cazador.mover(cazador.position().left(1), izquierda)}
	  keyboard.right().onPressDo{ cazador.mover(cazador.position().right(1), derecha)}
	  keyboard.t().onPressDo({ cazador.trampaDeSal()})
      keyboard.r().onPressDo({ cazador.recoger()})
      keyboard.e().onPressDo({ cazador.soltar()})
      keyboard.a().onPressDo({ cazador.ataqueA()})
	  keyboard.num1().onPressDo({ cazador.equipar(ballesta) })
      keyboard.num2().onPressDo({ cazador.equipar(estacaYMartillo) })
      keyboard.num3().onPressDo({ cazador.equipar(pistolaDePlata) })
      keyboard.space().onPressDo({ self.siguienteNivel()})
	}

	method visuales()  // cada nivel maneja su propio visuales / fondo, enemigos y objetos

	method ganaste(){} 
	 
	method siguienteNivel() 
	 
	method siguienteNivel(nivel)
	
	method perdiste(){
		game.onTick(1000,"self",{
			game.clear()
		})
	}
	
	method cartel(){ 
 		game.addVisual(new GraficaParaCartel("CartelVidas.png",game.at(0, 14)))
 		game.addVisual(encabezado)
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
	
	override method siguienteNivel(nivel) {
		game.schedule(6000, { nivel.cargar()} )
	}
	
	override method visuales() {
		suelo.crear(game.at(0,0), "controles.jpg" ) 
		game.addVisual(teclaUp)
		game.addVisual(teclaDown)
		game.addVisual(teclaLeft)
		game.addVisual(teclaRight)
        game.addVisual(tecla1)
		game.addVisual(tecla2)
		game.addVisual(tecla3)
		game.addVisual(tecla4)
		game.addVisual(teclaR)
		game.addVisual(teclaS)
		game.addVisual(teclaE)
		game.addVisual(teclaA)
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
		game.schedule(2000, { game.sound("cierrePuerta.mp3") })
		game.onTick(4000, "nivel 1 musica", {game.sound("Nivel1.mp3") })
	}
	
	override method cargar() {
		game.clear()
		super()
	}
	
	override method sound() = game.sound("Nivel1.mp3")
	
	override method visuales() {
	suelo.crear(game.at(0,0), "nivel1.jpg" )  
		
	   /// LABERINTO
    const posicionesPared = [(0->0),(0->1),(0->2),(0->3),(0->4),(0->5),(0->6),(0->7),(0->8),(0->9),(0->10),(0->11),
    	                     (1->0),(1->2),(1->4),(1->5),(1->11),
    	                     (2->0),(2->2),(2->5),(2->7),(2->8),(2->9),(2->11),
    	                     (3->0),(3->2),(3->3),(3->7),(3->9),(3->11),
    	                     (4->0),(4->3),(4->5),(4->6),(4->7),(4->11),
    	                     (5->0),(5->1),(5->6),(5->9),(5->10),(5->11),
    	                     (6->0),(6->1),(6->2),(6->3),(6->4),(6->6),(6->7),(6->9),(6->11),
    	                     (7->0),(7->4),(7->6),(7->11),
    	                     (8->0),(8->2),(8->6),(8->7),(8->8),(8->9),(8->11),
    	                     (9->0),(9->2),(9->3),(9->4),(9->6),(9->9),(9->11),
    	                     (10->0),(10->4),(10->5),(10->6),(10->8),(10->9),(10->11),(10->12),
    	                     (11->0),(11->1),(11->2),(11->6),(11->8),(11->13),
    	                     (12->0),(12->4),(12->6),(12->8),(12->9),(12->11),(12->12),
    	                     (13->0),(13->2),(13->3),(13->4),(13->9),(13->10),(13->11),
    	                     (14->0),(14->2),(14->4),(14->5),(14->6),(14->7),(14->11),
    	                     (15->0),(15->2),(15->4),(15->6),(15->7),(15->9),(15->11),
    	                     (16->0),(16->1),(16->2),(16->9),(16->11),
    	                     (17->0),(17->2),(17->4),(17->5),(17->6),(17->7),(17->9),(17->10),(17->11),
    	                     (18->0),(18->2),(18->3),(18->4),(18->6),(18->11),
    	                     (19->0),(19->2),(19->4),(19->6),(19->8),(19->10),(19->11),
    	                     (20->0),(20->8),(20->11),
    	                     (21->0),(21->1),(21->2),(21->3),(21->4),(21->5),(21->6),(21->7),(21->8),(21->9),(21->10),(21->11)]
                            
    posicionesPared.forEach({posicion => new Pared().crear(posicion, "laberinto1.png")})
    
    // CASTILLO	
	game.addVisualIn(castillo, game.at(2,12))
	puerta.crear(game.at(11,12), "puerta.png")
	
	// Fantasmas
   // const fantasmasPos = [game.at(3, 4), /*game.at(7, 1),game.at(2, 10),*/  game.at(11, 7),  game.at(16, 8)]
    //fantasmasPos.forEach({pos => new Fantasma().crearFantasma(pos)})
    //var fantasmaTrap = new Fantasma(position = game.at(1, 9), hp = 1, orientacion = arriba)
    //var fantasmaTrap2 = new Fantasma(position = game.at(7, 1), hp = 1)
    //game.addVisual(fantasmaTrap)
    //fantasmaTrap.patrullar()
    //game.addVisual(fantasmaTrap2)
    //fantasmaTrap2.patrullar()
    //game.onTick(10000, "activar fantasmatrap", { if(!game.hasVisual(fantasmaTrap2) and !game.hasVisual(fantasmaBoss)){fantasmaBoss.iniciarEvento()}})
	   
    // Sales
    const sales = [ new Sal(position = game.at(17,1)),new Sal(position = game.at(18,1)),new Sal(position = game.at(19,1)),
    	            new Sal(position = game.at(20,1)),new Sal(position = game.at(20,2))]           
    sales.forEach({sal => game.addVisual(sal)}) 
     
    // Vidas
    const vidas = [new Vida(position = game.at(1,1)),new Vida(position = game.at(18,5))] 
    vidas.forEach({vida => game.addVisual(vida)})
     
    // Flechas
    const flechas = [new Flecha(position = game.at(1,3)),new Flecha(position = game.at(14,3)),new Flecha(position = game.at(16,10))]
    flechas.forEach({flecha => game.addVisual(flecha)}) 	
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
		super()	
	}
    
    override method sound() = game.sound("Nivel2.mp3")
	
    override method visuales() {
    suelo.crear(game.at(0,0), "nivel2.jpg" )  
    
    puerta.crear(game.at(15,2), "puerta.png")

    const posicionesPared = [(0->0),(0->1),(0->2),(0->3),(0->4),(0->5),(0->6),(0->7),(0->8),(0->9),(0->10),(0->11),(0->12),(0->13),
    	                     (1->0),(1->8),(1->11),(1->13),
    	                     (2->0),(2->8),(2->11),(2->13),
    	                     (3->0),(3->3),(3->4),(3->5),(3->8),(3->11),(3->13),
    	                     (4->0),(4->1),(4->2),(4->3),(4->7),(4->8),(4->9),(4->10),(4->11),(4->13),
    	                     (5->0),(5->3),(5->7),(5->13),
    	                     (6->0),(6->3),(6->13),
    	                     (7->0),(7->7),(7->10),(7->13),
    	                     (8->0),(8->3),(8->4),(8->6),(8->7),(8->9),(8->10),(8->12),(8->13),
    	                     (9->0),(9->3),(9->7),(9->10),(9->13),
    	                     (10->0),(10->3),(10->7),(10->10),(10->13),
    	                     (11->0),(11->3),(11->7),(11->10),(11->13),
     	                     (12->0),(12->1),(12->2),(12->3),(12->7),(12->10),(12->13),
    	                     (13->0),(13->3),(13->5),(13->6),(13->7),(13->8),(13->10),(13->12),(13->13),
    	                     (14->0),(14->3),(14->6),(14->10),(14->13),
    	                     (15->0),(15->3),(15->6),(15->10),(15->13),
    	                     (16->0),(16->3),(16->6),(16->10),(16->11),(16->13),
    	                     (17->0),(17->6),(17->10),(17->13),
    	                     (18->0),(18->3),(18->4),(18->5),(18->6),(18->7),(18->8),(18->10),(18->13),
    	                     (19->0),(19->5),(19->8),(19->13),
    	                     (20->0),(20->5),(20->13),
    	                     (21->0),(21->1),(21->2),(21->3),(21->4),(21->5),(21->6),(21->7),(21->8),(21->9),(21->10),(21->11),(21->12),(21->13)]
                            
    posicionesPared.forEach({posicion => new Pared().crear(posicion, "muroCastillo1.jpg")})
    
    //Brujas
    //const brujasPos = [game.at(7, 2), game.at(2, 6), game.at(13, 4), game.at(6, 8), game.at(17, 12), game.at(4, 12)]
	//brujasPos.forEach({pos => new Bruja().crearBruja(pos)})
    
    const flechas = [new Flecha(position = game.at(3,1)),new Flecha(position = game.at(15,11)),
    	             new Flecha(position = game.at(13,9))]
    
    flechas.forEach({flecha => game.addVisual(flecha)})
    
    const vidas = [new Vida(position = game.at(11,1)),new Vida(position = game.at(16,7))] 
    
    vidas.forEach({vida => game.addVisual(vida)})
    
    const balas = [new Bala(position = game.at(1,10)),new Bala(position = game.at(19,4))]
    
    balas.forEach({bala => game.addVisual(bala)})
    
    game.addVisualIn(ballesta, game.at(14,5))
    
    }
}

object nivel3 inherits Nivel{
	
	override method siguienteNivel() {}
	
	override method siguienteNivel(nivel) {}
    
    override method cargar() {
		game.clear()
		game.onTick(18000, "dracula song", {self.sound()})
		super()	
	}
    
    override method sound() = game.sound("draculaSong.mp3")
    
    override method visuales() {
    suelo.crear(game.at(0,0), "nivel3.jpg" )  
    /// LABERINTO
    const posicionesPared = [(0->0),(0->1),(0->2),(0->3),(0->4),(0->5),(0->6),(0->7),(0->8),(0->9),(0->10),(0->11),
    	                     (1->0),(1->11),
    	                     (2->0),(2->11),
    	                     (3->0),(3->5),(3->8),(3->11),
    	                     (4->0),(4->3),(4->4),(4->5),(4->8),(4->9),(4->10),(4->11),
    	                     (5->0),(5->3),(5->10),(5->11),
    	                     (6->0),(6->11),
    	                     (7->0),(7->6),(7->7),(7->11),(7->12),(7->13),
    	                     (8->0),(8->13),
    	                     (9->0),(9->3),(9->13),
    	                     (10->0),(10->3),(10->13),
    	                     (11->0),(11->3),(11->13),
     	                     (12->0),(12->3),(12->13),
    	                     (13->0),(13->13),
    	                     (14->0),(14->6),(14->7),(14->13),
    	                     (15->0),(15->13),
    	                     (16->0),(16->3),(16->10),(16->13),
    	                     (17->0),(17->3),(17->4),(17->5),(17->8),(17->9),(17->10),(17->13),
    	                     (18->0),(18->5),(18->8),(18->13),
    	                     (19->0),(19->13),
    	                     (20->0),(20->13),
    	                     (21->0),(21->1),(21->2),(21->3),(21->4),(21->5),(21->6),(21->7),(21->8),(21->9),(21->10),(21->11),(21->12),(21->13)]
                            
    posicionesPared.forEach({posicion => new Pared().crear(posicion, "muroCastillo1.jpg")})
       
    //Murcielagos
    //const murcielagosPos = [game.at(7, 2), game.at(16, 1), game.at(11, 5), game.at(3, 7), game.at(17, 6), game.at(14, 12), game.at(12, 8)] 
	//murcielagosPos.forEach({pos => new Murcielago().crearMurcielago(pos)})

    
    const vidas = [new Vida(position = game.at(3,10)),new Vida(position = game.at(18,9))] 
    
    vidas.forEach({vida => game.addVisual(vida)})
    
    const balas = [new Bala(position = game.at(18,4)),new Bala(position = game.at(3,4)),
    	           new Bala(position = game.at(20,12)),new Bala(position = game.at(8,12))]
    
    balas.forEach({bala => game.addVisual(bala)})
    
    game.addVisualIn(estacaYMartillo, game.at(3,9))
    
    game.addVisualIn(pistolaDePlata, game.at(20,1))
    
    dracula.position(game.at(11, 10))
    
    game.addVisual(dracula)
    
    dracula.elVerdaderoDesafio()    
    }	
}