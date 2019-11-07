import wollok.game.*
import cosasExtras.*
import enemigos.*
import armas.*
import cazador.*

object primerEscenario {
	
	method iniciar() {
		
	game.ground("camino2.png")	
	
	// CASTILLO	
		
	game.addVisualIn(castillo, game.at(11,12))	
		
	/// CAMINOS
    // MODIFICAR CON FOREACH
    
    // Se asigna imagen a pared de laberinto
    //pared.image("pasto2.png")
    
    const paredesDeLaberinto = [
    	                    new Pared(position =(0->0),image = "pasto5.png"),new Pared(position =(0->1),image = "pasto5.png"),
    	                    new Pared(position =(0->2),image = "pasto5.png"),new Pared(position =(0->3),image = "pasto5.png"),
    	                    new Pared(position =(0->4),image = "pasto5.png"),new Pared(position =(0->5),image = "pasto5.png"),
    	                    new Pared(position =(0->6),image = "pasto5.png"),new Pared(position =(0->7),image = "pasto5.png"),
    	                    new Pared(position =(0->8),image = "pasto5.png"),new Pared(position =(0->9),image = "pasto5.png"),
    	                    new Pared(position =(0->10),image = "pasto5.png"),new Pared(position =(0->11),image = "pasto5.png"),
    	                    new Pared(position =(21->1),image = "pasto5.png"),
    	                    new Pared(position =(21->2),image = "pasto5.png"),new Pared(position =(21->3),image = "pasto5.png"),
    	                    new Pared(position =(21->4),image = "pasto5.png"),new Pared(position =(21->5),image = "pasto5.png"),
    	                    new Pared(position =(21->6),image = "pasto5.png"),new Pared(position =(21->7),image = "pasto5.png"),
    	                    new Pared(position =(21->8),image = "pasto5.png"),new Pared(position =(21->9),image = "pasto5.png"),
    	                    new Pared(position =(21->10),image = "pasto5.png"),new Pared(position =(21->11),image = "pasto5.png"),
    	                    new Pared(position =(1->11),image = "pasto5.png"),new Pared(position =(2->11),image = "pasto5.png"),
    	                    new Pared(position =(3->11),image = "pasto5.png"),new Pared(position =(4->11),image = "pasto5.png"),
    	                    new Pared(position =(5->11),image = "pasto5.png"),new Pared(position =(6->11),image = "pasto5.png"),
    	                    new Pared(position =(7->11),image = "pasto5.png"),new Pared(position =(8->11),image = "pasto5.png"),
    	                    new Pared(position =(9->11),image = "pasto5.png"),new Pared(position =(10->11),image = "pasto5.png"),
    	                    new Pared(position =(12->11),image = "pasto5.png"),new Pared(position =(13->11),image = "pasto5.png"),
    	                    new Pared(position =(14->11),image = "pasto5.png"),new Pared(position =(15->11),image = "pasto5.png"),
    	                    new Pared(position =(16->11),image = "pasto5.png"),new Pared(position =(17->11),image = "pasto5.png"),
    	                    new Pared(position =(18->11),image = "pasto5.png"),new Pared(position =(19->11),image = "pasto5.png"),
    	                    new Pared(position =(20->11),image = "pasto5.png"),new Pared(position =(1->0),image = "pasto5.png"),
    	                    new Pared(position =(2->0),image = "pasto5.png"),new Pared(position =(3->0),image = "pasto5.png"),
    	                    new Pared(position =(4->0),image = "pasto5.png"),new Pared(position =(5->0),image = "pasto5.png"),
    	                    new Pared(position =(6->0),image = "pasto5.png"),new Pared(position =(7->0),image = "pasto5.png"),
    	                    new Pared(position =(8->0),image = "pasto5.png"),new Pared(position =(9->0),image = "pasto5.png"),
    	                    new Pared(position =(10->0),image = "pasto5.png"),new Pared(position =(11->0),image = "pasto5.png"),
    	                    new Pared(position =(12->0),image = "pasto5.png"),new Pared(position =(13->0),image = "pasto5.png"),
    	                    new Pared(position =(15->0),image = "pasto5.png"),new Pared(position =(16->0),image = "pasto5.png"),
    	                    new Pared(position =(17->0),image = "pasto5.png"),new Pared(position =(18->0),image = "pasto5.png"),
    	                    new Pared(position =(19->0),image = "pasto5.png"),new Pared(position =(20->0),image = "pasto5.png"),
    	                    new Pared(position =(21->0),image = "pasto5.png"),new Pared(position =(16->1),image = "pasto5.png"),
    	                    new Pared(position =(15->2),image = "pasto5.png"),new Pared(position =(16->2),image = "pasto5.png"),
    	                    new Pared(position =(17->2),image = "pasto5.png"),new Pared(position =(18->2),image = "pasto5.png"),
    	                    new Pared(position =(19->2),image = "pasto5.png"),new Pared(position =(11->1),image = "pasto5.png"),
    	                    new Pared(position =(11->2),image = "pasto5.png"),new Pared(position =(14->2),image = "pasto5.png"),
    	                    new Pared(position =(13->2),image = "pasto5.png"),new Pared(position =(12->4),image = "pasto5.png"),
    	                    new Pared(position =(13->3),image = "pasto5.png"),new Pared(position =(13->4),image = "pasto5.png"),
    	                    new Pared(position =(14->4),image = "pasto5.png"),
    	                    new Pared(position =(17->4),image = "pasto5.png"),
    	                    new Pared(position =(9->3),image = "pasto5.png"),
    	                    new Pared(position =(9->2),image = "pasto5.png"),new Pared(position =(9->4),image = "pasto5.png"),
    	                    new Pared(position =(18->3),image = "pasto5.png"),new Pared(position =(15->4),image = "pasto5.png"),
    	                    new Pared(position =(17->5),image = "pasto5.png"),new Pared(position =(17->6),image = "pasto5.png"),
    	                    new Pared(position =(17->7),image = "pasto5.png"),new Pared(position =(18->4),image = "pasto5.png"),
    	                    new Pared(position =(19->4),image = "pasto5.png"),new Pared(position =(18->6),image = "pasto5.png"),
    	                    new Pared(position =(19->6),image = "pasto5.png"),new Pared(position =(19->8),image = "pasto5.png"),
    	                    new Pared(position =(17->10),image = "pasto5.png"),new Pared(position =(20->8),image = "pasto5.png"),
    	                    new Pared(position =(15->9),image = "pasto5.png"),new Pared(position = (16->9),image = "pasto5.png"),
    	                    new Pared(position =(14->5),image = "pasto5.png"),new Pared(position =(14->6),image = "pasto5.png"),                       
    	                    new Pared(position =(15->6),image = "pasto5.png"),new Pared(position =(15->7),image = "pasto5.png"),
                            new Pared(position =(12->9),image = "pasto5.png"),new Pared(position =(13->9),image = "pasto5.png"),
                            new Pared(position =(13->10),image = "pasto5.png"),new Pared(position =(12->8),image = "pasto5.png"),
                            new Pared(position =(11->8),image = "pasto5.png"),new Pared(position =(3->7),image = "pasto5.png"),
                            new Pared(position =(8->2),image = "pasto5.png"),new Pared(position =(10->5),image = "pasto5.png"),
                            new Pared(position =(10->6),image = "pasto5.png"),new Pared(position =(9->6),image = "pasto5.png"),
                            new Pared(position =(11->6),image = "pasto5.png"),new Pared(position =(12->6),image = "pasto5.png"),
                            new Pared(position =(6->1),image = "pasto5.png"),new Pared(position =(6->2),image = "pasto5.png"),
                            new Pared(position =(6->3),image = "pasto5.png"),new Pared(position =(7->4),image = "pasto5.png"),
                            new Pared(position =(5->1),image = "pasto5.png"),new Pared(position =(4->3),image = "pasto5.png"),
                            new Pared(position =(3->3),image = "pasto5.png"),new Pared(position =(3->2),image = "pasto5.png"),
                            new Pared(position =(2->2),image = "pasto5.png"),new Pared(position =(1->2),image = "pasto5.png"),
                            new Pared(position =(6->4),image = "pasto5.png"),new Pared(position =(10->4),image = "pasto5.png"),
                            new Pared(position =(17->9),image = "pasto5.png"),new Pared(position =(1->4),image = "pasto5.png"),
                            new Pared(position =(1->5),image = "pasto5.png"),new Pared(position =(2->5),image = "pasto5.png"),
                            new Pared(position =(4->5),image = "pasto5.png"),new Pared(position =(5->6),image = "pasto5.png"),
                            new Pared(position =(4->6),image = "pasto5.png"),new Pared(position =(4->7),image = "pasto5.png"),
                            new Pared(position =(6->6),image = "pasto5.png"),new Pared(position =(6->7),image = "pasto5.png"),
                            new Pared(position =(2->7),image = "pasto5.png"),new Pared(position =(2->8),image = "pasto5.png"),
                            new Pared(position =(2->9),image = "pasto5.png"),new Pared(position =(8->8),image = "pasto5.png"),
                            new Pared(position =(10->9),image = "pasto5.png"),new Pared(position =(10->8),image = "pasto5.png"),
                            new Pared(position =(9->9),image = "pasto5.png"),new Pared(position =(8->9),image = "pasto5.png"),
                            new Pared(position =(8->6),image = "pasto5.png"),new Pared(position =(8->7),image = "pasto5.png"),
                            new Pared(position =(6->9),image = "pasto5.png"),new Pared(position =(14->7),image = "pasto5.png"),
                            new Pared(position =(5->9),image = "pasto5.png"),new Pared(position =(5->10),image = "pasto5.png"),
                            new Pared(position =(3->9),image = "pasto5.png"),new Pared(position =(19->10),image = "pasto5.png"),
                            new Pared(position =(2->9),image = "pasto5.png")]
                    
                            
                            
                            
    paredesDeLaberinto.forEach({pared => game.addVisual(pared)}) 
     
	game.addVisual(cazador)
	
	/* 
	/// FANTASMAS
	 
	game.addVisualIn(new FantasmaPoderoso(), game.at( 12, 7))
	game.addVisualIn(new Fantasma(), game.at( 12, 6))
    game.addVisualIn(new Fantasma(), game.at( 12, 10))
    game.addVisualIn(new Fantasma(), game.at( 7, 8)) 
    game.addVisualIn(new Fantasma(), game.at( 1, 8))
    game.addVisualIn(new Fantasma(), game.at( 23, 11)) 
    game.addVisualIn(new Fantasma(), game.at( 18, 8)) 
	
	game.addVisualIn(new Murcielago(), game.at( 15, 4)) 
    game.addVisualIn(new Ballesta(), game.at( 11, 5)) 
	game.addVisualIn(new ArmaDePlata(), game.at( 10, 5)) 
	game.addVisualIn(new Ajo(), game.at( 9, 5)) 
	game.addVisualIn(new EstacaYMartillo(), game.at( 8, 5)) 
	game.addVisualIn(new Bruja(), game.at( 7, 5)) 
	game.addVisualIn(dracula, game.at( 6, 5)) 
	
	// SALES
	
	game.addVisualIn(new Sal(), game.at( 21, 2))
    game.addVisualIn(new Sal(), game.at( 19, 8)) 
    game.addVisualIn(new Sal(), game.at( 1, 10))
    game.addVisualIn(new Sal(), game.at( 24, 11)) 
    game.addVisualIn(new Sal(), game.at( 5, 9))    
    
    */ 
    }
}

object segundoEscenario {
    
    method iniciar() {
    	
    game.ground("pasto3.png")	
    
    game.addVisual(cazador)
    }
}
