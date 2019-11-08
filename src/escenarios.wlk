import wollok.game.*
import cosasExtras.*
import enemigos.*
import armas.*
import cazador.*

object primerEscenario {
	
	method iniciar() {
		
	game.ground("caminoLaberinto.png")	
	
	// CASTILLO	
		
	game.addVisualIn(castillo, game.at(11,12))	
		
	/// LABERINTO
    
    const paredesDeLaberinto = [
    	                        new Pared(position =(0->0)),new Pared(position =(0->1)),new Pared(position =(0->2)),
    	                        new Pared(position =(0->3)),new Pared(position =(0->4)),new Pared(position =(0->5)),
    	                        new Pared(position =(0->6)),new Pared(position =(0->7)),new Pared(position =(0->8)),
    	                        new Pared(position =(0->9)),new Pared(position =(0->10)),new Pared(position =(0->11)),
    	                        new Pared(position =(21->1)),new Pared(position =(21->2)),new Pared(position =(21->3)),
    	                        new Pared(position =(21->4)),new Pared(position =(21->5)),new Pared(position =(21->6)),
    	                        new Pared(position =(21->7)),new Pared(position =(21->8)),new Pared(position =(21->9)),
    	                        new Pared(position =(21->10)),new Pared(position =(21->11)),new Pared(position =(1->11)),
    	                        new Pared(position =(2->11)),new Pared(position =(3->11)),new Pared(position =(4->11)),
    	                        new Pared(position =(5->11)),new Pared(position =(6->11)),new Pared(position =(7->11)),
    	                        new Pared(position =(8->11)),new Pared(position =(9->11)),new Pared(position =(10->11)),
    	                        new Pared(position =(12->11)),new Pared(position =(13->11)),new Pared(position =(14->11)),
    	                        new Pared(position =(15->11)),new Pared(position =(16->11)),new Pared(position =(17->11)),
    	                        new Pared(position =(18->11)),new Pared(position =(19->11)),new Pared(position =(20->11)),
    	                        new Pared(position =(1->0)),new Pared(position =(2->0)),new Pared(position =(3->0)),
    	                        new Pared(position =(4->0)),new Pared(position =(5->0)),new Pared(position =(6->0)),
    	                        new Pared(position =(7->0)),new Pared(position =(8->0)),new Pared(position =(9->0)),
    	                        new Pared(position =(9->2)),new Pared(position =(9->3)),new Pared(position =(9->4)),
    	                        new Pared(position =(10->0)),new Pared(position =(11->0)),new Pared(position =(12->0)),
    	                        new Pared(position =(13->0)),new Pared(position =(15->0)),new Pared(position =(16->0)),
    	                        new Pared(position =(17->0)),new Pared(position =(18->0)),new Pared(position =(19->0)),
    	                        new Pared(position =(20->0)),new Pared(position =(21->0)),new Pared(position =(16->1)),
    	                        new Pared(position =(15->2)),new Pared(position =(16->2)),new Pared(position =(17->2)),
    	                        new Pared(position =(18->2)),new Pared(position =(19->2)),new Pared(position =(11->1)),
    	                        new Pared(position =(11->2)),new Pared(position =(14->2)),new Pared(position =(13->2)),
    	                        new Pared(position =(12->4)),new Pared(position =(13->3)),new Pared(position =(13->4)),
    	                        new Pared(position =(14->4)),new Pared(position =(19->4)),new Pared(position =(18->6)),
    	                        new Pared(position =(19->6)),new Pared(position =(19->8)),new Pared(position =(17->10)),
    	                        new Pared(position =(20->8)),new Pared(position =(15->9)),new Pared(position = (16->9)),
    	                        new Pared(position =(14->5)),new Pared(position =(14->6)),new Pared(position =(15->6)),
    	                        new Pared(position =(15->7)),new Pared(position =(12->9)),new Pared(position =(13->9)),
                                new Pared(position =(13->10)),new Pared(position =(12->8)),new Pared(position =(11->8)),
                                new Pared(position =(3->7)),new Pared(position =(8->2)),new Pared(position =(10->5)),
                                new Pared(position =(10->6)),new Pared(position =(9->6)),new Pared(position =(11->6)),
                                new Pared(position =(12->6)),new Pared(position =(6->1)),new Pared(position =(6->2)),
                                new Pared(position =(6->3)),new Pared(position =(7->4)),new Pared(position =(5->1)),
                                new Pared(position =(4->3)),new Pared(position =(3->3)),new Pared(position =(3->2)),
                                new Pared(position =(2->2)),new Pared(position =(1->2)),new Pared(position =(6->4)),
                                new Pared(position =(10->4)),new Pared(position =(17->9)),new Pared(position =(1->4)),
                                new Pared(position =(1->5)),new Pared(position =(2->5)),new Pared(position =(4->5)),
                                new Pared(position =(5->6)),new Pared(position =(4->6)),new Pared(position =(4->7)),
                                new Pared(position =(6->6)),new Pared(position =(6->7)),new Pared(position =(2->7)),
                                new Pared(position =(2->8)),new Pared(position =(2->9)),new Pared(position =(8->8)),
                                new Pared(position =(10->9)),new Pared(position =(10->8)),new Pared(position =(9->9)),
                                new Pared(position =(8->9)),new Pared(position =(8->6)),new Pared(position =(8->7)),
                                new Pared(position =(6->9)),new Pared(position =(14->7)),new Pared(position =(5->9)),
                                new Pared(position =(5->10)),new Pared(position =(3->9)),new Pared(position =(19->10)),
                                new Pared(position =(2->9)),new Pared(position =(15->4)),new Pared(position =(18->3)),
                                new Pared(position =(18->4)),new Pared(position =(17->4)),new Pared(position =(17->5)),
                                new Pared(position =(17->6)),new Pared(position =(17->7))]
                                      
    paredesDeLaberinto.forEach({pared => game.addVisual(pared)}) 
     
    const fantasmas = [new Fantasma(hp = 1,position = (3->1),atk = 1),new Fantasma(hp = 1,position = (3->4),atk = 1),
    	               new Fantasma(hp = 1,position = (9->1),atk = 1),new Fantasma(hp = 1,position = (7->5),atk = 1),
    	               new Fantasma(hp = 1,position = (2->10),atk = 1),new Fantasma(hp = 1,position = (8->10),atk = 1),
    	               new Fantasma(hp = 1,position = (11->7),atk = 1),new Fantasma(hp = 1,position = (19->1),atk = 1),
    	               new Fantasma(hp = 1,position = (15->8),atk = 1),new Fantasma(hp = 1,position = (5->8),atk = 1),
    	               new Fantasma(hp = 1,position = (15->3),atk = 1)]
    
    fantasmas.forEach({fantasma => game.addVisual(fantasma)}) 	                
     
    const sales = [ new Sal(position = (1->1)),new Sal(position = (1->3)),new Sal(position = (15->1)),
    	            new Sal(position = (17->1)),new Sal(position = (17->3)),new Sal(position = (9->8))]
    	             
    sales.forEach({sal => game.addVisual(sal)}) 
     
	game.addVisual(cazador)
    
    }
}

object segundoEscenario {
    
    method iniciar() {
    	
    game.ground("pasto3.png")	
    
    game.addVisual(cazador)
    }
}
