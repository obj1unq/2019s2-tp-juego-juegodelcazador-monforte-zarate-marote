import wollok.game.*
import cosasExtras.*
import enemigos.*
import armas.*
import personaje.*
import protecciones.*
import municion.*
import config.*
import objetosVisuales.*

object nivel1 {
	method iniciar() {
	   game.clear()
	   game.boardGround("fondoAzul.jpg")	
	
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
    	                     (7->0),(7->4),(7->6),(7->11),
    	                     (8->0),(8->2),(8->6),(8->7),(8->8),(8->9),(8->11),
    	                     (9->0),(9->2),(9->3),(9->4),(9->6),(9->9),(9->11),
    	                     (10->0),(10->4),(10->5),(10->6),(10->8),(10->9),(10->11),
    	                     (11->0),(11->1),(11->2),(11->6),(11->8),
    	                     (12->0),(12->4),(12->6),(12->8),(12->9),(12->11),
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
     
    // Fantasmas
    
    var fantasma2 = new Fantasma(position = game.at(3, 4), hp = 1)
    var fantasma3 = new Fantasma(position = game.at(7, 1), hp = 1)
    var fantasma4 = new Fantasma(position = game.at(2, 10), hp = 1)
    var fantasma5 = new Fantasma(position = game.at(11, 7), hp = 1)
    var fantasma7 = new Fantasma(position = game.at(16, 8), hp = 1)
    
    const fantasmas = [fantasma2,fantasma3,fantasma4,fantasma5,fantasma7]
    
    fantasmas.forEach({fantasma => 
    	game.addVisual(fantasma)
    	fantasma.patrullar()
    }) 
    
    const sales = [ new Sal(position = game.at(17,1)),new Sal(position = game.at(18,1)),new Sal(position = game.at(19,1)),
    	            new Sal(position = game.at(20,1)),new Sal(position = game.at(20,2))]
    	             
    sales.forEach({sal => game.addVisual(sal)}) 
     
    const vidas = [new Vida(position = game.at(1,1)),new Vida(position = game.at(18,5))] 
    
    vidas.forEach({vida => game.addVisual(vida)})
     
    const flechas = [new Flecha(position = game.at(1,3)),new Flecha(position = game.at(14,3)),new Flecha(position = game.at(16,10))]
    
    flechas.forEach({flecha => game.addVisual(flecha)})

	game.addVisual(cazador)
	
	//  CONFIG	
 	config.teclado()
	config.cartel()

    //colisiones
    game.whenCollideDo(cazador, {objeto => objeto.colisionasteCon(cazador)}) 

}    
  	
}

