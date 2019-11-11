import wollok.game.*
import cosasExtras.*
import enemigos.*
import armas.*
import cazador.*
import protecciones.*

object primerEscenario {
	
	method iniciar() {
		
	game.ground("camino.png")	
	
	// CASTILLO	
		
	game.addVisualIn(castillo, game.at(2,12))	
	game.addVisualIn(puerta, game.at(11,12))
		
	/// LABERINTO

    const posicionesPared = [(0->0),(0->1),(0->2),(0->3),(0->4),(0->5),(0->6),(0->7),(0->8),(0->9),(0->10),(0->11),
    	                     (1->0),(1->2),(1->4),(1->5),(1->11),
    	                     (2->0),(2->2),(2->5),(2->7),(2->8),(2->9),(2->11),
    	                     (3->0),(3->2),(3->3),(3->7),(3->9),(3->11),
    	                     (4->0),(4->3),(4->5),(4->6),(4->7),(4->11),
    	                     (5->0),(5->1),(5->6),(5->9),(5->10),(5->11),
    	                     (6->0),(6->1),(6->2),(6->3),(6->4),(6->6),(6->7),(6->9),(6->11),
    	                     (7->0),(7->4),(7->11),
    	                     (8->0),(8->2),(8->6),(8->7),(8->8),(8->9),(8->11),
    	                     (9->0),(9->2),(9->3),(9->4),(9->6),(9->9),(9->11),
    	                     (10->0),(10->4),(10->5),(10->6),(10->8),(10->9),(10->11),
    	                     (11->0),(11->1),(11->2),(11->6),(11->8),
    	                     (12->0),(12->4),(12->6),(12->8),(12->9),(12->11),
    	                     (13->0),(13->2),(13->3),(13->4),(13->9),(13->10),(13->11),
    	                     (14->2),(14->4),(14->5),(14->6),(14->7),(14->11),
    	                     (15->0),(15->2),(15->4),(15->6),(15->7),(15->9),(15->11),
    	                     (16->0),(16->1),(16->2),(16->9),(16->11),
    	                     (17->0),(17->2),(17->4),(17->5),(17->6),(17->7),(17->9),(17->10),(17->11),
    	                     (18->0),(18->2),(18->3),(18->4),(18->6),(18->11),
    	                     (19->0),(19->2),(19->4),(19->6),(19->8),(19->10),(19->11),
    	                     (20->0),(20->8),(20->11),
    	                     (21->0),(21->1),(21->2),(21->3),(21->4),(21->5),(21->6),(21->7),(21->8),(21->9),(21->10),(21->11)]
                            
    posicionesPared.forEach({posicion => new Pared().crear(posicion)})
     
    // Fantasmas
    
    var fantasma1 = new Fantasma(position = (3->1), hp = 1)
    var fantasma2 = new Fantasma(position = (3->4), hp = 1)
    var fantasma3 = new Fantasma(position = (9->1), hp = 1)
    var fantasma4 = new Fantasma(position = (7->5), hp = 1)
    var fantasma5 = new Fantasma(position = (2->10), hp = 1)
    var fantasma6 = new Fantasma(position = (8->10), hp = 1)
    var fantasma7 = new Fantasma(position = (11->7), hp = 1)
    var fantasma8 = new Fantasma(position = (19->1), hp = 1)
    var fantasma9 = new Fantasma(position = (5->8), hp = 1)
    var fantasma10 = new Fantasma(position = (15->3), hp = 1)
    var fantasma11 = new Fantasma(position = (16->8), hp = 1)
    
    const fantasmas = [fantasma1,fantasma2,fantasma3,fantasma4,fantasma5,
    	               fantasma6,fantasma7,fantasma8,fantasma9,fantasma10,
    	               fantasma11]
    
    fantasmas.forEach({fantasma => 
    	game.addVisual(fantasma)
    	//fantasma.patrullar()
    }) 
    
    const sales = [ new Sal(position = (1->1)),new Sal(position = (1->3)),new Sal(position = (15->1)),
    	            new Sal(position = (17->1)),new Sal(position = (17->3)),new Sal(position = (9->8))]
    	             
    sales.forEach({sal => game.addVisual(sal)}) 
     
    const vidas = [new Vida(position = (5->7)),new Vida(position = (20->10))] 
    
    vidas.forEach({vida => game.addVisual(vida)})
     
    const flechas = [new Flechas(position = (19->3)),new Flechas(position = (15->5))]
    
    flechas.forEach({flecha => game.addVisual(flecha)})
     
    //Personaje principal
     
	game.addVisual(cazador)
    
    //Activar boss final
    self.activacioDeBoss(cazador) 
    }
    
    method activacioDeBoss(cazador) {
    	const fantasma = new Fantasma(position = (8->10), hp = 1)
    	if (not fantasma.estaVivo())
        game.addVisualIn(fantasmaBoss,(11->11))
    }
}

object segundoEscenario {
    
    method iniciar() {
    	
    game.ground("pasto3.png")	
    
    game.addVisual(cazador)
    }
}