object nivel2 {
    method iniciar() {
    	
    game.ground("camino2.jpg")	
    
    /// LABERINTO

    const posicionesPared = [(0->0),(0->1),(0->2),(0->3),(0->4),(0->5),(0->6),(0->7),(0->8),(0->9),(0->10),(0->11),
    	                     (1->0),(1->8),(1->11),
    	                     (2->0),(2->8),(2->11),
    	                     (3->0),(3->3),(3->4),(3->5),(3->8),(3->11),
    	                     (4->0),(4->1),(4->2),(4->3),(4->7),(4->8),(4->9),(4->11),
    	                     (5->0),(5->3),(5->7),(5->11),
    	                     (6->0),(6->3),(6->11),
    	                     (7->0),(7->7),(7->11),
    	                     (8->0),(8->3),(8->4),(8->6),(8->7),(8->9),(8->10),(8->11),(8->12),(8->13),
    	                     (9->0),(9->3),(9->7),(9->10),(9->12),(9->13),
    	                     (10->0),(10->3),(10->7),(10->10),(10->13),
    	                     (11->0),(11->3),(11->7),(11->10),(11->13),
     	                     (12->0),(12->1),(12->2),(12->3),(12->7),(12->10),(12->13),
    	                     (13->0),(13->3),(13->5),(13->6),(13->7),(13->8),(13->10),(13->12),(13->13),
    	                     (14->0),(14->3),(14->6),(14->10),(14->13),
    	                     (15->0),(15->2),(15->3),(15->6),(15->10),(15->13),
    	                     (16->0),(16->3),(16->6),(16->10),(16->11),(16->13),
    	                     (17->0),(17->6),(17->10),(17->13),
    	                     (18->0),(18->3),(18->4),(18->5),(18->6),(18->7),(18->8),(18->10),(18->13),
    	                     (19->0),(19->5),(19->8),(19->13),
    	                     (20->0),(20->5),(20->13),
    	                     (21->0),(21->1),(21->2),(21->3),(21->4),(21->5),(21->6),(21->7),(21->8),(21->9),(21->10),(21->11),(21->12),(21->13)]
                            
    posicionesPared.forEach({posicion => new Pared().crear(posicion, "muroCastillo1.jpg")})
    
    //Brujas
     
    var bruja1 = new Bruja(position = game.at(7, 2), hp = 1)
    var bruja2 = new Bruja(position = game.at(2, 6), hp = 1)
    var bruja3 = new Bruja(position = game.at(13, 4), hp = 1)
    var bruja4 = new Bruja(position = game.at(6, 8), hp = 1)
    var bruja5 = new Bruja(position = game.at(17, 12), hp = 1)
    
    const brujas = [bruja1,bruja2,bruja3,bruja4,bruja5]
    
    brujas.forEach({bruja => 
    	game.addVisual(bruja)
    	bruja.patrullar()
    }) 
    
    const flechas = [new Flecha(position = game.at(3,1)),new Flecha(position = game.at(19,6))]
    
    flechas.forEach({flecha => game.addVisual(flecha)})
    
    const vidas = [new Vida(position = game.at(11,1)),new Vida(position = game.at(16,7))] 
    
    vidas.forEach({vida => game.addVisual(vida)})
    
    const balas = [new Bala(position = game.at(1,10)),new Bala(position = game.at(19,4))]
    
    balas.forEach({bala => game.addVisual(bala)})
    
    game.addVisualIn(ballesta, game.at(14,5))
    
    game.addVisual(cazador)
    
    //  CONFIG	
 	config.teclado()
	config.cartel()
	
    }
}

object nivel3 {
    method iniciar() {
    	
    game.boardGround("textura2.jpg")	
    
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
     
    var murcielago1 = new Murcielago(position = game.at(7, 2), hp = 1)
    var murcielago2 = new Murcielago(position = game.at(16, 1), hp = 1)
    var murcielago3 = new Murcielago(position = game.at(11, 5), hp = 1)
    var murcielago4 = new Murcielago(position = game.at(3, 7), hp = 1)
    var murcielago5 = new Murcielago(position = game.at(17, 6), hp = 1)
    var murcielago6 = new Murcielago(position = game.at(14, 12), hp = 1)
    var murcielago7 = new Murcielago(position = game.at(12, 8), hp = 1)

    
    const murcielagos = [murcielago1,murcielago2,murcielago3,murcielago4,murcielago5,murcielago6,murcielago7]
    
    murcielagos.forEach({murcielago => 
    	game.addVisual(murcielago)
    	murcielago.patrullar()
    }) 
    
    const vidas = [new Vida(position = game.at(3,10)),new Vida(position = game.at(18,9))] 
    
    vidas.forEach({vida => game.addVisual(vida)})
    
    const balas = [new Bala(position = game.at(18,4)),new Bala(position = game.at(3,4)),
    	           new Bala(position = game.at(20,12)),new Bala(position = game.at(8,12))    
    ]
    
    balas.forEach({bala => game.addVisual(bala)})
    
    game.addVisualIn(estacaYMartillo, game.at(3,9))
    
    game.addVisualIn(pistolaDePlata, game.at(20,1))
    
    game.addVisualIn(dracula, game.at(11,10))
 
    game.addVisual(cazador)    
    
    //  CONFIG	
 	config.teclado()
	config.cartel()
}	
	
}